.data
.globl main

offset: .word			0,
				4,
				8,
				10,
				14,
				18,
				22,
				27,
				32,
				37,
				43,
				48,
				54,
				59,
				63,
				68,
				72,
				76,
				80,
				84,
				88,
				92,
				96,
				100,
				104,
				108,
				112,
				116,
				120,
				124,
				128,
				132,
				136,
				139,
				142,
				146,
				149,
				153,
				157,
				161,
				165,
				168,
				171,
				175,
				178,
				182,
				186,
				190,
				196,
				199,
				204,
				209,
				214,
				218,
				223,
				228,
				232,
				235,
				240,
				245,
				249,
				253,
				258,
				263

offset_Rtype: .word		0,
				4,
				8,
				12,
				16,
				21,
				25,
				30,
				35,
				38,
				43,
				48,
				53,
				61,
				67,
				71,
				76,
				81,
				86,
				91,
				96,
				100,
				104,
				108,
				112,
				117,
				123,
				127,
				132,
				136,
				140,
				144,
				148,
				152,
				157,
				161,
				166,
				170,
				173,
				177,
				181,
				185,
				189,
				193,
				198,
				202,
				206,
				210,
				214,
				218,
				223,
				227,
				232,
				236,
				240,
				244,
				248,
				252,
				256,
				260,
				264,
				268,
				272,
				276

offset_register: .word		0,
				6,
				10,
				14,
				18,
				22,
				26,
				30,
				34,
				38,
				42,
				46,
				50,
				54,
				58,
				62,
				66,
				70,
				74,
				78,
				82,
				86,
				90,
				94,
				98,
				102,
				106,
				110,
				114,
				118,
				122,
				126

name: .asciiz			"nop",
				"nop",
				"j",
				"jal",
				"beq",
				"bne",
				"blez",
				"bgtz",
				"addi",
				"addiu",
				"slti",
				"sltiu",
				"andi",
				"ori",
				"xori",
				"lui",
				"nop",
				"nop",
				"nop",
				"nop",
				"nop",
				"nop",
				"nop",
				"nop",
				"nop",
				"nop",
				"nop",
				"nop",
				"nop",
				"nop",
				"nop",
				"nop",
				"lb",
				"lh",
				"lwl",
				"lw",
				"lbu",
				"lhu",
				"lwr",
				"nop",
				"sb",
				"sh",
				"swl",
				"sw",
				"nop",
				"nop",
				"swr",
				"cache",
				"ll",
				"lwc1",
				"lwc2",
				"pref",
				"nop",
				"ldc1",
				"ldc2",
				"nop",
				"sc",
				"swc1",
				"swc2",
				"nop",
				"nop",
				"sdc1",
				"sdc2",
				"nop"

name_Rtype: .asciiz		"sll",
				"nop",
				"srl",
				"sra",
				"sllv",
				"nop",
				"srlv",
				"srav",
				"jr",
				"jalr",
				"movz",
				"movn",
				"syscall",
				"break",
				"nop",
				"sync",
				"mfhi",
				"mthi",
				"mflo",
				"mtlo",
				"nop",
				"nop",
				"nop",
				"nop",
				"mult",
				"multu",
				"div",
				"divu",
				"nop",
				"nop",
				"nop",
				"nop",
				"add",
				"addu",
				"sub",
				"subu",
				"and",
				"or",
				"xor",
				"nor",
				"nop",
				"nop",
				"slt",
				"sltu",
				"nop",
				"nop",
				"nop",
				"nop",
				"tge",
				"tgeu",
				"tlt",
				"tltu",
				"teq",
				"nop",
				"tne",
				"nop",
				"nop",
				"nop",
				"nop",
				"nop",
				"nop",
				"nop",
				"nop",
				"nop"

name_register: .asciiz		"$zero",
				"$at",
				"$v0",
				"$v1",
				"$a0",
				"$a1",
				"$a2",
				"$a3",
				"$t0",
				"$t1",
				"$t2",
				"$t3",
				"$t4",
				"$t5",
				"$t6",
				"$t7",
				"$s0",
				"$s1",
				"$s2",
				"$s3",
				"$s4",
				"$s5",
				"$s6",
				"$s7",
				"$t8",
				"$t9",
				"$k0",
				"$k1",
				"$gp",
				"$sp",
				"$fp",
				"$ra"

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
msg_data:	.asciiz		"Data segment starts at address (0x0000 = 0):"
msg_text:	.asciiz		"Text segment starts at address (0x3000 = 12288):"

		.text
