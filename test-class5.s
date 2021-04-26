	.text
	.file	"AHOD"
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$16472, %rsp            # imm = 0x4058
	.cfi_def_cfa_offset 16528
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	leaq	.Lstr.4(%rip), %rdi
	movl	$1, %esi
	callq	cardcall@PLT
	movq	card1@GOTPCREL(%rip), %rbx
	movq	%rax, (%rbx)
	andb	$1, %dl
	movb	%dl, 8(%rbx)
	leaq	.Lstr.5(%rip), %rdi
	xorl	%esi, %esi
	callq	cardcall@PLT
	movq	card2@GOTPCREL(%rip), %r14
	movq	%rax, (%r14)
	andb	$1, %dl
	movb	%dl, 8(%r14)
	leaq	.Lstr.6(%rip), %rdi
	movl	$1, %esi
	callq	cardcall@PLT
	movq	card3@GOTPCREL(%rip), %r15
	movq	%rax, (%r15)
	andb	$1, %dl
	movb	%dl, 8(%r15)
	movl	$0, 4(%rsp)
	leaq	4(%rsp), %rax
	movq	%rax, 8(%rsp)
	leaq	24(%rsp), %rax
	movq	%rax, 16(%rsp)
	movq	(%rbx), %rsi
	movl	8(%rbx), %edx
	leaq	8(%rsp), %rbx
	movq	%rbx, %rdi
	callq	series_pushcard@PLT
	movq	(%r14), %rsi
	movl	8(%r14), %edx
	movq	%rbx, %rdi
	callq	series_pushcard@PLT
	movq	(%r15), %rsi
	movl	8(%r15), %edx
	movq	%rbx, %rdi
	callq	series_pushcard@PLT
	movq	8(%rsp), %rax
	movq	16(%rsp), %rcx
	movq	deck@GOTPCREL(%rip), %r12
	movq	%rcx, 8(%r12)
	movq	%rax, (%r12)
	movq	i@GOTPCREL(%rip), %r13
	movl	$0, (%r13)
	movq	type1@GOTPCREL(%rip), %rbx
	movq	str@GOTPCREL(%rip), %r14
	movq	str.3@GOTPCREL(%rip), %r15
	jmp	.LBB0_1
	.p2align	4, 0x90
.LBB0_2:                                # %while_body
                                        #   in Loop: Header=BB0_1 Depth=1
	movl	(%r13), %esi
	movq	%r12, %rdi
	callq	series_getcard@PLT
	andb	$1, %dl
	movb	%dl, 8(%rbx)
	movq	%rax, (%rbx)
	movl	8(%rbx), %esi
	movq	%rax, %rdi
	callq	getcardtype@PLT
	movq	%rax, %rcx
	xorl	%eax, %eax
	movq	%r14, %rdi
	movq	%rcx, %rsi
	callq	printf@PLT
	movq	(%rbx), %rdi
	movl	8(%rbx), %esi
	callq	getcardfaceup@PLT
	movzbl	%al, %esi
	xorl	%eax, %eax
	movq	%r15, %rdi
	callq	printf@PLT
	incl	(%r13)
.LBB0_1:                                # %while
                                        # =>This Inner Loop Header: Depth=1
	movl	(%r13), %ebp
	movq	%r12, %rdi
	callq	series_sizecard@PLT
	cmpl	%eax, %ebp
	jl	.LBB0_2
# %bb.3:                                # %merge
	xorl	%eax, %eax
	addq	$16472, %rsp            # imm = 0x4058
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.globl	series_pushbool         # -- Begin function series_pushbool
	.p2align	4, 0x90
	.type	series_pushbool,@function
series_pushbool:                        # @series_pushbool
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
	.size	series_pushbool, .Lfunc_end1-series_pushbool
	.cfi_endproc
                                        # -- End function
	.globl	series_pushint          # -- Begin function series_pushint
	.p2align	4, 0x90
	.type	series_pushint,@function
series_pushint:                         # @series_pushint
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
	.size	series_pushint, .Lfunc_end2-series_pushint
	.cfi_endproc
                                        # -- End function
	.globl	series_pushfloat        # -- Begin function series_pushfloat
	.p2align	4, 0x90
	.type	series_pushfloat,@function
series_pushfloat:                       # @series_pushfloat
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
	.size	series_pushfloat, .Lfunc_end3-series_pushfloat
	.cfi_endproc
                                        # -- End function
	.globl	series_pushstr          # -- Begin function series_pushstr
	.p2align	4, 0x90
	.type	series_pushstr,@function
series_pushstr:                         # @series_pushstr
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
	.size	series_pushstr, .Lfunc_end4-series_pushstr
	.cfi_endproc
                                        # -- End function
	.globl	series_pushcard         # -- Begin function series_pushcard
	.p2align	4, 0x90
	.type	series_pushcard,@function
series_pushcard:                        # @series_pushcard
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movq	%rsi, -24(%rsp)
	andl	$1, %edx
	movb	%dl, -16(%rsp)
	movq	(%rdi), %rax
	movq	8(%rdi), %rcx
	movslq	(%rax), %rdx
	leal	1(%rdx), %esi
	shlq	$4, %rdx
	movl	%esi, (%rax)
	movq	-24(%rsp), %rsi
	movb	-16(%rsp), %al
	movb	%al, 8(%rcx,%rdx)
	movq	%rsi, (%rcx,%rdx)
	retq
