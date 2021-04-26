	.text
	.file	"AHOD"
	.globl	COMMENT                 # -- Begin function COMMENT
	.p2align	4, 0x90
	.type	COMMENT,@function
COMMENT:                                # @COMMENT
	.cfi_startproc
# %bb.0:                                # %entry
	movl	%edi, -4(%rsp)
	cmpl	$6, %edi
	jle	.LBB0_2
# %bb.1:                                # %then
	leaq	.Lstr.4(%rip), %rax
	jmp	.LBB0_3
.LBB0_2:                                # %else
	leaq	.Lstr.5(%rip), %rax
.LBB0_3:                                # %merge
	movq	%rax, -16(%rsp)
	movq	-16(%rsp), %rax
	retq
.Lfunc_end0:
	.size	COMMENT, .Lfunc_end0-COMMENT
	.cfi_endproc
                                        # -- End function
	.globl	INIT                    # -- Begin function INIT
	.p2align	4, 0x90
	.type	INIT,@function
INIT:                                   # @INIT
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	subq	$16472, %rsp            # imm = 0x4058
	.cfi_def_cfa_offset 16496
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	leaq	.Lstr.30(%rip), %rdi
	xorl	%esi, %esi
	callq	playercall@PLT
	movq	player@GOTPCREL(%rip), %rbx
	movl	%edx, 8(%rbx)
	movq	%rax, (%rbx)
	movq	str@GOTPCREL(%rip), %r14
	leaq	.Lstr.31(%rip), %rsi
	xorl	%eax, %eax
	movq	%r14, %rdi
	callq	printf@PLT
	leaq	.Lstr.32(%rip), %rsi
	xorl	%eax, %eax
	movq	%r14, %rdi
	callq	printf@PLT
	movq	(%rbx), %rdi
	movl	8(%rbx), %esi
	callq	getplayername@PLT
	movq	%rax, %rcx
	xorl	%eax, %eax
	movq	%r14, %rdi
	movq	%rcx, %rsi
	callq	printf@PLT
	movl	$0, 4(%rsp)
	leaq	4(%rsp), %rax
	movq	%rax, 8(%rsp)
	leaq	24(%rsp), %rax
	movq	%rax, 16(%rsp)
	leaq	.Lstr.33(%rip), %rdi
	movl	$1, %esi
	movl	$6, %edx
	callq	cardcall@PLT
	movzbl	%dl, %edx
	leaq	8(%rsp), %rdi
	movq	%rax, %rsi
	callq	series_pushcard.10@PLT
	movq	8(%rsp), %rdi
	movq	16(%rsp), %rsi
	movq	deck@GOTPCREL(%rip), %rbx
	movq	%rdi, (%rbx)
	movq	%rsi, 8(%rbx)
	callq	CREATEDECK@PLT
	movq	%rdx, 8(%rbx)
	movq	%rax, (%rbx)
	addq	$16472, %rsp            # imm = 0x4058
	popq	%rbx
	popq	%r14
	retq
.Lfunc_end1:
	.size	INIT, .Lfunc_end1-INIT
	.cfi_endproc
                                        # -- End function
	.globl	CREATEDECK              # -- Begin function CREATEDECK
	.p2align	4, 0x90
	.type	CREATEDECK,@function
CREATEDECK:                             # @CREATEDECK
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	subq	$41248, %rsp            # imm = 0xA120
	.cfi_def_cfa_offset 41296
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movl	$0, 124(%rsp)
	movq	%rdi, 80(%rsp)
	movq	%rsi, 88(%rsp)
	movl	$0, 12(%rsp)
	leaq	12(%rsp), %rax
	movq	%rax, 64(%rsp)
	leaq	16576(%rsp), %rax
	movq	%rax, 72(%rsp)
	movl	$0, 8(%rsp)
	leaq	8(%rsp), %rax
	movq	%rax, 48(%rsp)
	leaq	4240(%rsp), %rax
	movq	%rax, 56(%rsp)
	movl	$0, 4(%rsp)
	leaq	4(%rsp), %rax
	movq	%rax, 32(%rsp)
	leaq	8352(%rsp), %rax
	movq	%rax, 40(%rsp)
	leaq	.Lstr.58(%rip), %rsi
	leaq	32(%rsp), %rbx
	movq	%rbx, %rdi
	callq	series_pushstr.37@PLT
	leaq	.Lstr.59(%rip), %rsi
	movq	%rbx, %rdi
	callq	series_pushstr.37@PLT
	leaq	.Lstr.60(%rip), %rsi
	movq	%rbx, %rdi
	callq	series_pushstr.37@PLT
	leaq	.Lstr.61(%rip), %rsi
	movq	%rbx, %rdi
	callq	series_pushstr.37@PLT
	leaq	.Lstr.62(%rip), %rsi
	movq	%rbx, %rdi
	callq	series_pushstr.37@PLT
	movq	32(%rsp), %rax
	movq	40(%rsp), %rcx
	movq	%rcx, 72(%rsp)
	movq	%rax, 64(%rsp)
	movl	$0, (%rsp)
	movq	%rsp, %rax
	movq	%rax, 16(%rsp)
	leaq	128(%rsp), %rax
	movq	%rax, 24(%rsp)
	leaq	16(%rsp), %rbx
	movl	$3, %esi
	movq	%rbx, %rdi
	callq	series_pushint.35@PLT
	movl	$9, %esi
	movq	%rbx, %rdi
	callq	series_pushint.35@PLT
	movl	$9, %esi
	movq	%rbx, %rdi
	callq	series_pushint.35@PLT
	movl	$2, %esi
	movq	%rbx, %rdi
	callq	series_pushint.35@PLT
	movl	$3, %esi
	movq	%rbx, %rdi
	callq	series_pushint.35@PLT
	movq	16(%rsp), %rax
	movq	24(%rsp), %rcx
	movq	%rcx, 56(%rsp)
	movq	%rax, 48(%rsp)
	movq	i@GOTPCREL(%rip), %rbx
	movl	$0, (%rbx)
	leaq	64(%rsp), %r12
	leaq	48(%rsp), %r14
	leaq	80(%rsp), %r15
	jmp	.LBB2_1
	.p2align	4, 0x90
.LBB2_2:                                # %while_body
                                        #   in Loop: Header=BB2_1 Depth=1
	movl	(%rbx), %esi
	movq	%r12, %rdi
	callq	series_getstr.43@PLT
	movq	%rax, 112(%rsp)
	movl	(%rbx), %esi
	movq	%r14, %rdi
	callq	series_getint.41@PLT
	movl	%eax, 120(%rsp)
	movq	112(%rsp), %rdi
	movl	$1, %esi
	movl	%eax, %edx
	callq	cardcall@PLT
	andb	$1, %dl
	movb	%dl, 104(%rsp)
	movq	%rax, 96(%rsp)
	movl	%ecx, 108(%rsp)
	movl	104(%rsp), %edx
	movq	%r15, %rdi
	movq	%rax, %rsi
	callq	series_pushcard.38@PLT
	incl	(%rbx)
.LBB2_1:                                # %while
                                        # =>This Inner Loop Header: Depth=1
	movl	(%rbx), %ebp
	movq	%r12, %rdi
	callq	series_sizestr.49@PLT
	cmpl	%eax, %ebp
	jl	.LBB2_2
# %bb.3:                                # %merge
	movq	80(%rsp), %rax
	movq	88(%rsp), %rdx
	addq	$41248, %rsp            # imm = 0xA120
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end2:
	.size	CREATEDECK, .Lfunc_end2-CREATEDECK
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
.Lfunc_end3:
	.size	series_pushbool, .Lfunc_end3-series_pushbool
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
.Lfunc_end4:
	.size	series_pushint, .Lfunc_end4-series_pushint
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
.Lfunc_end5:
	.size	series_pushfloat, .Lfunc_end5-series_pushfloat
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
.Lfunc_end6:
	.size	series_pushstr, .Lfunc_end6-series_pushstr
	.cfi_endproc
                                        # -- End function
	.globl	series_pushcard         # -- Begin function series_pushcard
	.p2align	4, 0x90
	.type	series_pushcard,@function
series_pushcard:                        # @series_pushcard
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movl	%ecx, -12(%rsp)
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
	movl	-12(%rsp), %edi
	movl	%edi, 12(%rcx,%rdx)
	movb	%al, 8(%rcx,%rdx)
	movq	%rsi, (%rcx,%rdx)
	retq
.Lfunc_end7:
	.size	series_pushcard, .Lfunc_end7-series_pushcard
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
.Lfunc_end8:
	.size	series_pushplayer, .Lfunc_end8-series_pushplayer
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
.Lfunc_end9:
	.size	series_getbool, .Lfunc_end9-series_getbool
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
.Lfunc_end10:
	.size	series_getint, .Lfunc_end10-series_getint
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
.Lfunc_end11:
	.size	series_getfloat, .Lfunc_end11-series_getfloat
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
.Lfunc_end12:
	.size	series_getstr, .Lfunc_end12-series_getstr
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
	movq	8(%rdi), %rdx
	movslq	-12(%rsp), %rsi
	shlq	$4, %rsi
	movq	(%rdx,%rsi), %rax
	movl	12(%rdx,%rsi), %ecx
	movb	8(%rdx,%rsi), %dl
	retq
.Lfunc_end13:
	.size	series_getcard, .Lfunc_end13-series_getcard
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
.Lfunc_end14:
	.size	series_getplayer, .Lfunc_end14-series_getplayer
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
.Lfunc_end15:
	.size	series_sizebool, .Lfunc_end15-series_sizebool
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
.Lfunc_end16:
	.size	series_sizeint, .Lfunc_end16-series_sizeint
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
.Lfunc_end17:
	.size	series_sizefloat, .Lfunc_end17-series_sizefloat
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
.Lfunc_end18:
	.size	series_sizestr, .Lfunc_end18-series_sizestr
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
.Lfunc_end19:
	.size	series_sizecard, .Lfunc_end19-series_sizecard
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
.Lfunc_end20:
	.size	series_sizeplayer, .Lfunc_end20-series_sizeplayer
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
.Lfunc_end21:
	.size	series_popbool, .Lfunc_end21-series_popbool
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
.Lfunc_end22:
	.size	series_popint, .Lfunc_end22-series_popint
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
.Lfunc_end23:
	.size	series_popfloat, .Lfunc_end23-series_popfloat
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
.Lfunc_end24:
	.size	series_popstr, .Lfunc_end24-series_popstr
	.cfi_endproc
                                        # -- End function
	.globl	series_popcard          # -- Begin function series_popcard
	.p2align	4, 0x90
	.type	series_popcard,@function
series_popcard:                         # @series_popcard
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movq	(%rdi), %r8
	movq	8(%rdi), %rdx
	movl	(%r8), %eax
	decl	%eax
	movslq	%eax, %rsi
	movq	%rsi, %rdi
	shlq	$4, %rdi
	movl	12(%rdx,%rdi), %ecx
	movq	(%rdx,%rdi), %rax
	movb	8(%rdx,%rdi), %dl
	movl	%esi, (%r8)
	retq
.Lfunc_end25:
	.size	series_popcard, .Lfunc_end25-series_popcard
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
.Lfunc_end26:
	.size	series_popplayer, .Lfunc_end26-series_popplayer
	.cfi_endproc
                                        # -- End function
	.globl	series_pushbool.6       # -- Begin function series_pushbool.6
	.p2align	4, 0x90
	.type	series_pushbool.6,@function
series_pushbool.6:                      # @series_pushbool.6
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
.Lfunc_end27:
	.size	series_pushbool.6, .Lfunc_end27-series_pushbool.6
	.cfi_endproc
                                        # -- End function
	.globl	series_pushint.7        # -- Begin function series_pushint.7
	.p2align	4, 0x90
	.type	series_pushint.7,@function
series_pushint.7:                       # @series_pushint.7
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
.Lfunc_end28:
	.size	series_pushint.7, .Lfunc_end28-series_pushint.7
	.cfi_endproc
                                        # -- End function
	.globl	series_pushfloat.8      # -- Begin function series_pushfloat.8
	.p2align	4, 0x90
	.type	series_pushfloat.8,@function
series_pushfloat.8:                     # @series_pushfloat.8
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
.Lfunc_end29:
	.size	series_pushfloat.8, .Lfunc_end29-series_pushfloat.8
	.cfi_endproc
                                        # -- End function
	.globl	series_pushstr.9        # -- Begin function series_pushstr.9
	.p2align	4, 0x90
	.type	series_pushstr.9,@function
series_pushstr.9:                       # @series_pushstr.9
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
.Lfunc_end30:
	.size	series_pushstr.9, .Lfunc_end30-series_pushstr.9
	.cfi_endproc
                                        # -- End function
	.globl	series_pushcard.10      # -- Begin function series_pushcard.10
	.p2align	4, 0x90
	.type	series_pushcard.10,@function
series_pushcard.10:                     # @series_pushcard.10
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movl	%ecx, -12(%rsp)
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
	movl	-12(%rsp), %edi
	movl	%edi, 12(%rcx,%rdx)
	movb	%al, 8(%rcx,%rdx)
	movq	%rsi, (%rcx,%rdx)
	retq
.Lfunc_end31:
	.size	series_pushcard.10, .Lfunc_end31-series_pushcard.10
	.cfi_endproc
                                        # -- End function
	.globl	series_pushplayer.11    # -- Begin function series_pushplayer.11
	.p2align	4, 0x90
	.type	series_pushplayer.11,@function
