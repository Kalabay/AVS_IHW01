.file	"HW01.c"
.text
.local	A
.comm	A,400,32
.local	B
.comm	B,400,32
.section	.rodata
.LC0:
.string	"%d"
.text
.globl	GetInput
.type	GetInput, @function
    GetInput:
.LFB0:
.cfi_startproc
    endbr64
pushq	%rbp
.cfi_def_cfa_offset 16
.cfi_offset 6, -16
movq	%rsp, %rbp
.cfi_def_cfa_register 6
subq	$16, %rsp
    movq	%fs:40, %rax
    movq	%rax, -8(%rbp)
xorl	%eax, %eax
    leaq	-16(%rbp), %rax
    movq	%rax, %rsi
    leaq	.LC0(%rip), %rax
    movq	%rax, %rdi
    movl	$0, %eax
    call	__isoc99_scanf@PLT
    movl	-16(%rbp), %eax
    testl	%eax, %eax
    js	.L2
    movl	-16(%rbp), %eax
    cmpl	$100, %eax
    jle	.L3
.L2:
movl	$-1, %eax
    jmp	.L7
.L3:
movl	$0, -12(%rbp)
jmp	.L5
.L6:
movl	-12(%rbp), %eax
    cltq
leaq	0(,%rax,4), %rdx
    leaq	A(%rip), %rax
    addq	%rdx, %rax
    movq	%rax, %rsi
    leaq	.LC0(%rip), %rax
    movq	%rax, %rdi
    movl	$0, %eax
    call	__isoc99_scanf@PLT
    addl	$1, -12(%rbp)
.L5:
movl	-16(%rbp), %eax
    cmpl	%eax, -12(%rbp)
jl	.L6
    movl	-16(%rbp), %eax
.L7:
movq	-8(%rbp), %rdx
    subq	%fs:40, %rdx
    je	.L8
    call	__stack_chk_fail@PLT
.L8:
leave
.cfi_def_cfa 7, 8
ret
.cfi_endproc
.LFE0:
.size	GetInput, .-GetInput
.globl	GetB
.type	GetB, @function
    GetB:
.LFB1:
.cfi_startproc
    endbr64
pushq	%rbp
.cfi_def_cfa_offset 16
.cfi_offset 6, -16
movq	%rsp, %rbp
.cfi_def_cfa_register 6
movl	%edi, -20(%rbp)
movl	$0, -4(%rbp)
jmp	.L10
.L14:
movl	-4(%rbp), %eax
    cltq
leaq	0(,%rax,4), %rdx
    leaq	A(%rip), %rax
    movl	(%rdx,%rax), %eax
    cmpl	$5, %eax
    jle	.L11
    movl	-4(%rbp), %eax
    cltq
leaq	0(,%rax,4), %rdx
    leaq	A(%rip), %rax
    movl	(%rdx,%rax), %eax
    leal	5(%rax), %ecx
    movl	-4(%rbp), %eax
    cltq
leaq	0(,%rax,4), %rdx
    leaq	B(%rip), %rax
    movl	%ecx, (%rdx,%rax)
jmp	.L12
.L11:
movl	-4(%rbp), %eax
    cltq
leaq	0(,%rax,4), %rdx
    leaq	A(%rip), %rax
    movl	(%rdx,%rax), %eax
    cmpl	$-5, %eax
    jge	.L13
    movl	-4(%rbp), %eax
    cltq
leaq	0(,%rax,4), %rdx
    leaq	A(%rip), %rax
    movl	(%rdx,%rax), %eax
    leal	-5(%rax), %ecx
    movl	-4(%rbp), %eax
    cltq
leaq	0(,%rax,4), %rdx
    leaq	B(%rip), %rax
    movl	%ecx, (%rdx,%rax)
jmp	.L12
.L13:
movl	-4(%rbp), %eax
    cltq
leaq	0(,%rax,4), %rdx
    leaq	B(%rip), %rax
    movl	$0, (%rdx,%rax)
.L12:
addl	$1, -4(%rbp)
.L10:
movl	-4(%rbp), %eax
    cmpl	-20(%rbp), %eax
    jl	.L14
    nop
nop
    popq	%rbp
.cfi_def_cfa 7, 8
ret
.cfi_endproc
.LFE1:
.size	GetB, .-GetB
.section	.rodata
.LC1:
.string	"%d\n"
.text
.globl	Print
.type	Print, @function
    Print:
.LFB2:
.cfi_startproc
    endbr64
pushq	%rbp
.cfi_def_cfa_offset 16
.cfi_offset 6, -16
movq	%rsp, %rbp
.cfi_def_cfa_register 6
subq	$32, %rsp
    movl	%edi, -20(%rbp)
movl	$0, -4(%rbp)
jmp	.L16
.L17:
movl	-4(%rbp), %eax
    cltq
leaq	0(,%rax,4), %rdx
    leaq	B(%rip), %rax
    movl	(%rdx,%rax), %eax
    movl	%eax, %esi
    leaq	.LC1(%rip), %rax
    movq	%rax, %rdi
    movl	$0, %eax
    call	printf@PLT
    addl	$1, -4(%rbp)
.L16:
movl	-4(%rbp), %eax
    cmpl	-20(%rbp), %eax
    jl	.L17
    nop
nop
    leave
.cfi_def_cfa 7, 8
ret
.cfi_endproc
.LFE2:
.size	Print, .-Print
.section	.rodata
.LC2:
.string	"strange input"
.text
.globl	main
.type	main, @function
    main:
.LFB3:
.cfi_startproc
    endbr64
pushq	%rbp
.cfi_def_cfa_offset 16
.cfi_offset 6, -16
movq	%rsp, %rbp
.cfi_def_cfa_register 6
subq	$32, %rsp
    movl	%edi, -20(%rbp)
movq	%rsi, -32(%rbp)
movl	$0, %eax
    call	GetInput
    movl	%eax, -4(%rbp)
cmpl	$-1, -4(%rbp)
jne	.L19
    leaq	.LC2(%rip), %rax
    movq	%rax, %rdi
    call	puts@PLT
    movl	$0, %eax
    jmp	.L20
.L19:
movl	-4(%rbp), %eax
    movl	%eax, %edi
    call	GetB
    movl	-4(%rbp), %eax
    movl	%eax, %edi
    call	Print
    movl	$0, %eax
.L20:
leave
.cfi_def_cfa 7, 8
ret
.cfi_endproc
.LFE3:
.size	main, .-main
.ident	"GCC: (Ubuntu 11.2.0-19ubuntu1) 11.2.0"
.section	.note.GNU-stack,"",@progbits
.section	.note.gnu.property,"a"
.align 8
.long	1f - 0f
.long	4f - 1f
.long	5
0:
.string	"GNU"
1:
.align 8
.long	0xc0000002
.long	3f - 2f
2:
.long	0x3
3:
.align 8
4:
