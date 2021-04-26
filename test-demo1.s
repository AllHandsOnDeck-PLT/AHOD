	.text
	.file	"AHOD"
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
	pushq	%rbx
	.cfi_def_cfa_offset 40
	subq	$32984, %rsp            # imm = 0x80D8
	.cfi_def_cfa_offset 33024
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movl	$0, 60(%rsp)
	movq	%rdi, 40(%rsp)
	movq	%rsi, 48(%rsp)
	movl	$0, 4(%rsp)
	leaq	4(%rsp), %rax
	movq	%rax, 24(%rsp)
	leaq	8312(%rsp), %rax
	movq	%rax, 32(%rsp)
	movl	$0, (%rsp)
	movq	%rsp, %rax
	movq	%rax, 8(%rsp)
	leaq	88(%rsp), %rax
	movq	%rax, 16(%rsp)
	leaq	.Lstr.4(%rip), %rsi
	leaq	8(%rsp), %rbx
	movq	%rbx, %rdi
	callq	series_pushstr@PLT
	leaq	.Lstr.5(%rip), %rsi
	movq	%rbx, %rdi
	callq	series_pushstr@PLT
	leaq	.Lstr.6(%rip), %rsi
	movq	%rbx, %rdi
	callq	series_pushstr@PLT
	leaq	.Lstr.7(%rip), %rsi
	movq	%rbx, %rdi
	callq	series_pushstr@PLT
	leaq	.Lstr.8(%rip), %rsi
	movq	%rbx, %rdi
	callq	series_pushstr@PLT
	movq	8(%rsp), %rax
	movq	16(%rsp), %rcx
	movq	%rcx, 32(%rsp)
	movq	%rax, 24(%rsp)
	movq	i@GOTPCREL(%rip), %rbx
	movl	$0, (%rbx)
	leaq	24(%rsp), %r15
	leaq	40(%rsp), %r14
	jmp	.LBB0_1
	.p2align	4, 0x90
.LBB0_2:                                # %while_body
                                        #   in Loop: Header=BB0_1 Depth=1
	movl	(%rbx), %esi
	movq	%r15, %rdi
	callq	series_getstr@PLT
	movq	%rax, 80(%rsp)
	movl	$1, %esi
	movq	%rax, %rdi
	callq	cardcall@PLT
	andb	$1, %dl
	movb	%dl, 72(%rsp)
	movq	%rax, 64(%rsp)
	movl	72(%rsp), %edx
	movq	%r14, %rdi
	movq	%rax, %rsi
	callq	series_pushcard@PLT
	incl	(%rbx)
.LBB0_1:                                # %while
                                        # =>This Inner Loop Header: Depth=1
	movl	(%rbx), %ebp
	movq	%r15, %rdi
	callq	series_sizestr@PLT
	cmpl	%eax, %ebp
	jl	.LBB0_2
# %bb.3:                                # %merge
	movq	40(%rsp), %rax
	movq	48(%rsp), %rdx
	addq	$32984, %rsp            # imm = 0x80D8
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end0:
	.size	CREATEDECK, .Lfunc_end0-CREATEDECK
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
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r12
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	subq	$16488, %rsp            # imm = 0x4068
	.cfi_def_cfa_offset 16528
	.cfi_offset %rbx, -40
	.cfi_offset %r12, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movl	$0, 4(%rsp)
	leaq	4(%rsp), %rax
	movq	%rax, 8(%rsp)
	leaq	40(%rsp), %rax
	movq	%rax, 16(%rsp)
	leaq	.Lstr.33(%rip), %rdi
	movl	$1, %esi
	callq	cardcall@PLT
	movzbl	%dl, %edx
	leaq	8(%rsp), %rdi
	movq	%rax, %rsi
	callq	series_pushcard.13@PLT
	movq	8(%rsp), %rdi
	movq	16(%rsp), %rsi
	movq	deck@GOTPCREL(%rip), %r14
	movq	%rdi, (%r14)
	movq	%rsi, 8(%r14)
	callq	CREATEDECK@PLT
	movq	%rdx, 8(%r14)
	movq	%rax, (%r14)
	movq	i@GOTPCREL(%rip), %rbx
	movl	$0, (%rbx)
	movq	str@GOTPCREL(%rip), %r15
	movq	str.3@GOTPCREL(%rip), %r12
	cmpl	$4, (%rbx)
	jg	.LBB25_3
	.p2align	4, 0x90
.LBB25_2:                               # %while_body
                                        # =>This Inner Loop Header: Depth=1
	movl	(%rbx), %esi
	movq	%r14, %rdi
	callq	series_getcard.19@PLT
	andb	$1, %dl
	movb	%dl, 32(%rsp)
	movq	%rax, 24(%rsp)
	movl	32(%rsp), %esi
	movq	%rax, %rdi
	callq	getcardtype@PLT
	movq	%rax, %rcx
	xorl	%eax, %eax
	movq	%r15, %rdi
	movq	%rcx, %rsi
	callq	printf@PLT
	movq	24(%rsp), %rdi
	movl	32(%rsp), %esi
	callq	getcardfaceup@PLT
	movzbl	%al, %esi
	xorl	%eax, %eax
	movq	%r12, %rdi
	callq	printf@PLT
	incl	(%rbx)
	cmpl	$4, (%rbx)
	jle	.LBB25_2
.LBB25_3:                               # %merge
	xorl	%eax, %eax
	addq	$16488, %rsp            # imm = 0x4068
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	retq
.Lfunc_end25:
	.size	main, .Lfunc_end25-main
	.cfi_endproc
                                        # -- End function
	.globl	series_pushbool.9       # -- Begin function series_pushbool.9
	.p2align	4, 0x90
	.type	series_pushbool.9,@function
series_pushbool.9:                      # @series_pushbool.9
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
.Lfunc_end26:
	.size	series_pushbool.9, .Lfunc_end26-series_pushbool.9
	.cfi_endproc
                                        # -- End function
	.globl	series_pushint.10       # -- Begin function series_pushint.10
	.p2align	4, 0x90
	.type	series_pushint.10,@function
series_pushint.10:                      # @series_pushint.10
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
.Lfunc_end27:
	.size	series_pushint.10, .Lfunc_end27-series_pushint.10
	.cfi_endproc
                                        # -- End function
	.globl	series_pushfloat.11     # -- Begin function series_pushfloat.11
	.p2align	4, 0x90
	.type	series_pushfloat.11,@function
series_pushfloat.11:                    # @series_pushfloat.11
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
.Lfunc_end28:
	.size	series_pushfloat.11, .Lfunc_end28-series_pushfloat.11
	.cfi_endproc
                                        # -- End function
	.globl	series_pushstr.12       # -- Begin function series_pushstr.12
	.p2align	4, 0x90
	.type	series_pushstr.12,@function
series_pushstr.12:                      # @series_pushstr.12
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
.Lfunc_end29:
	.size	series_pushstr.12, .Lfunc_end29-series_pushstr.12
	.cfi_endproc
                                        # -- End function
	.globl	series_pushcard.13      # -- Begin function series_pushcard.13
	.p2align	4, 0x90
	.type	series_pushcard.13,@function
series_pushcard.13:                     # @series_pushcard.13
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
.Lfunc_end30:
	.size	series_pushcard.13, .Lfunc_end30-series_pushcard.13
	.cfi_endproc
                                        # -- End function
	.globl	series_pushplayer.14    # -- Begin function series_pushplayer.14
	.p2align	4, 0x90
	.type	series_pushplayer.14,@function
series_pushplayer.14:                   # @series_pushplayer.14
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
.Lfunc_end31:
	.size	series_pushplayer.14, .Lfunc_end31-series_pushplayer.14
	.cfi_endproc
                                        # -- End function
	.globl	series_getbool.15       # -- Begin function series_getbool.15
	.p2align	4, 0x90
	.type	series_getbool.15,@function
series_getbool.15:                      # @series_getbool.15
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movl	%esi, -12(%rsp)
	movq	8(%rdi), %rax
	movslq	-12(%rsp), %rcx
	movb	(%rax,%rcx), %al
	retq