series_pushplayer.11:                   # @series_pushplayer.11
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
.Lfunc_end32:
	.size	series_pushplayer.11, .Lfunc_end32-series_pushplayer.11
	.cfi_endproc
                                        # -- End function
	.globl	series_getbool.12       # -- Begin function series_getbool.12
	.p2align	4, 0x90
	.type	series_getbool.12,@function
series_getbool.12:                      # @series_getbool.12
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movl	%esi, -12(%rsp)
	movq	8(%rdi), %rax
	movslq	-12(%rsp), %rcx
	movb	(%rax,%rcx), %al
	retq
.Lfunc_end33:
	.size	series_getbool.12, .Lfunc_end33-series_getbool.12
	.cfi_endproc
                                        # -- End function
	.globl	series_getint.13        # -- Begin function series_getint.13
	.p2align	4, 0x90
	.type	series_getint.13,@function
series_getint.13:                       # @series_getint.13
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movl	%esi, -12(%rsp)
	movq	8(%rdi), %rax
	movslq	-12(%rsp), %rcx
	movl	(%rax,%rcx,4), %eax
	retq
.Lfunc_end34:
	.size	series_getint.13, .Lfunc_end34-series_getint.13
	.cfi_endproc
                                        # -- End function
	.globl	series_getfloat.14      # -- Begin function series_getfloat.14
	.p2align	4, 0x90
	.type	series_getfloat.14,@function
series_getfloat.14:                     # @series_getfloat.14
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movl	%esi, -12(%rsp)
	movq	8(%rdi), %rax
	movslq	-12(%rsp), %rcx
	movsd	(%rax,%rcx,8), %xmm0    # xmm0 = mem[0],zero
	retq
.Lfunc_end35:
	.size	series_getfloat.14, .Lfunc_end35-series_getfloat.14
	.cfi_endproc
                                        # -- End function
	.globl	series_getstr.15        # -- Begin function series_getstr.15
	.p2align	4, 0x90
	.type	series_getstr.15,@function
series_getstr.15:                       # @series_getstr.15
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movl	%esi, -12(%rsp)
	movq	8(%rdi), %rax
	movslq	-12(%rsp), %rcx
	movq	(%rax,%rcx,8), %rax
	retq
.Lfunc_end36:
	.size	series_getstr.15, .Lfunc_end36-series_getstr.15
	.cfi_endproc
                                        # -- End function
	.globl	series_getcard.16       # -- Begin function series_getcard.16
	.p2align	4, 0x90
	.type	series_getcard.16,@function
series_getcard.16:                      # @series_getcard.16
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movl	%esi, -12(%rsp)
	movq	8(%rdi), %rdx
	movslq	-12(%rsp), %rsi
	shlq	$4, %rsi
	movq	(%rdx,%rsi), %rax
	movl	12(%rdx,%rsi), %ecx
	movb	8(%rdx,%rsi), %dl
	retq
.Lfunc_end37:
	.size	series_getcard.16, .Lfunc_end37-series_getcard.16
	.cfi_endproc
                                        # -- End function
	.globl	series_getplayer.17     # -- Begin function series_getplayer.17
	.p2align	4, 0x90
	.type	series_getplayer.17,@function
series_getplayer.17:                    # @series_getplayer.17
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
.Lfunc_end38:
	.size	series_getplayer.17, .Lfunc_end38-series_getplayer.17
	.cfi_endproc
                                        # -- End function
	.globl	series_sizebool.18      # -- Begin function series_sizebool.18
	.p2align	4, 0x90
	.type	series_sizebool.18,@function
series_sizebool.18:                     # @series_sizebool.18
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movq	(%rdi), %rax
	movl	(%rax), %eax
	retq
.Lfunc_end39:
	.size	series_sizebool.18, .Lfunc_end39-series_sizebool.18
	.cfi_endproc
                                        # -- End function
	.globl	series_sizeint.19       # -- Begin function series_sizeint.19
	.p2align	4, 0x90
	.type	series_sizeint.19,@function
series_sizeint.19:                      # @series_sizeint.19
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movq	(%rdi), %rax
	movl	(%rax), %eax
	retq
.Lfunc_end40:
	.size	series_sizeint.19, .Lfunc_end40-series_sizeint.19
	.cfi_endproc
                                        # -- End function
	.globl	series_sizefloat.20     # -- Begin function series_sizefloat.20
	.p2align	4, 0x90
	.type	series_sizefloat.20,@function
series_sizefloat.20:                    # @series_sizefloat.20
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movq	(%rdi), %rax
	movl	(%rax), %eax
	retq
.Lfunc_end41:
	.size	series_sizefloat.20, .Lfunc_end41-series_sizefloat.20
	.cfi_endproc
                                        # -- End function
	.globl	series_sizestr.21       # -- Begin function series_sizestr.21
	.p2align	4, 0x90
	.type	series_sizestr.21,@function
series_sizestr.21:                      # @series_sizestr.21
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movq	(%rdi), %rax
	movl	(%rax), %eax
	retq
.Lfunc_end42:
	.size	series_sizestr.21, .Lfunc_end42-series_sizestr.21
	.cfi_endproc
                                        # -- End function
	.globl	series_sizecard.22      # -- Begin function series_sizecard.22
	.p2align	4, 0x90
	.type	series_sizecard.22,@function
series_sizecard.22:                     # @series_sizecard.22
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movq	(%rdi), %rax
	movl	(%rax), %eax
	retq
.Lfunc_end43:
	.size	series_sizecard.22, .Lfunc_end43-series_sizecard.22
	.cfi_endproc
                                        # -- End function
	.globl	series_sizeplayer.23    # -- Begin function series_sizeplayer.23
	.p2align	4, 0x90
	.type	series_sizeplayer.23,@function
series_sizeplayer.23:                   # @series_sizeplayer.23
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movq	(%rdi), %rax
	movl	(%rax), %eax
	retq
.Lfunc_end44:
	.size	series_sizeplayer.23, .Lfunc_end44-series_sizeplayer.23
	.cfi_endproc
                                        # -- End function
	.globl	series_popbool.24       # -- Begin function series_popbool.24
	.p2align	4, 0x90
	.type	series_popbool.24,@function
series_popbool.24:                      # @series_popbool.24
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
.Lfunc_end45:
	.size	series_popbool.24, .Lfunc_end45-series_popbool.24
	.cfi_endproc
                                        # -- End function
	.globl	series_popint.25        # -- Begin function series_popint.25
	.p2align	4, 0x90
	.type	series_popint.25,@function
series_popint.25:                       # @series_popint.25
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
.Lfunc_end46:
	.size	series_popint.25, .Lfunc_end46-series_popint.25
	.cfi_endproc
                                        # -- End function
	.globl	series_popfloat.26      # -- Begin function series_popfloat.26
	.p2align	4, 0x90
	.type	series_popfloat.26,@function
series_popfloat.26:                     # @series_popfloat.26
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
.Lfunc_end47:
	.size	series_popfloat.26, .Lfunc_end47-series_popfloat.26
	.cfi_endproc
                                        # -- End function
	.globl	series_popstr.27        # -- Begin function series_popstr.27
	.p2align	4, 0x90
	.type	series_popstr.27,@function
series_popstr.27:                       # @series_popstr.27
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
.Lfunc_end48:
	.size	series_popstr.27, .Lfunc_end48-series_popstr.27
	.cfi_endproc
                                        # -- End function
	.globl	series_popcard.28       # -- Begin function series_popcard.28
	.p2align	4, 0x90
	.type	series_popcard.28,@function
series_popcard.28:                      # @series_popcard.28
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movq	(%rdi), %r8
	movq	8(%rdi), %rdx
	movl	(%r8), %eax
	decl	%eax
	movslq	%eax, %rsi
	movq	%rsi, %rdi
	shlq	$4, %rdi
	movl	12(%rdx,%rdi), %ecx
	movq	(%rdx,%rdi), %rax
	movb	8(%rdx,%rdi), %dl
	movl	%esi, (%r8)
	retq
.Lfunc_end49:
	.size	series_popcard.28, .Lfunc_end49-series_popcard.28
	.cfi_endproc
                                        # -- End function
	.globl	series_popplayer.29     # -- Begin function series_popplayer.29
	.p2align	4, 0x90
	.type	series_popplayer.29,@function
series_popplayer.29:                    # @series_popplayer.29
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
.Lfunc_end50:
	.size	series_popplayer.29, .Lfunc_end50-series_popplayer.29
	.cfi_endproc
                                        # -- End function
	.globl	series_pushbool.34      # -- Begin function series_pushbool.34
	.p2align	4, 0x90
	.type	series_pushbool.34,@function
series_pushbool.34:                     # @series_pushbool.34
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
.Lfunc_end51:
	.size	series_pushbool.34, .Lfunc_end51-series_pushbool.34
	.cfi_endproc
                                        # -- End function
	.globl	series_pushint.35       # -- Begin function series_pushint.35
	.p2align	4, 0x90
	.type	series_pushint.35,@function
series_pushint.35:                      # @series_pushint.35
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
.Lfunc_end52:
	.size	series_pushint.35, .Lfunc_end52-series_pushint.35
	.cfi_endproc
                                        # -- End function
	.globl	series_pushfloat.36     # -- Begin function series_pushfloat.36
	.p2align	4, 0x90
	.type	series_pushfloat.36,@function
series_pushfloat.36:                    # @series_pushfloat.36
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
.Lfunc_end53:
	.size	series_pushfloat.36, .Lfunc_end53-series_pushfloat.36
	.cfi_endproc
                                        # -- End function
	.globl	series_pushstr.37       # -- Begin function series_pushstr.37
	.p2align	4, 0x90
	.type	series_pushstr.37,@function
series_pushstr.37:                      # @series_pushstr.37
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
.Lfunc_end54:
	.size	series_pushstr.37, .Lfunc_end54-series_pushstr.37
	.cfi_endproc
                                        # -- End function
	.globl	series_pushcard.38      # -- Begin function series_pushcard.38
	.p2align	4, 0x90
	.type	series_pushcard.38,@function
series_pushcard.38:                     # @series_pushcard.38
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movl	%ecx, -12(%rsp)
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
	movl	-12(%rsp), %edi
	movl	%edi, 12(%rcx,%rdx)
	movb	%al, 8(%rcx,%rdx)
	movq	%rsi, (%rcx,%rdx)
	retq
.Lfunc_end55:
	.size	series_pushcard.38, .Lfunc_end55-series_pushcard.38
	.cfi_endproc
                                        # -- End function
	.globl	series_pushplayer.39    # -- Begin function series_pushplayer.39
	.p2align	4, 0x90
	.type	series_pushplayer.39,@function
series_pushplayer.39:                   # @series_pushplayer.39
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
.Lfunc_end56:
	.size	series_pushplayer.39, .Lfunc_end56-series_pushplayer.39
	.cfi_endproc
                                        # -- End function
	.globl	series_getbool.40       # -- Begin function series_getbool.40
	.p2align	4, 0x90
	.type	series_getbool.40,@function
series_getbool.40:                      # @series_getbool.40
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movl	%esi, -12(%rsp)
	movq	8(%rdi), %rax
	movslq	-12(%rsp), %rcx
	movb	(%rax,%rcx), %al
	retq
.Lfunc_end57:
	.size	series_getbool.40, .Lfunc_end57-series_getbool.40
	.cfi_endproc
                                        # -- End function
	.globl	series_getint.41        # -- Begin function series_getint.41
	.p2align	4, 0x90
	.type	series_getint.41,@function
series_getint.41:                       # @series_getint.41
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movl	%esi, -12(%rsp)
	movq	8(%rdi), %rax
	movslq	-12(%rsp), %rcx
	movl	(%rax,%rcx,4), %eax
	retq
.Lfunc_end58:
	.size	series_getint.41, .Lfunc_end58-series_getint.41
	.cfi_endproc
                                        # -- End function
	.globl	series_getfloat.42      # -- Begin function series_getfloat.42
	.p2align	4, 0x90
	.type	series_getfloat.42,@function
series_getfloat.42:                     # @series_getfloat.42
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movl	%esi, -12(%rsp)
	movq	8(%rdi), %rax
	movslq	-12(%rsp), %rcx
	movsd	(%rax,%rcx,8), %xmm0    # xmm0 = mem[0],zero
	retq
.Lfunc_end59:
	.size	series_getfloat.42, .Lfunc_end59-series_getfloat.42
	.cfi_endproc
                                        # -- End function
	.globl	series_getstr.43        # -- Begin function series_getstr.43
	.p2align	4, 0x90
	.type	series_getstr.43,@function
series_getstr.43:                       # @series_getstr.43
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movl	%esi, -12(%rsp)
	movq	8(%rdi), %rax
	movslq	-12(%rsp), %rcx
	movq	(%rax,%rcx,8), %rax
	retq
.Lfunc_end60:
	.size	series_getstr.43, .Lfunc_end60-series_getstr.43
	.cfi_endproc
                                        # -- End function
	.globl	series_getcard.44       # -- Begin function series_getcard.44
	.p2align	4, 0x90
	.type	series_getcard.44,@function
series_getcard.44:                      # @series_getcard.44
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movl	%esi, -12(%rsp)
	movq	8(%rdi), %rdx
	movslq	-12(%rsp), %rsi
	shlq	$4, %rsi
	movq	(%rdx,%rsi), %rax
	movl	12(%rdx,%rsi), %ecx
	movb	8(%rdx,%rsi), %dl
	retq
