	.text
	.file	"AHOD"
	.globl	PLAY                    # -- Begin function PLAY
	.p2align	4, 0x90
	.type	PLAY,@function
PLAY:                                   # @PLAY
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	str@GOTPCREL(%rip), %rdi
	leaq	.Lstr.4(%rip), %rsi
	xorl	%eax, %eax
	callq	printf@PLT
	popq	%rax
	retq
.Lfunc_end0:
	.size	PLAY, .Lfunc_end0-PLAY
	.cfi_endproc
                                        # -- End function
	.globl	PLAYTWO                 # -- Begin function PLAYTWO
	.p2align	4, 0x90
	.type	PLAYTWO,@function
PLAYTWO:                                # @PLAYTWO
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	str@GOTPCREL(%rip), %rdi
	leaq	.Lstr.5(%rip), %rsi
	xorl	%eax, %eax
	callq	printf@PLT
	popq	%rax
	retq
.Lfunc_end1:
	.size	PLAYTWO, .Lfunc_end1-PLAYTWO
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
.Lfunc_end2:
	.size	series_addbool, .Lfunc_end2-series_addbool
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
.Lfunc_end3:
	.size	series_addint, .Lfunc_end3-series_addint
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
.Lfunc_end4:
	.size	series_addfloat, .Lfunc_end4-series_addfloat
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
.Lfunc_end5:
	.size	series_addstr, .Lfunc_end5-series_addstr
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
.Lfunc_end6:
	.size	series_getbool, .Lfunc_end6-series_getbool
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
.Lfunc_end7:
	.size	series_getint, .Lfunc_end7-series_getint
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
.Lfunc_end8:
	.size	series_getfloat, .Lfunc_end8-series_getfloat
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
.Lfunc_end9:
	.size	series_getstr, .Lfunc_end9-series_getstr
	.cfi_endproc
                                        # -- End function
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rax
	.cfi_def_cfa_offset 16
	callq	PLAY@PLT
	callq	PLAYTWO@PLT
	xorl	%eax, %eax
	popq	%rcx
	retq
.Lfunc_end10:
	.size	main, .Lfunc_end10-main
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

	.type	x,@object               # @x
	.bss
	.globl	x
	.p2align	2
x:
	.long	0                       # 0x0
	.size	x, 4

	.type	.Lstr.4,@object         # @str.4
	.section	.rodata.str1.16,"aMS",@progbits,1
	.p2align	4
.Lstr.4:
	.asciz	"actions are cool"
	.size	.Lstr.4, 17

	.type	.Lstr.5,@object         # @str.5
	.p2align	4
.Lstr.5:
	.asciz	"two actions are cooler"
	.size	.Lstr.5, 23


	.section	".note.GNU-stack","",@progbits