main:			la	$a0, msg_data			# load address of msg_data into $a0 			
			li	$v0, 4				# set syscall to print string
			syscall					# print the string
			li	$v0, 5				# syscall to receive an integer from user
			syscall					# make syscall input stored in $v0
			move	$s7, $v0			# save base address of data segment to $s7 
			
			la	$a0, msg_text			# load address of msg_text into $a0 			
			li	$v0, 4				# set syscall to print string
			syscall					# print the string
			li	$v0, 5				# syscall to receive an integer from user
			syscall					# make syscall input stored in $v0
			move	$s6, $v0			# save base address of text segment to $s6 

####################### Output data segment #####################################################################
			la	$s0, data_machine		# load base address of data_machine into $s0
			la	$s1, text_machine		# load base address of text_machine into $s1
			
			la	$a0, type_data			# load address of ".data\n"
			li	$v0, 4				# set syscall to print string
			syscall					# print ".data\n"
			
loop_data:		beq 	$s0, $s1, text			# when $s0 = $s1, branch to "text"		
			
			move	$a0, $s7			# copy PC to $a0
			jal	print_label			# function call to print label
			
			lw	$t0, 0($s0)			# load word to $t0
			addi	$t1, $zero, 0			# initialize the count $t1 to 0
			beq	$t0, $zero, loop_zero		# branch to loop_zero if $t0 is 0
			
			la	$a0, type_word			# load address of ".word\t"
			li	$v0, 4				# set syscall to print string
			syscall					# print ".word\t"
			
			move	$a0, $t0			# $a0 = $t0
			li	$v0, 1				# set syscall to print integer
			syscall					# print the integer
			j	change_line			# jump to "change_line"
			
loop_zero:		bne	$t0, $zero, reserve_space	# when $t0 is not zero, branch to reserve_space
			addi	$t1, $t1, 1			# add 1 to the count
			addi	$s0, $s0, 4			# move to the next word
			addi	$s7, $s7, 4			# PC = PC + 4
			lw	$t0, 0($s0)			# load word into $t0
			j	loop_zero			# jump back to "loop_zero"			

reserve_space:		la	$a0, type_space			# load address of ".space\t"
			li	$v0, 4				# set syscall to print string
			syscall					# print ".space\t"
			sll	$a0, $t1, 2			# multiply $t1 by 4
			li	$v0, 1				# set syscall to print integer
			syscall					# print the value			
			
			la	$a0, new_line			# load address of "\n"
			li	$v0, 4				# set syscall to print string
			syscall					# print "\n"
			
			beq	$s0, $s1, text			# branch to "text" if $s0 = $s1
			move	$a0, $s7			# copy PC to $a0
			jal	print_label			# function call to print label
			
			la	$a0, type_word			# load address of ".word\t"
			li	$v0, 4				# set syscall to print string
			syscall					# print ".word\t"
			
			move	$a0, $t0			# $a0 = $t0
			li	$v0, 1				# set syscall to print integer
			syscall					# print the integer
																																																			
change_line:		la	$a0, new_line			# load address of "\n"
			li	$v0, 4				# set syscall to print string
			syscall					# print "\n"
			addi	$s0, $s0, 4			# move to next word
			addi	$s7, $s7, 4			# PC = PC + 4
			j	loop_data			# jump back to top of the loop

####################### Output text segment #####################################################################
text:			move	$s7, $s6			# copy base address of text segment into $s7
			la	$s0, text_machine		# load base address of text_machine into $s0
			la 	$s1, offset			# load base address of offset into $s1
			la	$s2, offset_Rtype		# load base address of offset_Rtype into $s2
			la	$s3, offset_register		# load base address of offset_register into $s3
			la	$s4, name			# load base address of name into $s4
			la	$s5, name_Rtype			# load base address of name_Rtype into $s5
			la	$s6, name_register		# load base address of name_register into $s6
			la	$t7, code_end			# load end address of machine code
			
			la	$a0, type_text			# load address of ".text\n"
			li	$v0, 4				# set syscall to print string
			syscall					# print ".text\n"
			