.Lfunc_end61:
	.size	series_getcard.44, .Lfunc_end61-series_getcard.44
	.cfi_endproc
                                        # -- End function
	.globl	series_getplayer.45     # -- Begin function series_getplayer.45
	.p2align	4, 0x90
	.type	series_getplayer.45,@function
series_getplayer.45:                    # @series_getplayer.45
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
.Lfunc_end62:
	.size	series_getplayer.45, .Lfunc_end62-series_getplayer.45
	.cfi_endproc
                                        # -- End function
	.globl	series_sizebool.46      # -- Begin function series_sizebool.46
	.p2align	4, 0x90
	.type	series_sizebool.46,@function
series_sizebool.46:                     # @series_sizebool.46
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movq	(%rdi), %rax
	movl	(%rax), %eax
	retq
.Lfunc_end63:
	.size	series_sizebool.46, .Lfunc_end63-series_sizebool.46
	.cfi_endproc
                                        # -- End function
	.globl	series_sizeint.47       # -- Begin function series_sizeint.47
	.p2align	4, 0x90
	.type	series_sizeint.47,@function
series_sizeint.47:                      # @series_sizeint.47
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movq	(%rdi), %rax
	movl	(%rax), %eax
	retq
.Lfunc_end64:
	.size	series_sizeint.47, .Lfunc_end64-series_sizeint.47
	.cfi_endproc
                                        # -- End function
	.globl	series_sizefloat.48     # -- Begin function series_sizefloat.48
	.p2align	4, 0x90
	.type	series_sizefloat.48,@function
series_sizefloat.48:                    # @series_sizefloat.48
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movq	(%rdi), %rax
	movl	(%rax), %eax
	retq
.Lfunc_end65:
	.size	series_sizefloat.48, .Lfunc_end65-series_sizefloat.48
	.cfi_endproc
                                        # -- End function
	.globl	series_sizestr.49       # -- Begin function series_sizestr.49
	.p2align	4, 0x90
	.type	series_sizestr.49,@function
series_sizestr.49:                      # @series_sizestr.49
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movq	(%rdi), %rax
	movl	(%rax), %eax
	retq
.Lfunc_end66:
	.size	series_sizestr.49, .Lfunc_end66-series_sizestr.49
	.cfi_endproc
                                        # -- End function
	.globl	series_sizecard.50      # -- Begin function series_sizecard.50
	.p2align	4, 0x90
	.type	series_sizecard.50,@function
series_sizecard.50:                     # @series_sizecard.50
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movq	(%rdi), %rax
	movl	(%rax), %eax
	retq
.Lfunc_end67:
	.size	series_sizecard.50, .Lfunc_end67-series_sizecard.50
	.cfi_endproc
                                        # -- End function
	.globl	series_sizeplayer.51    # -- Begin function series_sizeplayer.51
	.p2align	4, 0x90
	.type	series_sizeplayer.51,@function
series_sizeplayer.51:                   # @series_sizeplayer.51
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movq	(%rdi), %rax
	movl	(%rax), %eax
	retq
.Lfunc_end68:
	.size	series_sizeplayer.51, .Lfunc_end68-series_sizeplayer.51
	.cfi_endproc
                                        # -- End function
	.globl	series_popbool.52       # -- Begin function series_popbool.52
	.p2align	4, 0x90
	.type	series_popbool.52,@function
series_popbool.52:                      # @series_popbool.52
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
.Lfunc_end69:
	.size	series_popbool.52, .Lfunc_end69-series_popbool.52
	.cfi_endproc
                                        # -- End function
	.globl	series_popint.53        # -- Begin function series_popint.53
	.p2align	4, 0x90
	.type	series_popint.53,@function
series_popint.53:                       # @series_popint.53
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
.Lfunc_end70:
	.size	series_popint.53, .Lfunc_end70-series_popint.53
	.cfi_endproc
                                        # -- End function
	.globl	series_popfloat.54      # -- Begin function series_popfloat.54
	.p2align	4, 0x90
	.type	series_popfloat.54,@function
series_popfloat.54:                     # @series_popfloat.54
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
.Lfunc_end71:
	.size	series_popfloat.54, .Lfunc_end71-series_popfloat.54
	.cfi_endproc
                                        # -- End function
	.globl	series_popstr.55        # -- Begin function series_popstr.55
	.p2align	4, 0x90
	.type	series_popstr.55,@function
series_popstr.55:                       # @series_popstr.55
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
.Lfunc_end72:
	.size	series_popstr.55, .Lfunc_end72-series_popstr.55
	.cfi_endproc
                                        # -- End function
	.globl	series_popcard.56       # -- Begin function series_popcard.56
	.p2align	4, 0x90
	.type	series_popcard.56,@function
series_popcard.56:                      # @series_popcard.56
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movq	(%rdi), %r8
	movq	8(%rdi), %rdx
	movl	(%r8), %eax
	decl	%eax
	movslq	%eax, %rsi
	movq	%rsi, %rdi
	shlq	$4, %rdi
	movl	12(%rdx,%rdi), %ecx
	movq	(%rdx,%rdi), %rax
	movb	8(%rdx,%rdi), %dl
	movl	%esi, (%r8)
	retq
.Lfunc_end73:
	.size	series_popcard.56, .Lfunc_end73-series_popcard.56
	.cfi_endproc
                                        # -- End function
	.globl	series_popplayer.57     # -- Begin function series_popplayer.57
	.p2align	4, 0x90
	.type	series_popplayer.57,@function
