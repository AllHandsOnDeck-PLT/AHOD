	.text
	.file	"AHOD"
	.globl	list_pushbool           # -- Begin function list_pushbool
	.p2align	4, 0x90
	.type	list_pushbool,@function
list_pushbool:                          # @list_pushbool
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
.Lfunc_end0:
	.size	list_pushbool, .Lfunc_end0-list_pushbool
	.cfi_endproc
                                        # -- End function
	.globl	list_pushint            # -- Begin function list_pushint
	.p2align	4, 0x90
	.type	list_pushint,@function
list_pushint:                           # @list_pushint
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
.Lfunc_end1:
	.size	list_pushint, .Lfunc_end1-list_pushint
	.cfi_endproc
                                        # -- End function
	.globl	list_pushfloat          # -- Begin function list_pushfloat
	.p2align	4, 0x90
	.type	list_pushfloat,@function
list_pushfloat:                         # @list_pushfloat
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
.Lfunc_end2:
	.size	list_pushfloat, .Lfunc_end2-list_pushfloat
	.cfi_endproc
                                        # -- End function
	.globl	list_pushstr            # -- Begin function list_pushstr
	.p2align	4, 0x90
	.type	list_pushstr,@function
list_pushstr:                           # @list_pushstr
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
.Lfunc_end3:
	.size	list_pushstr, .Lfunc_end3-list_pushstr
	.cfi_endproc
                                        # -- End function
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	subq	$4136, %rsp             # imm = 0x1028
	.cfi_def_cfa_offset 4144
	movq	str.1@GOTPCREL(%rip), %rdi
	movl	$1, %esi
	xorl	%eax, %eax
	callq	printf@PLT
	movl	$0, 4(%rsp)
	leaq	4(%rsp), %rax
	movq	%rax, 8(%rsp)
	leaq	24(%rsp), %rax
	movq	%rax, 16(%rsp)
	leaq	8(%rsp), %rdi
	movl	$1, %esi
	callq	list_pushint@PLT
	movq	8(%rsp), %rsi
	movq	16(%rsp), %rdx
	movq	str@GOTPCREL(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	xorl	%eax, %eax
	addq	$4136, %rsp             # imm = 0x1028
	retq
.Lfunc_end4:
	.size	main, .Lfunc_end4-main
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


	.section	".note.GNU-stack","",@progbits