.Lfunc_end5:
	.size	series_pushcard, .Lfunc_end5-series_pushcard
	.cfi_endproc
                                        # -- End function
	.globl	series_pushplayer       # -- Begin function series_pushplayer
	.p2align	4, 0x90
	.type	series_pushplayer,@function
series_pushplayer:                      # @series_pushplayer
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movl	%edx, -16(%rsp)
	movq	%rsi, -24(%rsp)
	movq	(%rdi), %rax
	movq	8(%rdi), %rcx
	movslq	(%rax), %rdx
	leal	1(%rdx), %esi
	shlq	$4, %rdx
	movl	%esi, (%rax)
	movq	-24(%rsp), %rax
	movl	-16(%rsp), %esi
	movl	%esi, 8(%rcx,%rdx)
	movq	%rax, (%rcx,%rdx)
	retq
.Lfunc_end6:
	.size	series_pushplayer, .Lfunc_end6-series_pushplayer
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
.Lfunc_end7:
	.size	series_getbool, .Lfunc_end7-series_getbool
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
.Lfunc_end8:
	.size	series_getint, .Lfunc_end8-series_getint
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
.Lfunc_end9:
	.size	series_getfloat, .Lfunc_end9-series_getfloat
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
.Lfunc_end10:
	.size	series_getstr, .Lfunc_end10-series_getstr
	.cfi_endproc
                                        # -- End function
	.globl	series_getcard          # -- Begin function series_getcard
	.p2align	4, 0x90
	.type	series_getcard,@function
series_getcard:                         # @series_getcard
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movl	%esi, -12(%rsp)
	movq	8(%rdi), %rcx
	movslq	-12(%rsp), %rdx
	shlq	$4, %rdx
	movq	(%rcx,%rdx), %rax
	movb	8(%rcx,%rdx), %dl
	retq
.Lfunc_end11:
	.size	series_getcard, .Lfunc_end11-series_getcard
	.cfi_endproc
                                        # -- End function
	.globl	series_getplayer        # -- Begin function series_getplayer
	.p2align	4, 0x90
	.type	series_getplayer,@function
series_getplayer:                       # @series_getplayer
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movl	%esi, -12(%rsp)
	movq	8(%rdi), %rcx
	movslq	-12(%rsp), %rdx
	shlq	$4, %rdx
	movq	(%rcx,%rdx), %rax
	movl	8(%rcx,%rdx), %edx
	retq
.Lfunc_end12:
	.size	series_getplayer, .Lfunc_end12-series_getplayer
	.cfi_endproc
                                        # -- End function
	.globl	series_sizebool         # -- Begin function series_sizebool
	.p2align	4, 0x90
	.type	series_sizebool,@function
series_sizebool:                        # @series_sizebool
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movq	(%rdi), %rax
	movl	(%rax), %eax
	retq
.Lfunc_end13:
	.size	series_sizebool, .Lfunc_end13-series_sizebool
	.cfi_endproc
                                        # -- End function
	.globl	series_sizeint          # -- Begin function series_sizeint
	.p2align	4, 0x90
	.type	series_sizeint,@function
series_sizeint:                         # @series_sizeint
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movq	(%rdi), %rax
	movl	(%rax), %eax
	retq
.Lfunc_end14:
	.size	series_sizeint, .Lfunc_end14-series_sizeint
	.cfi_endproc
                                        # -- End function
	.globl	series_sizefloat        # -- Begin function series_sizefloat
	.p2align	4, 0x90
	.type	series_sizefloat,@function
series_sizefloat:                       # @series_sizefloat
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movq	(%rdi), %rax
	movl	(%rax), %eax
	retq
.Lfunc_end15:
	.size	series_sizefloat, .Lfunc_end15-series_sizefloat
	.cfi_endproc
                                        # -- End function
	.globl	series_sizestr          # -- Begin function series_sizestr
	.p2align	4, 0x90
	.type	series_sizestr,@function
series_sizestr:                         # @series_sizestr
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movq	(%rdi), %rax
	movl	(%rax), %eax
	retq
.Lfunc_end16:
	.size	series_sizestr, .Lfunc_end16-series_sizestr
	.cfi_endproc
                                        # -- End function
	.globl	series_sizecard         # -- Begin function series_sizecard
	.p2align	4, 0x90
	.type	series_sizecard,@function
series_sizecard:                        # @series_sizecard
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movq	(%rdi), %rax
	movl	(%rax), %eax
	retq
.Lfunc_end17:
	.size	series_sizecard, .Lfunc_end17-series_sizecard
	.cfi_endproc
                                        # -- End function
	.globl	series_sizeplayer       # -- Begin function series_sizeplayer
	.p2align	4, 0x90
	.type	series_sizeplayer,@function
series_sizeplayer:                      # @series_sizeplayer
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movq	(%rdi), %rax
	movl	(%rax), %eax
	retq