series_popplayer.57:                    # @series_popplayer.57
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
.Lfunc_end74:
	.size	series_popplayer.57, .Lfunc_end74-series_popplayer.57
	.cfi_endproc
                                        # -- End function
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
	subq	$40, %rsp
	.cfi_def_cfa_offset 96
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	callq	INIT@PLT
	movq	str@GOTPCREL(%rip), %r14
	leaq	.Lstr.87(%rip), %rsi
	xorl	%eax, %eax
	movq	%r14, %rdi
	callq	printf@PLT
	movq	deck@GOTPCREL(%rip), %rbx
	movq	%rbx, %rdi
	callq	series_sizecard.79@PLT
                                        # kill: def %eax killed %eax def %rax
	leal	-1(%rax), %esi
	movq	%rbx, %rdi
	callq	series_getcard.73@PLT
	movl	%ecx, 20(%rsp)
	movq	%rax, 8(%rsp)
	andb	$1, %dl
	movb	%dl, 16(%rsp)
	movq	score@GOTPCREL(%rip), %r13
	movl	$0, (%r13)
	leaq	.Lstr.88(%rip), %rsi
	xorl	%eax, %eax
	movq	%r14, %rdi
	callq	printf@PLT
	movq	8(%rsp), %rdi
	movl	20(%rsp), %edx
	movl	16(%rsp), %esi
	callq	getcardtype@PLT
	movq	%rax, %rcx
	xorl	%eax, %eax
	movq	%r14, %rdi
	movq	%rcx, %rsi
	callq	printf@PLT
	leaq	.Lstr.89(%rip), %rsi
	xorl	%eax, %eax
	movq	%r14, %rdi
	callq	printf@PLT
	movl	(%r13), %ebp
	movq	8(%rsp), %rdi
	movl	20(%rsp), %edx
	movl	16(%rsp), %esi
	callq	getcardvalue@PLT
	movl	%eax, %ecx
	addl	%ebp, %ecx
	movl	%ecx, (%r13)
	movq	str.1@GOTPCREL(%rip), %r15
	xorl	%eax, %eax
	movq	%r15, %rdi
	movl	%ecx, %esi
	callq	printf@PLT
	movq	%rbx, %rdi
	callq	series_popcard.85@PLT
	leaq	.Lstr.90(%rip), %rsi
	xorl	%eax, %eax
	movq	%r14, %rdi
	callq	printf@PLT
	movq	%rbx, %rdi
	callq	series_sizecard.79@PLT
                                        # kill: def %eax killed %eax def %rax
	leal	-1(%rax), %esi
	movq	%rbx, %rdi
	callq	series_getcard.73@PLT
	movl	%ecx, 20(%rsp)
	movq	%rax, 8(%rsp)
	andb	$1, %dl
	movb	%dl, 16(%rsp)
	leaq	.Lstr.91(%rip), %rsi
	xorl	%eax, %eax
	movq	%r14, %rdi
	callq	printf@PLT
	movq	8(%rsp), %rdi
	movl	20(%rsp), %edx
	movl	16(%rsp), %esi
	callq	getcardtype@PLT
	movq	%rax, %rcx
	xorl	%eax, %eax
	movq	%r14, %rdi
	movq	%rcx, %rsi
	callq	printf@PLT
	leaq	.Lstr.92(%rip), %rsi
	xorl	%eax, %eax
	movq	%r14, %rdi
	callq	printf@PLT
	movl	(%r13), %ebp
	movq	8(%rsp), %rdi
	movl	20(%rsp), %edx
	movl	16(%rsp), %esi
	callq	getcardvalue@PLT
	movl	%eax, %ecx
	addl	%ebp, %ecx
	movl	%ecx, (%r13)
	xorl	%eax, %eax
	movq	%r15, %rdi
	movl	%ecx, %esi
	callq	printf@PLT
	movq	%rbx, %rdi
	callq	series_popcard.85@PLT
	leaq	.Lstr.93(%rip), %rsi
	xorl	%eax, %eax
	movq	%r14, %rdi
	callq	printf@PLT
	movq	i@GOTPCREL(%rip), %r12
	movl	$0, (%r12)
	jmp	.LBB75_1
	.p2align	4, 0x90
.LBB75_4:                               # %merge
                                        #   in Loop: Header=BB75_1 Depth=1
	callq	printf@PLT
	movl	(%r13), %esi
	xorl	%eax, %eax
	movq	str.1@GOTPCREL(%rip), %rdi
	callq	printf@PLT
	incl	(%r12)
	movq	%rbp, %rbx
.LBB75_1:                               # %while
                                        # =>This Inner Loop Header: Depth=1
	movl	(%r12), %r15d
	movq	%rbx, %rdi
	callq	series_sizecard.79@PLT
	cmpl	%eax, %r15d
	jge	.LBB75_6
# %bb.2:                                # %while_body
                                        #   in Loop: Header=BB75_1 Depth=1
	movl	(%r12), %esi
	movq	%rbx, %rbp
	movq	%rbx, %rdi
	callq	series_getcard.73@PLT
	movl	%ecx, 20(%rsp)
	movq	%rax, 8(%rsp)
	andb	$1, %dl
	movb	%dl, 16(%rsp)
	xorl	%eax, %eax
	movq	%r14, %rdi
	leaq	.Lstr.94(%rip), %rsi
	callq	printf@PLT
	movq	8(%rsp), %rdi
	movl	20(%rsp), %edx
	movl	16(%rsp), %esi
	callq	getcardtype@PLT
	movq	%rax, %rcx
	xorl	%eax, %eax
	movq	%r14, %rdi
	movq	%rcx, %rsi
	callq	printf@PLT
	movl	(%r13), %ebx
	movq	8(%rsp), %rdi
	movl	20(%rsp), %edx
	movl	16(%rsp), %esi
	callq	getcardvalue@PLT
	addl	%ebx, %eax
	movl	%eax, (%r13)
	movl	%eax, %edi
	callq	COMMENT@PLT
	movq	%rax, %rcx
	movq	%rcx, 24(%rsp)
	xorl	%eax, %eax
	movq	%r14, %rdi
	movq	%rcx, %rsi
	callq	printf@PLT
	cmpl	$21, (%r13)
	jge	.LBB75_5
# %bb.3:                                # %then
                                        #   in Loop: Header=BB75_1 Depth=1
	xorl	%eax, %eax
	movq	%r14, %rdi
	leaq	.Lstr.95(%rip), %rsi
	jmp	.LBB75_4
	.p2align	4, 0x90
.LBB75_5:                               # %else
                                        #   in Loop: Header=BB75_1 Depth=1
	xorl	%eax, %eax
	movq	%r14, %rdi
	leaq	.Lstr.96(%rip), %rsi
	jmp	.LBB75_4
.LBB75_6:                               # %merge51
	xorl	%eax, %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end75:
	.size	main, .Lfunc_end75-main
	.cfi_endproc
                                        # -- End function
	.globl	series_pushbool.63      # -- Begin function series_pushbool.63
	.p2align	4, 0x90
	.type	series_pushbool.63,@function
series_pushbool.63:                     # @series_pushbool.63
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
.Lfunc_end76:
	.size	series_pushbool.63, .Lfunc_end76-series_pushbool.63
	.cfi_endproc
                                        # -- End function
	.globl	series_pushint.64       # -- Begin function series_pushint.64
	.p2align	4, 0x90
	.type	series_pushint.64,@function
series_pushint.64:                      # @series_pushint.64
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
.Lfunc_end77:
	.size	series_pushint.64, .Lfunc_end77-series_pushint.64
	.cfi_endproc
                                        # -- End function
	.globl	series_pushfloat.65     # -- Begin function series_pushfloat.65
	.p2align	4, 0x90
	.type	series_pushfloat.65,@function
series_pushfloat.65:                    # @series_pushfloat.65
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
.Lfunc_end78:
	.size	series_pushfloat.65, .Lfunc_end78-series_pushfloat.65
	.cfi_endproc
                                        # -- End function
	.globl	series_pushstr.66       # -- Begin function series_pushstr.66
	.p2align	4, 0x90
	.type	series_pushstr.66,@function
