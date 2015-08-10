	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 10
	.globl	_main
	.align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp0:
	.cfi_def_cfa_offset 16
Ltmp1:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp2:
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	leaq	L_.str(%rip), %rax
	movl	$0, -4(%rbp)
	movl	%edi, -8(%rbp)
	movq	%rsi, -16(%rbp)


	xorq %rcx, %rcx
	xorq %rdx, %rdx
	xorq %r8, %r8
	xorq %r9, %r9
	xorl %r10d, %r10d

	movl $100, %ecx
	movq $0, %r8
	
loop1:
  movl %ecx, %edx
  imull %ecx, %edx
  addq %rdx, %r8

  addl $1, %ecx

	cmpl %ecx, %r10d
	jg loop1




	movl $100, %ecx
	movq $0, %r9
loop2:
  addq %rcx, %r9

  addl $1, %ecx

	cmpl %ecx, %r10d
	jg loop2


	imulq %r9, %r9

	subq %r9, %r8




	movq	%r8, -24(%rbp)
	movq	-24(%rbp), %rsi
	movq	%rax, %rdi
	movb	$0, %al
	callq	_printf
	xorl	%ecx, %ecx
	movl	%eax, -28(%rbp)         ## 4-byte Spill
	movl	%ecx, %eax
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"%ld\n"


.subsections_via_symbols
