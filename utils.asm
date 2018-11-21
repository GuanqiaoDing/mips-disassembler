.data
letterL:	.asciiz		"L"
space: 		.asciiz		" "
new_line: 	.asciiz		"\n"
tab: 		.asciiz		"\t"
dollar: 	.asciiz		"$"
left_bracket:	.asciiz		"("
right_bracket:	.asciiz		")"
comma:		.asciiz		","
colon:		.asciiz		":"
type_word:	.asciiz		".word\t"
type_space:	.asciiz		".space\t"
type_data:	.asciiz		".data\n"
type_text:	.asciiz		".text\n"

.text
.globl print_label print_comma print_string print_rs print_rt print_rd print_shamt print_branch_target print_immediate

####################### Utility print functions: ##################################################################
####################### function that prints the label
print_label:		move	$t8, $a0			# save $a0 to $t8
			la	$a0, letterL			# load address of "L"
			li	$v0, 4				# set syscall to print string
			syscall					# print "L"
			move	$a0, $t8			# retrieve $a0
			li 	$v0, 1				# set syscall to print integer
			syscall					# print label
			la 	$a0, colon			# load address of colon
			li	$v0, 4				# set syscall to print string
			syscall					# print colon
			la 	$a0, tab			# load address of tab
			syscall					# print tab
			jr 	$ra				# return to the caller

####################### function that prints the comma and space	
print_comma:		la	$a0, comma			# load address of comma		
			li	$v0, 4				# set syscall to print string
			syscall					# print comma
			la	$a0, space			# load address of space
			syscall					# print space
			jr	$ra				# return to the the caller	

####################### function that prints the instruction or register name based on offset
print_string:		sll 	$a0, $a0, 2			# multiply $a0 by 4
			add 	$a0, $a0, $a1			# add $a0 to $a1
			lw 	$a0, 0($a0)			# load word to get the offset
			add 	$a0, $a2, $a0			# add $a0 to $a2 to get the address
			li 	$v0, 4				# set syscall to print string
			syscall					# print the name
			jr 	$ra				# return to the caller		

####################### function that prints rs register
print_rs:		srl	$a0, $a0, 21			# shift right 21 bits
			andi	$a0, $a0, 31			# gets the rs field
			move	$a1, $s3			# $a1 is base address of offset_register array
			move	$a2, $s6			# $a2 is base address of name_register array
			move	$t8, $ra			# copy $ra to $t8
			jal	print_string			# print rs register
			move	$ra, $t8			# retrieve $ra
			jr	$ra				# return to the caller

####################### function that prints rt register
print_rt:		srl	$a0, $a0, 16			# shift right 16 bits
			andi	$a0, $a0, 31			# gets the rt field
			move	$a1, $s3			# $a1 is base address of offset_register array
			move	$a2, $s6			# $a2 is base address of name_register array
			move	$t8, $ra			# copy $ra to $t8
			jal	print_string			# print rt register
			move	$ra, $t8			# retrieve $ra
			jr	$ra				# return to the caller

####################### function that prints rd register
print_rd:		srl	$a0, $a0, 11			# shift right 11 bits
			andi	$a0, $a0, 31			# gets the rd field
			move	$a1, $s3			# $a1 is base address of offset_register array
			move	$a2, $s6			# $a2 is base address of name_register array
			move	$t8, $ra			# copy $ra to $t8
			jal	print_string			# print rd register
			move	$ra, $t8			# retrieve $ra
			jr	$ra				# return to the caller

####################### function that prints shamt value
print_shamt:		srl	$a0, $a0, 6			# shift right 6 bits
			andi	$a0, $a0, 31			# gets the shamt field
			li 	$v0, 1				# set syscall to print integer
			syscall					# print shamt
			jr	$ra				# return to the caller

####################### function that prints branch target label
print_branch_target:	move	$t8, $a0			# save $a0 to $t8
			la	$a0, letterL			# load address of "L"
			li	$v0, 4				# set syscall to print string
			syscall					# print "L"

			andi	$t2, $t8, 0xffff		# $t2 gets the immediate field
			andi	$t3, $t8, 0x8000		# $t3 gets the sign bit
			beq 	$t3, $zero, positive_offset 	# branch to "positive_offset" if sign bit is zero
			addi	$t2, $t2, 0xffff0000		# sign extends to upper 16 bits
			sub	$t2, $zero, $t2			# get the absolute value
			sll	$t2, $t2, 2			# multiply $t2 by 4
			sub	$a0,$s7, $t2			# subtract $t2 from (PC+4) 
			j	print_value			# jump to "print_value"
			
positive_offset:	sll	$t2, $t2, 2			# multiply $t2 by 4
			add	$a0, $s7, $t2			# add $t2 to (PC+4)

print_value:		li 	$v0, 1				# set syscall to print integer
			syscall					# print the address
			jr	$ra				# return to the caller

####################### function that prints immediate value
print_immediate:	andi	$t2, $a0, 0xffff		# $t2 gets the immediate field
			andi	$t3, $a0, 0x8000		# $t3 gets the sign bit
			beq 	$t3, $zero, positive_imm 	# branch to "positive_imm" if sign bit is zero
			addi	$t2, $t2, 0xffff0000		# sign extends to upper 16 bits	
positive_imm:		move	$a0, $t2			# $a0 = $t2
			li 	$v0, 1				# set syscall to print integer
			syscall					# print the immediate
			jr	$ra				# return to the caller