series_pushstr.66:                      # @series_pushstr.66
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
.Lfunc_end79:
	.size	series_pushstr.66, .Lfunc_end79-series_pushstr.66
	.cfi_endproc
                                        # -- End function
	.globl	series_pushcard.67      # -- Begin function series_pushcard.67
	.p2align	4, 0x90
	.type	series_pushcard.67,@function
series_pushcard.67:                     # @series_pushcard.67
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movl	%ecx, -12(%rsp)
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
	movl	-12(%rsp), %edi
	movl	%edi, 12(%rcx,%rdx)
	movb	%al, 8(%rcx,%rdx)
	movq	%rsi, (%rcx,%rdx)
	retq
.Lfunc_end80:
	.size	series_pushcard.67, .Lfunc_end80-series_pushcard.67
	.cfi_endproc
                                        # -- End function
	.globl	series_pushplayer.68    # -- Begin function series_pushplayer.68
	.p2align	4, 0x90
	.type	series_pushplayer.68,@function
series_pushplayer.68:                   # @series_pushplayer.68
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
.Lfunc_end81:
	.size	series_pushplayer.68, .Lfunc_end81-series_pushplayer.68
	.cfi_endproc
                                        # -- End function
	.globl	series_getbool.69       # -- Begin function series_getbool.69
	.p2align	4, 0x90
	.type	series_getbool.69,@function
series_getbool.69:                      # @series_getbool.69
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movl	%esi, -12(%rsp)
	movq	8(%rdi), %rax
	movslq	-12(%rsp), %rcx
	movb	(%rax,%rcx), %al
	retq
.Lfunc_end82:
	.size	series_getbool.69, .Lfunc_end82-series_getbool.69
	.cfi_endproc
                                        # -- End function
	.globl	series_getint.70        # -- Begin function series_getint.70
	.p2align	4, 0x90
	.type	series_getint.70,@function
series_getint.70:                       # @series_getint.70
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movl	%esi, -12(%rsp)
	movq	8(%rdi), %rax
	movslq	-12(%rsp), %rcx
	movl	(%rax,%rcx,4), %eax
	retq
.Lfunc_end83:
	.size	series_getint.70, .Lfunc_end83-series_getint.70
	.cfi_endproc
                                        # -- End function
	.globl	series_getfloat.71      # -- Begin function series_getfloat.71
	.p2align	4, 0x90
	.type	series_getfloat.71,@function
series_getfloat.71:                     # @series_getfloat.71
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movl	%esi, -12(%rsp)
	movq	8(%rdi), %rax
	movslq	-12(%rsp), %rcx
	movsd	(%rax,%rcx,8), %xmm0    # xmm0 = mem[0],zero
	retq
.Lfunc_end84:
	.size	series_getfloat.71, .Lfunc_end84-series_getfloat.71
	.cfi_endproc
                                        # -- End function
	.globl	series_getstr.72        # -- Begin function series_getstr.72
	.p2align	4, 0x90
	.type	series_getstr.72,@function
series_getstr.72:                       # @series_getstr.72
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movl	%esi, -12(%rsp)
	movq	8(%rdi), %rax
	movslq	-12(%rsp), %rcx
	movq	(%rax,%rcx,8), %rax
	retq
.Lfunc_end85:
	.size	series_getstr.72, .Lfunc_end85-series_getstr.72
	.cfi_endproc
                                        # -- End function
	.globl	series_getcard.73       # -- Begin function series_getcard.73
	.p2align	4, 0x90
	.type	series_getcard.73,@function
series_getcard.73:                      # @series_getcard.73
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movl	%esi, -12(%rsp)
	movq	8(%rdi), %rdx
	movslq	-12(%rsp), %rsi
	shlq	$4, %rsi
	movq	(%rdx,%rsi), %rax
	movl	12(%rdx,%rsi), %ecx
	movb	8(%rdx,%rsi), %dl
	retq
.Lfunc_end86:
	.size	series_getcard.73, .Lfunc_end86-series_getcard.73
	.cfi_endproc
                                        # -- End function
	.globl	series_getplayer.74     # -- Begin function series_getplayer.74
	.p2align	4, 0x90
	.type	series_getplayer.74,@function
series_getplayer.74:                    # @series_getplayer.74
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
.Lfunc_end87:
	.size	series_getplayer.74, .Lfunc_end87-series_getplayer.74
	.cfi_endproc
                                        # -- End function
	.globl	series_sizebool.75      # -- Begin function series_sizebool.75
	.p2align	4, 0x90
	.type	series_sizebool.75,@function
series_sizebool.75:                     # @series_sizebool.75
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movq	(%rdi), %rax
	movl	(%rax), %eax
	retq
.Lfunc_end88:
	.size	series_sizebool.75, .Lfunc_end88-series_sizebool.75
	.cfi_endproc
                                        # -- End function
	.globl	series_sizeint.76       # -- Begin function series_sizeint.76
	.p2align	4, 0x90
	.type	series_sizeint.76,@function
series_sizeint.76:                      # @series_sizeint.76
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movq	(%rdi), %rax
	movl	(%rax), %eax
	retq
.Lfunc_end89:
	.size	series_sizeint.76, .Lfunc_end89-series_sizeint.76
	.cfi_endproc
                                        # -- End function
	.globl	series_sizefloat.77     # -- Begin function series_sizefloat.77
	.p2align	4, 0x90
	.type	series_sizefloat.77,@function
series_sizefloat.77:                    # @series_sizefloat.77
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movq	(%rdi), %rax
	movl	(%rax), %eax
	retq
.Lfunc_end90:
	.size	series_sizefloat.77, .Lfunc_end90-series_sizefloat.77
	.cfi_endproc
                                        # -- End function
	.globl	series_sizestr.78       # -- Begin function series_sizestr.78
	.p2align	4, 0x90
	.type	series_sizestr.78,@function
series_sizestr.78:                      # @series_sizestr.78
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movq	(%rdi), %rax
	movl	(%rax), %eax
	retq
.Lfunc_end91:
	.size	series_sizestr.78, .Lfunc_end91-series_sizestr.78
	.cfi_endproc
                                        # -- End function
	.globl	series_sizecard.79      # -- Begin function series_sizecard.79
	.p2align	4, 0x90
	.type	series_sizecard.79,@function
series_sizecard.79:                     # @series_sizecard.79
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movq	(%rdi), %rax
	movl	(%rax), %eax
	retq
.Lfunc_end92:
	.size	series_sizecard.79, .Lfunc_end92-series_sizecard.79
	.cfi_endproc
                                        # -- End function
	.globl	series_sizeplayer.80    # -- Begin function series_sizeplayer.80
	.p2align	4, 0x90
	.type	series_sizeplayer.80,@function
series_sizeplayer.80:                   # @series_sizeplayer.80
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movq	(%rdi), %rax
	movl	(%rax), %eax
	retq