loop_text:		beq 	$s0, $t7, exit			# when $s0 = $s1, branch to exit
				
			move	$a0, $s7			# copy PC to $a0
			jal	print_label			# function call to print label
			addi	$s7, $s7, 4			# PC = PC + 4
			
			lw 	$t1, 0($s0)			# load the instruction into $t1
			srl 	$t0, $t1, 26			# $t0 gets the opcode
			
			beq	$t0, $zero, Rtype		# branch to Rtype if opcode is 0
			
			move	$a0, $t0			# $a0 is opcode
			move	$a1, $s1			# $a1 is base address of offset array
			move	$a2, $s4			# $a2 is base address of name array
			jal	print_string			# function call to print the instruction name
			
			la	$a0, tab			# load address of tab
			li	$v0, 4				# set syscall to print string
			syscall					# print tab
			
			li	$t9, 2				# $t9 = 2
			beq	$t0, $t9, pattern1		# branch to pattern1 if opcode is 2
			li	$t9, 3				# $t9 = 3
			beq	$t0, $t9, pattern1		# branch to pattern1 if opcode is 3
			
			li	$t9, 4				# $t9 = 4	
			beq	$t0, $t9, pattern2		# branch to pattern2 if opcode is 4
			li	$t9, 5				# $t9 = 5
			beq	$t0, $t9, pattern2		# branch to pattern2 if opcode is 5
			
			li	$t9, 6				# $t9 = 6 
			beq	$t0, $t9, pattern3		# branch to pattern3 if opcode is 6
			li	$t9, 7				# $t9 = 7
			beq	$t0, $t9, pattern3		# branch to pattern3 if opcode is 7
			
			li	$t9, 8				# $t9 = 8
			beq	$t0, $t9, pattern4		# branch to pattern4 if opcode is 8
			li	$t9, 9				# $t9 = 9
			beq	$t0, $t9, pattern4		# branch to pattern4 if opcode is 9
			li	$t9, 10				# $t9 = 10
			beq	$t0, $t9, pattern4		# branch to pattern4 if opcode is 10
			li	$t9, 11				# $t9 = 11
			beq	$t0, $t9, pattern4		# branch to pattern4 if opcode is 11
			li	$t9, 12				# $t9 = 12
			beq	$t0, $t9, pattern4		# branch to pattern4 if opcode is 12
			li	$t9, 13				# $t9 = 13
			beq	$t0, $t9, pattern4		# branch to pattern4 if opcode is 13
			li	$t9, 14				# $t9 = 14
			beq	$t0, $t9, pattern4		# branch to pattern4 if opcode is 14		
			
			li	$t9, 15				# $t9 = 15
			beq	$t0, $t9, pattern5		# branch to pattern5 if opcode is 15
			
			li	$t9, 32				# $t9 = 32
			beq	$t0, $t9, pattern6		# branch to pattern6 if opcode is 32
			li	$t9, 33				# $t9 = 33
			beq	$t0, $t9, pattern6		# branch to pattern6 if opcode is 33
			li	$t9, 34				# $t9 = 34
			beq	$t0, $t9, pattern6		# branch to pattern6 if opcode is 34
			li	$t9, 35				# $t9 = 35
			beq	$t0, $t9, pattern6		# branch to pattern6 if opcode is 35
			li	$t9, 36				# $t9 = 36
			beq	$t0, $t9, pattern6		# branch to pattern6 if opcode is 36
			li	$t9, 37				# $t9 = 37
			beq	$t0, $t9, pattern6		# branch to pattern6 if opcode is 37
			li	$t9, 38				# $t9 = 38
			beq	$t0, $t9, pattern6		# branch to pattern6 if opcode is 38
			li	$t9, 40				# $t9 = 40
			beq	$t0, $t9, pattern6		# branch to pattern6 if opcode is 40
			li	$t9, 41				# $t9 = 41
			beq	$t0, $t9, pattern6		# branch to pattern6 if opcode is 41
			li	$t9, 42				# $t9 = 42
			beq	$t0, $t9, pattern6		# branch to pattern6 if opcode is 42
			li	$t9, 43				# $t9 = 43
			beq	$t0, $t9, pattern6		# branch to pattern6 if opcode is 43
			li	$t9, 46				# $t9 = 46
			beq	$t0, $t9, pattern6		# branch to pattern6 if opcode is 46
			li	$t9, 48				# $t9 = 48
			beq	$t0, $t9, pattern6		# branch to pattern6 if opcode is 48
			li	$t9, 56				# $t9 = 56
			beq	$t0, $t9, pattern6		# branch to pattern6 if opcode is 56
			
			j	loop_increment			# jump to loop_increment
			
####################### pattern1: op target 
pattern1:		la	$a0, letterL			# load address of "L"
			li	$v0, 4				# set syscall to print string
			syscall					# print "L"

			andi	$t2, $t1, 0x3ffffff		# $t2 gets the address field
			sll	$a0, $t2, 2			# multiply $t2 by 4
			li	$v0, 1				# set syscall to print integer
			syscall					# print the address			
			
			j	loop_increment			# jump to loop_increment								