.Lfunc_end32:
	.size	series_getbool.15, .Lfunc_end32-series_getbool.15
	.cfi_endproc
                                        # -- End function
	.globl	series_getint.16        # -- Begin function series_getint.16
	.p2align	4, 0x90
	.type	series_getint.16,@function
series_getint.16:                       # @series_getint.16
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movl	%esi, -12(%rsp)
	movq	8(%rdi), %rax
	movslq	-12(%rsp), %rcx
	movl	(%rax,%rcx,4), %eax
	retq
.Lfunc_end33:
	.size	series_getint.16, .Lfunc_end33-series_getint.16
	.cfi_endproc
                                        # -- End function
	.globl	series_getfloat.17      # -- Begin function series_getfloat.17
	.p2align	4, 0x90
	.type	series_getfloat.17,@function
series_getfloat.17:                     # @series_getfloat.17
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movl	%esi, -12(%rsp)
	movq	8(%rdi), %rax
	movslq	-12(%rsp), %rcx
	movsd	(%rax,%rcx,8), %xmm0    # xmm0 = mem[0],zero
	retq
.Lfunc_end34:
	.size	series_getfloat.17, .Lfunc_end34-series_getfloat.17
	.cfi_endproc
                                        # -- End function
	.globl	series_getstr.18        # -- Begin function series_getstr.18
	.p2align	4, 0x90
	.type	series_getstr.18,@function
series_getstr.18:                       # @series_getstr.18
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movl	%esi, -12(%rsp)
	movq	8(%rdi), %rax
	movslq	-12(%rsp), %rcx
	movq	(%rax,%rcx,8), %rax
	retq
.Lfunc_end35:
	.size	series_getstr.18, .Lfunc_end35-series_getstr.18
	.cfi_endproc
                                        # -- End function
	.globl	series_getcard.19       # -- Begin function series_getcard.19
	.p2align	4, 0x90
	.type	series_getcard.19,@function
series_getcard.19:                      # @series_getcard.19
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
.Lfunc_end36:
	.size	series_getcard.19, .Lfunc_end36-series_getcard.19
	.cfi_endproc
                                        # -- End function
	.globl	series_getplayer.20     # -- Begin function series_getplayer.20
	.p2align	4, 0x90
	.type	series_getplayer.20,@function
series_getplayer.20:                    # @series_getplayer.20
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
.Lfunc_end37:
	.size	series_getplayer.20, .Lfunc_end37-series_getplayer.20
	.cfi_endproc
                                        # -- End function
	.globl	series_sizebool.21      # -- Begin function series_sizebool.21
	.p2align	4, 0x90
	.type	series_sizebool.21,@function
series_sizebool.21:                     # @series_sizebool.21
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movq	(%rdi), %rax
	movl	(%rax), %eax
	retq
.Lfunc_end38:
	.size	series_sizebool.21, .Lfunc_end38-series_sizebool.21
	.cfi_endproc
                                        # -- End function
	.globl	series_sizeint.22       # -- Begin function series_sizeint.22
	.p2align	4, 0x90
	.type	series_sizeint.22,@function
series_sizeint.22:                      # @series_sizeint.22
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movq	(%rdi), %rax
	movl	(%rax), %eax
	retq
.Lfunc_end39:
	.size	series_sizeint.22, .Lfunc_end39-series_sizeint.22
	.cfi_endproc
                                        # -- End function
	.globl	series_sizefloat.23     # -- Begin function series_sizefloat.23
	.p2align	4, 0x90
	.type	series_sizefloat.23,@function
series_sizefloat.23:                    # @series_sizefloat.23
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movq	(%rdi), %rax
	movl	(%rax), %eax
	retq
.Lfunc_end40:
	.size	series_sizefloat.23, .Lfunc_end40-series_sizefloat.23
	.cfi_endproc
                                        # -- End function
	.globl	series_sizestr.24       # -- Begin function series_sizestr.24
	.p2align	4, 0x90
	.type	series_sizestr.24,@function
series_sizestr.24:                      # @series_sizestr.24
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movq	(%rdi), %rax
	movl	(%rax), %eax
	retq
