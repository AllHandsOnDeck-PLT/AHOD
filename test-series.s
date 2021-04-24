	.text
	.file	"AHOD"
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$4144, %rsp             # imm = 0x1030
	.cfi_def_cfa_offset 4160
	.cfi_offset %rbx, -16
	movl	$0, 12(%rsp)
	leaq	12(%rsp), %rax
	movq	%rax, 16(%rsp)
	leaq	32(%rsp), %rax
	movq	%rax, 24(%rsp)
	leaq	16(%rsp), %rbx
	movl	$1, %esi
	movq	%rbx, %rdi
	callq	series_addint@PLT
	movl	$3, %esi
	movq	%rbx, %rdi
	callq	series_addint@PLT
	movq	16(%rsp), %rax
	movq	24(%rsp), %rcx
	movq	a@GOTPCREL(%rip), %rdi
	movq	%rcx, 8(%rdi)
	movq	%rax, (%rdi)
	movl	$1, %esi
	callq	series_getint@PLT
	movl	%eax, %ecx
	movq	str.1@GOTPCREL(%rip), %rdi
	xorl	%eax, %eax
	movl	%ecx, %esi
	callq	printf@PLT
	xorl	%eax, %eax
	addq	$4144, %rsp             # imm = 0x1030
	popq	%rbx
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.globl	series_addbool          # -- Begin function series_addbool
	.p2align	4, 0x90
	.type	series_addbool,@function
series_addbool:                         # @series_addbool
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	andl	$1, %esi
	movb	%sil, -9(%rsp)
	movq	(%rdi), %rax
	movq	8(%rdi), %rcx
	movslq	(%rax), %rdx
	leal	1(%rdx), %esi
	movl	%esi, (%rax)
	movb	-9(%rsp), %al
	movb	%al, (%rcx,%rdx)
	retq
.Lfunc_end1:
	.size	series_addbool, .Lfunc_end1-series_addbool
	.cfi_endproc
                                        # -- End function
	.globl	series_addint           # -- Begin function series_addint
	.p2align	4, 0x90
	.type	series_addint,@function
series_addint:                          # @series_addint
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movl	%esi, -12(%rsp)
	movq	(%rdi), %rax
	movq	8(%rdi), %rcx
	movslq	(%rax), %rdx
	leal	1(%rdx), %esi
	movl	%esi, (%rax)
	movl	-12(%rsp), %eax
	movl	%eax, (%rcx,%rdx,4)
	retq
.Lfunc_end2:
	.size	series_addint, .Lfunc_end2-series_addint
	.cfi_endproc
                                        # -- End function
	.globl	series_addfloat         # -- Begin function series_addfloat
	.p2align	4, 0x90
	.type	series_addfloat,@function
series_addfloat:                        # @series_addfloat
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movsd	%xmm0, -16(%rsp)
	movq	(%rdi), %rax
	movq	8(%rdi), %rcx
	movslq	(%rax), %rdx
	leal	1(%rdx), %esi
	movl	%esi, (%rax)
	movsd	-16(%rsp), %xmm0        # xmm0 = mem[0],zero
	movsd	%xmm0, (%rcx,%rdx,8)
	retq
.Lfunc_end3:
	.size	series_addfloat, .Lfunc_end3-series_addfloat
	.cfi_endproc
                                        # -- End function
	.globl	series_addstr           # -- Begin function series_addstr
	.p2align	4, 0x90
	.type	series_addstr,@function
series_addstr:                          # @series_addstr
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movq	%rsi, -16(%rsp)
	movq	(%rdi), %rax
	movq	8(%rdi), %rcx
	movslq	(%rax), %rdx
	leal	1(%rdx), %esi
	movl	%esi, (%rax)
	movq	-16(%rsp), %rax
	movq	%rax, (%rcx,%rdx,8)
	retq
.Lfunc_end4:
	.size	series_addstr, .Lfunc_end4-series_addstr
	.cfi_endproc
                                        # -- End function
	.globl	series_getbool          # -- Begin function series_getbool
	.p2align	4, 0x90
	.type	series_getbool,@function
series_getbool:                         # @series_getbool
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movl	%esi, -12(%rsp)
	movq	8(%rdi), %rax
	movslq	-12(%rsp), %rcx
	movb	(%rax,%rcx), %al
	retq
.Lfunc_end5:
	.size	series_getbool, .Lfunc_end5-series_getbool
	.cfi_endproc
                                        # -- End function
	.globl	series_getint           # -- Begin function series_getint
	.p2align	4, 0x90
	.type	series_getint,@function
series_getint:                          # @series_getint
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movl	%esi, -12(%rsp)
	movq	8(%rdi), %rax
	movslq	-12(%rsp), %rcx
	movl	(%rax,%rcx,4), %eax
	retq
.Lfunc_end6:
	.size	series_getint, .Lfunc_end6-series_getint
	.cfi_endproc
                                        # -- End function
	.globl	series_getfloat         # -- Begin function series_getfloat
	.p2align	4, 0x90
	.type	series_getfloat,@function
series_getfloat:                        # @series_getfloat
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movl	%esi, -12(%rsp)
	movq	8(%rdi), %rax
	movslq	-12(%rsp), %rcx
	movsd	(%rax,%rcx,8), %xmm0    # xmm0 = mem[0],zero
	retq
.Lfunc_end7:
	.size	series_getfloat, .Lfunc_end7-series_getfloat
	.cfi_endproc
                                        # -- End function
	.globl	series_getstr           # -- Begin function series_getstr
	.p2align	4, 0x90
	.type	series_getstr,@function
series_getstr:                          # @series_getstr
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movl	%esi, -12(%rsp)
	movq	8(%rdi), %rax
	movslq	-12(%rsp), %rcx
	movq	(%rax,%rcx,8), %rax
	retq
.Lfunc_end8:
	.size	series_getstr, .Lfunc_end8-series_getstr
	.cfi_endproc
                                        # -- End function
	.type	str,@object             # @str
	.data
	.globl	str
str:
	.asciz	"%s\n"
	.size	str, 4

	.type	str.1,@object           # @str.1
	.globl	str.1
str.1:
	.asciz	"%d\n"
	.size	str.1, 4

	.type	str.2,@object           # @str.2
	.globl	str.2
str.2:
	.asciz	"%g\n"
	.size	str.2, 4

	.type	str.3,@object           # @str.3
	.globl	str.3
str.3:
	.asciz	"%d\n"
	.size	str.3, 4

	.type	a,@object               # @a
	.bss
	.globl	a
	.p2align	3
a:
	.zero	16
	.size	a, 16


	.section	".note.GNU-stack","",@progbits