####################### pattern2: op rs, rt, target																											
pattern2:		move	$a0, $t1			# $a0 = $t1
			jal	print_rs			# function call to print rs register
			
			jal	print_comma			# function call to print comma and space
			
			move	$a0, $t1			# $a0 = $t1
			jal	print_rt			# function call to print rt register	
			
			jal	print_comma			# function call to print comma and space
			
			move	$a0, $t1			# $a0 = $t1
			jal	print_branch_target		# function call to print branch target
			
			j	loop_increment			# jump to loop_increment

######################  pattern3: op rs, target
pattern3:		move	$a0, $t1			# $a0 = $t1
			jal	print_rs			# function call to print rs register
			
			jal	print_comma			# function call to print comma and space
			
			move	$a0, $t1			# $a0 = $t1
			jal	print_branch_target		# function call to print branch target
			
			j	loop_increment			# jump to loop_increment
			
######################  pattern4: op rt, rs, imm 
pattern4:		move	$a0, $t1			# $a0 = $t1
			jal	print_rt			# function call to print rt register
			
			jal	print_comma			# function call to print comma and space
			
			move	$a0, $t1			# $a0 = $t1
			jal	print_rs			# function call to print rs register
			
			jal	print_comma			# function call to print comma and space
			
			move	$a0, $t1			# $a0 = $t1
			jal	print_immediate			# function call to print immediate
			
			j	loop_increment			# jump to loop_increment
				
####################### pattern5: op rt, imm
pattern5:		move	$a0, $t1			# $a0 = $t1
			jal	print_rt			# function call to print rt register
			
			jal	print_comma			# function call to print comma and space
			
			andi	$a0, $t1, 0xffff		# $a0 gets the immediate field
			li 	$v0, 1				# set syscall to print integer
			syscall					# print the immediate
			
			j	loop_increment			# jump to loop_increment
			
####################### pattern6: op rt, imm(rs)
pattern6:		move	$a0, $t1			# $a0 = $t1
			jal	print_rt			# function call to print rt register
			
			jal	print_comma			# function call to print comma and space
			
			move	$a0, $t1			# $a0 = $t1
			jal	print_immediate			# function call to print immediate
			
			la	$a0, left_bracket		# load address of "("
			li 	$v0, 4				# set syscall to print string
			syscall					# print "("	
			
			move	$a0, $t1			# $a0 = $t1
			jal	print_rs			# function call to print rs register
			
			la	$a0, right_bracket		# load address of ")"
			li 	$v0, 4				# set syscall to print string
			syscall					# print ")"	
			
			j	loop_increment			# jump to loop_increment
						