.Lfunc_end18:
	.size	series_sizeplayer, .Lfunc_end18-series_sizeplayer
	.cfi_endproc
                                        # -- End function
	.globl	series_popbool          # -- Begin function series_popbool
	.p2align	4, 0x90
	.type	series_popbool,@function
series_popbool:                         # @series_popbool
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movq	(%rdi), %rcx
	movq	8(%rdi), %rax
	movl	(%rcx), %edx
	decl	%edx
	movslq	%edx, %rdx
	movb	(%rax,%rdx), %al
	movl	%edx, (%rcx)
	retq
.Lfunc_end19:
	.size	series_popbool, .Lfunc_end19-series_popbool
	.cfi_endproc
                                        # -- End function
	.globl	series_popint           # -- Begin function series_popint
	.p2align	4, 0x90
	.type	series_popint,@function
series_popint:                          # @series_popint
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movq	(%rdi), %rcx
	movq	8(%rdi), %rax
	movl	(%rcx), %edx
	decl	%edx
	movslq	%edx, %rdx
	movl	(%rax,%rdx,4), %eax
	movl	%edx, (%rcx)
	retq
.Lfunc_end20:
	.size	series_popint, .Lfunc_end20-series_popint
	.cfi_endproc
                                        # -- End function
	.globl	series_popfloat         # -- Begin function series_popfloat
	.p2align	4, 0x90
	.type	series_popfloat,@function
series_popfloat:                        # @series_popfloat
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movq	(%rdi), %rax
	movq	8(%rdi), %rcx
	movl	(%rax), %edx
	decl	%edx
	movslq	%edx, %rdx
	movsd	(%rcx,%rdx,8), %xmm0    # xmm0 = mem[0],zero
	movl	%edx, (%rax)
	retq
.Lfunc_end21:
	.size	series_popfloat, .Lfunc_end21-series_popfloat
	.cfi_endproc
                                        # -- End function
	.globl	series_popstr           # -- Begin function series_popstr
	.p2align	4, 0x90
	.type	series_popstr,@function
series_popstr:                          # @series_popstr
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movq	(%rdi), %rcx
	movq	8(%rdi), %rax
	movl	(%rcx), %edx
	decl	%edx
	movslq	%edx, %rdx
	movq	(%rax,%rdx,8), %rax
	movl	%edx, (%rcx)
	retq
.Lfunc_end22:
	.size	series_popstr, .Lfunc_end22-series_popstr
	.cfi_endproc
                                        # -- End function
	.globl	series_popcard          # -- Begin function series_popcard
	.p2align	4, 0x90
	.type	series_popcard,@function
series_popcard:                         # @series_popcard
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movq	(%rdi), %rcx
	movq	8(%rdi), %rdx
	movl	(%rcx), %eax
	decl	%eax
	movslq	%eax, %rsi
	movq	%rsi, %rdi
	shlq	$4, %rdi
	movq	(%rdx,%rdi), %rax
	movb	8(%rdx,%rdi), %dl
	movl	%esi, (%rcx)
	retq
.Lfunc_end23:
	.size	series_popcard, .Lfunc_end23-series_popcard
	.cfi_endproc
                                        # -- End function
	.globl	series_popplayer        # -- Begin function series_popplayer
	.p2align	4, 0x90
	.type	series_popplayer,@function
series_popplayer:                       # @series_popplayer
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movq	(%rdi), %rcx
	movq	8(%rdi), %rax
	movl	(%rcx), %edx
	decl	%edx
	movslq	%edx, %rsi
	movq	%rsi, %rdi
	shlq	$4, %rdi
	movl	8(%rax,%rdi), %edx
	movq	(%rax,%rdi), %rax
	movl	%esi, (%rcx)
	retq
.Lfunc_end24:
	.size	series_popplayer, .Lfunc_end24-series_popplayer
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

	.type	type1,@object           # @type1
	.bss
	.globl	type1
	.p2align	3
type1:
	.zero	16
	.size	type1, 16

	.type	card3,@object           # @card3
	.globl	card3
	.p2align	3
card3:
	.zero	16
	.size	card3, 16

	.type	card1,@object           # @card1
	.globl	card1
	.p2align	3
card1:
	.zero	16
	.size	card1, 16

	.type	card2,@object           # @card2
	.globl	card2
	.p2align	3
card2:
	.zero	16
	.size	card2, 16

	.type	deck,@object            # @deck
	.globl	deck
	.p2align	3
deck:
	.zero	16
	.size	deck, 16

	.type	i,@object               # @i
	.globl	i
	.p2align	2
i:
	.long	0                       # 0x0
	.size	i, 4

	.type	.Lstr.4,@object         # @str.4
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstr.4:
	.asciz	"R5"
	.size	.Lstr.4, 3

	.type	.Lstr.5,@object         # @str.5
.Lstr.5:
	.asciz	"R6"
	.size	.Lstr.5, 3

	.type	.Lstr.6,@object         # @str.6
.Lstr.6:
	.asciz	"R7"
	.size	.Lstr.6, 3


	.section	".note.GNU-stack","",@progbits