.Lfunc_end41:
	.size	series_sizestr.24, .Lfunc_end41-series_sizestr.24
	.cfi_endproc
                                        # -- End function
	.globl	series_sizecard.25      # -- Begin function series_sizecard.25
	.p2align	4, 0x90
	.type	series_sizecard.25,@function
series_sizecard.25:                     # @series_sizecard.25
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movq	(%rdi), %rax
	movl	(%rax), %eax
	retq
.Lfunc_end42:
	.size	series_sizecard.25, .Lfunc_end42-series_sizecard.25
	.cfi_endproc
                                        # -- End function
	.globl	series_sizeplayer.26    # -- Begin function series_sizeplayer.26
	.p2align	4, 0x90
	.type	series_sizeplayer.26,@function
series_sizeplayer.26:                   # @series_sizeplayer.26
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movq	(%rdi), %rax
	movl	(%rax), %eax
	retq
.Lfunc_end43:
	.size	series_sizeplayer.26, .Lfunc_end43-series_sizeplayer.26
	.cfi_endproc
                                        # -- End function
	.globl	series_popbool.27       # -- Begin function series_popbool.27
	.p2align	4, 0x90
	.type	series_popbool.27,@function
series_popbool.27:                      # @series_popbool.27
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
.Lfunc_end44:
	.size	series_popbool.27, .Lfunc_end44-series_popbool.27
	.cfi_endproc
                                        # -- End function
	.globl	series_popint.28        # -- Begin function series_popint.28
	.p2align	4, 0x90
	.type	series_popint.28,@function
series_popint.28:                       # @series_popint.28
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
.Lfunc_end45:
	.size	series_popint.28, .Lfunc_end45-series_popint.28
	.cfi_endproc
                                        # -- End function
	.globl	series_popfloat.29      # -- Begin function series_popfloat.29
	.p2align	4, 0x90
	.type	series_popfloat.29,@function
series_popfloat.29:                     # @series_popfloat.29
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
.Lfunc_end46:
	.size	series_popfloat.29, .Lfunc_end46-series_popfloat.29
	.cfi_endproc
                                        # -- End function
	.globl	series_popstr.30        # -- Begin function series_popstr.30
	.p2align	4, 0x90
	.type	series_popstr.30,@function
series_popstr.30:                       # @series_popstr.30
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
.Lfunc_end47:
	.size	series_popstr.30, .Lfunc_end47-series_popstr.30
	.cfi_endproc
                                        # -- End function
	.globl	series_popcard.31       # -- Begin function series_popcard.31
	.p2align	4, 0x90
	.type	series_popcard.31,@function
series_popcard.31:                      # @series_popcard.31
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
.Lfunc_end48:
	.size	series_popcard.31, .Lfunc_end48-series_popcard.31
	.cfi_endproc
                                        # -- End function
	.globl	series_popplayer.32     # -- Begin function series_popplayer.32
	.p2align	4, 0x90
	.type	series_popplayer.32,@function
series_popplayer.32:                    # @series_popplayer.32
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
.Lfunc_end49:
	.size	series_popplayer.32, .Lfunc_end49-series_popplayer.32
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

	.type	i,@object               # @i
	.bss
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

	.type	.Lstr.4,@object         # @str.4
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstr.4:
	.asciz	"R0"
	.size	.Lstr.4, 3

	.type	.Lstr.5,@object         # @str.5
.Lstr.5:
	.asciz	"R1"
	.size	.Lstr.5, 3

	.type	.Lstr.6,@object         # @str.6
.Lstr.6:
	.asciz	"R2"
	.size	.Lstr.6, 3

	.type	.Lstr.7,@object         # @str.7
.Lstr.7:
	.asciz	"R3"
	.size	.Lstr.7, 3

	.type	.Lstr.8,@object         # @str.8
.Lstr.8:
	.asciz	"R4"
	.size	.Lstr.8, 3

	.type	.Lstr.33,@object        # @str.33
.Lstr.33:
	.asciz	"D0"
	.size	.Lstr.33, 3


	.section	".note.GNU-stack","",@progbits