####################### R-type instructions: #####################################################################		
Rtype:			andi	$t0, $t1, 63			# t0 gets the function code
			
			move	$a0, $t0			# $a0 is function code
			move	$a1, $s2			# $a1 is base address of offset_Rtype array
			move	$a2, $s5			# $a2 is base address of name_Rtype array
			jal	print_string			# function call to print the instruction name
			
			la	$a0, tab			# load address of tab
			li	$v0, 4				# set syscall to print string
			syscall					# print tab
			
			li	$t9, 10				# $t9 = 10
			beq	$t0, $t9, pattern7		# branch to pattern7 if funct code is 10	
			li	$t9, 11				# $t9 = 11
			beq	$t0, $t9, pattern7		# branch to pattern7 if funct code is 11
			li	$t9, 32				# $t9 = 32
			beq	$t0, $t9, pattern7		# branch to pattern7 if funct code is 32
			li	$t9, 33				# $t9 = 33
			beq	$t0, $t9, pattern7		# branch to pattern7 if funct code is 33
			li	$t9, 34				# $t9 = 34
			beq	$t0, $t9, pattern7		# branch to pattern7 if funct code is 34
			li	$t9, 35				# $t9 = 35
			beq	$t0, $t9, pattern7		# branch to pattern7 if funct code is 35
			li	$t9, 36				# $t9 = 36
			beq	$t0, $t9, pattern7		# branch to pattern7 if funct code is 36
			li	$t9, 37				# $t9 = 37
			beq	$t0, $t9, pattern7		# branch to pattern7 if funct code is 37
			li	$t9, 38				# $t9 = 38
			beq	$t0, $t9, pattern7		# branch to pattern7 if funct code is 38
			li	$t9, 39				# $t9 = 39
			beq	$t0, $t9, pattern7		# branch to pattern7 if funct code is 39
			li	$t9, 42				# $t9 = 42
			beq	$t0, $t9, pattern7		# branch to pattern7 if funct code is 42
			li	$t9, 43				# $t9 = 43
			beq	$t0, $t9, pattern7		# branch to pattern7 if funct code is 43
			
			li	$t9, 16				# $t9 = 16
			beq	$t0, $t9, pattern8		# branch to pattern7 if funct code is 16
			li	$t9, 18				# $t9 = 18
			beq	$t0, $t9, pattern8		# branch to pattern7 if funct code is 18
			
			li	$t9, 0				# $t9 = 0
			beq	$t0, $t9, pattern9		# branch to pattern7 if funct code is 0
			li	$t9, 2				# $t9 = 2
			beq	$t0, $t9, pattern9		# branch to pattern7 if funct code is 2
			li	$t9, 3				# $t9 = 3
			beq	$t0, $t9, pattern9		# branch to pattern7 if funct code is 3
			
			li	$t9, 8				# $t9 = 8
			beq	$t0, $t9, pattern10		# branch to pattern7 if funct code is 8
			li	$t9, 17				# $t9 = 17
			beq	$t0, $t9, pattern10		# branch to pattern7 if funct code is 17
			li	$t9, 19				# $t9 = 19
			beq	$t0, $t9, pattern10		# branch to pattern7 if funct code is 19
			
			li	$t9, 9				# $t9 = 9
			beq	$t0, $t9, pattern11		# branch to pattern7 if funct code is 9
			li	$t9, 24				# $t9 = 24
			beq	$t0, $t9, pattern11		# branch to pattern7 if funct code is 24
			li	$t9, 25				# $t9 = 25
			beq	$t0, $t9, pattern11		# branch to pattern7 if funct code is 25
			li	$t9, 26				# $t9 = 26
			beq	$t0, $t9, pattern11		# branch to pattern7 if funct code is 26
			li	$t9, 27				# $t9 = 27
			beq	$t0, $t9, pattern11		# branch to pattern7 if funct code is 27
			li	$t9, 48				# $t9 = 48
			beq	$t0, $t9, pattern11		# branch to pattern7 if funct code is 48
			li	$t9, 49				# $t9 = 49
			beq	$t0, $t9, pattern11		# branch to pattern7 if funct code is 49
			li	$t9, 50				# $t9 = 50
			beq	$t0, $t9, pattern11		# branch to pattern7 if funct code is 50
			li	$t9, 51				# $t9 = 51
			beq	$t0, $t9, pattern11		# branch to pattern7 if funct code is 51
			li	$t9, 52				# $t9 = 52
			beq	$t0, $t9, pattern11		# branch to pattern7 if funct code is 52
			li	$t9, 54				# $t9 = 54
			beq	$t0, $t9, pattern11		# branch to pattern7 if funct code is 54
			
			j	loop_increment			# jump to loop_increment
			
####################### pattern7: op rd, rs, rt
pattern7:		move	$a0, $t1			# $a0 = $t1
			jal	print_rd			# function call to print rd register
			
			jal	print_comma			# function call to print comma and space
			
			move	$a0, $t1			# $a0 = $t1
			jal	print_rs			# function call to print rs register
			
			jal	print_comma			# function call to print comma and space
			
			move	$a0, $t1			# $a0 = $t1
			jal	print_rt			# function call to print rt register
			
			j	loop_increment			# jump to loop_increment
			
####################### pattern8: op rd
pattern8:		move	$a0, $t1			# $a0 = $t1
			jal	print_rd			# function call to print rd register
			
			j	loop_increment			# jump to loop_increment

####################### pattern9: op rd, rt, shamt
pattern9:		move	$a0, $t1			# $a0 = $t1
			jal	print_rd			# function call to print rd register
			
			jal	print_comma			# function call to print comma and space
			
			move	$a0, $t1			# $a0 = $t1
			jal	print_rt			# function call to print rt register
			
			jal	print_comma			# function call to print comma and space
			
			move	$a0, $t1			# $a0 = $t1
			jal	print_shamt			# function call to print shamt
			
			j	loop_increment			# jump to loop_increment

####################### pattern10: op rs
pattern10:		move	$a0, $t1			# $a0 = $t1
			jal	print_rs			# function call to print rs register
			
			j	loop_increment			# jump to loop_increment

####################### pattern11: op rs, rt
pattern11:		move	$a0, $t1			# $a0 = $t1
			jal	print_rs			# function call to print rs register
			
			jal	print_comma			# function call to print comma and space
			
			move	$a0, $t1			# $a0 = $t1
			jal	print_rt			# function call to print rt register
			
loop_increment:		addi 	$s0, $s0, 4			# move to the next word
			la	$a0, new_line			# load address of "\n"
			li	$v0, 4				# set syscall to print string
			syscall					# print new line
			j 	loop_text			# jump back to the top of the loop	

exit:			li	$v0, 10				# syscall to exit		
			syscall					# exit