.Lfunc_end93:
	.size	series_sizeplayer.80, .Lfunc_end93-series_sizeplayer.80
	.cfi_endproc
                                        # -- End function
	.globl	series_popbool.81       # -- Begin function series_popbool.81
	.p2align	4, 0x90
	.type	series_popbool.81,@function
series_popbool.81:                      # @series_popbool.81
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
.Lfunc_end94:
	.size	series_popbool.81, .Lfunc_end94-series_popbool.81
	.cfi_endproc
                                        # -- End function
	.globl	series_popint.82        # -- Begin function series_popint.82
	.p2align	4, 0x90
	.type	series_popint.82,@function
series_popint.82:                       # @series_popint.82
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
.Lfunc_end95:
	.size	series_popint.82, .Lfunc_end95-series_popint.82
	.cfi_endproc
                                        # -- End function
	.globl	series_popfloat.83      # -- Begin function series_popfloat.83
	.p2align	4, 0x90
	.type	series_popfloat.83,@function
series_popfloat.83:                     # @series_popfloat.83
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
.Lfunc_end96:
	.size	series_popfloat.83, .Lfunc_end96-series_popfloat.83
	.cfi_endproc
                                        # -- End function
	.globl	series_popstr.84        # -- Begin function series_popstr.84
	.p2align	4, 0x90
	.type	series_popstr.84,@function
series_popstr.84:                       # @series_popstr.84
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
.Lfunc_end97:
	.size	series_popstr.84, .Lfunc_end97-series_popstr.84
	.cfi_endproc
                                        # -- End function
	.globl	series_popcard.85       # -- Begin function series_popcard.85
	.p2align	4, 0x90
	.type	series_popcard.85,@function
series_popcard.85:                      # @series_popcard.85
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movq	(%rdi), %r8
	movq	8(%rdi), %rdx
	movl	(%r8), %eax
	decl	%eax
	movslq	%eax, %rsi
	movq	%rsi, %rdi
	shlq	$4, %rdi
	movl	12(%rdx,%rdi), %ecx
	movq	(%rdx,%rdi), %rax
	movb	8(%rdx,%rdi), %dl
	movl	%esi, (%r8)
	retq
.Lfunc_end98:
	.size	series_popcard.85, .Lfunc_end98-series_popcard.85
	.cfi_endproc
                                        # -- End function
	.globl	series_popplayer.86     # -- Begin function series_popplayer.86
	.p2align	4, 0x90
	.type	series_popplayer.86,@function
series_popplayer.86:                    # @series_popplayer.86
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
.Lfunc_end99:
	.size	series_popplayer.86, .Lfunc_end99-series_popplayer.86
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

	.type	score,@object           # @score
	.bss
	.globl	score
	.p2align	2
score:
	.long	0                       # 0x0
	.size	score, 4

	.type	i,@object               # @i
	.globl	i
	.p2align	2
i:
	.long	0                       # 0x0
	.size	i, 4

	.type	deck,@object            # @deck
	.globl	deck
	.p2align	3
deck:
	.zero	16
	.size	deck, 16

	.type	player,@object          # @player
	.globl	player
	.p2align	3
player:
	.zero	16
	.size	player, 16

	.type	.Lstr.4,@object         # @str.4
	.section	.rodata.str1.16,"aMS",@progbits,1
	.p2align	4
.Lstr.4:
	.asciz	"That is a high value card"
	.size	.Lstr.4, 26

	.type	.Lstr.5,@object         # @str.5
	.p2align	4
.Lstr.5:
	.asciz	"That is a low value card"
	.size	.Lstr.5, 25

	.type	.Lstr.30,@object        # @str.30
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstr.30:
	.asciz	"Stephen"
	.size	.Lstr.30, 8

	.type	.Lstr.31,@object        # @str.31
	.section	.rodata.str1.16,"aMS",@progbits,1
	.p2align	4
.Lstr.31:
	.asciz	"Hello, and welcome to our Blackjack Simulator"
	.size	.Lstr.31, 46

	.type	.Lstr.32,@object        # @str.32
	.p2align	4
.Lstr.32:
	.asciz	"First things first let us welcome our player for the evening"
	.size	.Lstr.32, 61

	.type	.Lstr.33,@object        # @str.33
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstr.33:
	.asciz	"R6"
	.size	.Lstr.33, 3

	.type	.Lstr.58,@object        # @str.58
.Lstr.58:
	.asciz	"R5"
	.size	.Lstr.58, 3

	.type	.Lstr.59,@object        # @str.59
.Lstr.59:
	.asciz	"R9"
	.size	.Lstr.59, 3

	.type	.Lstr.60,@object        # @str.60
.Lstr.60:
	.asciz	"B9"
	.size	.Lstr.60, 3

	.type	.Lstr.61,@object        # @str.61
.Lstr.61:
	.asciz	"B2"
	.size	.Lstr.61, 3

	.type	.Lstr.62,@object        # @str.62
.Lstr.62:
	.asciz	"R3"
	.size	.Lstr.62, 3

	.type	.Lstr.87,@object        # @str.87
	.section	.rodata.str1.16,"aMS",@progbits,1
	.p2align	4
.Lstr.87:
	.asciz	"There are 5 cards in the hand. A Hit Request"
	.size	.Lstr.87, 45

	.type	.Lstr.88,@object        # @str.88
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstr.88:
	.asciz	"Card:"
	.size	.Lstr.88, 6

	.type	.Lstr.89,@object        # @str.89
	.section	.rodata.str1.16,"aMS",@progbits,1
	.p2align	4
.Lstr.89:
	.asciz	"Current Score of:"
	.size	.Lstr.89, 18

	.type	.Lstr.90,@object        # @str.90
	.p2align	4
.Lstr.90:
	.asciz	"Another hit request"
	.size	.Lstr.90, 20

	.type	.Lstr.91,@object        # @str.91
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstr.91:
	.asciz	"Card:"
	.size	.Lstr.91, 6

	.type	.Lstr.92,@object        # @str.92
	.section	.rodata.str1.16,"aMS",@progbits,1
	.p2align	4
.Lstr.92:
	.asciz	"Current Score of:"
	.size	.Lstr.92, 18

	.type	.Lstr.93,@object        # @str.93
	.p2align	4
.Lstr.93:
	.asciz	"Looks like we stop here for tonight. Time to see what the next cards were"
	.size	.Lstr.93, 74

	.type	.Lstr.94,@object        # @str.94
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstr.94:
	.asciz	"Card:"
	.size	.Lstr.94, 6

	.type	.Lstr.95,@object        # @str.95
	.section	.rodata.str1.16,"aMS",@progbits,1
	.p2align	4
.Lstr.95:
	.asciz	"Could have had a higher score of: "
	.size	.Lstr.95, 35

	.type	.Lstr.96,@object        # @str.96
	.p2align	4
.Lstr.96:
	.asciz	"Good that you stopped otherwise you would have a score of: "
	.size	.Lstr.96, 60


	.section	".note.GNU-stack","",@progbits
