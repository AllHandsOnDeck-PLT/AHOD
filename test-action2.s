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
	leaq	.Lstr.29(%rip), %rsi
	xorl	%eax, %eax
	callq	printf@PLT
	popq	%rax
	retq
.Lfunc_end1:
	.size	PLAYTWO, .Lfunc_end1-PLAYTWO
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
.Lfunc_end2:
	.size	series_pushbool, .Lfunc_end2-series_pushbool
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
.Lfunc_end3:
	.size	series_pushint, .Lfunc_end3-series_pushint
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
.Lfunc_end4:
	.size	series_pushfloat, .Lfunc_end4-series_pushfloat
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
.Lfunc_end5:
	.size	series_pushstr, .Lfunc_end5-series_pushstr
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
.Lfunc_end6:
	.size	series_pushcard, .Lfunc_end6-series_pushcard
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
.Lfunc_end7:
	.size	series_pushplayer, .Lfunc_end7-series_pushplayer
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
.Lfunc_end8:
	.size	series_getbool, .Lfunc_end8-series_getbool
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
.Lfunc_end9:
	.size	series_getint, .Lfunc_end9-series_getint
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
.Lfunc_end10:
	.size	series_getfloat, .Lfunc_end10-series_getfloat
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
.Lfunc_end11:
	.size	series_getstr, .Lfunc_end11-series_getstr
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
.Lfunc_end12:
	.size	series_getcard, .Lfunc_end12-series_getcard
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
.Lfunc_end13:
	.size	series_getplayer, .Lfunc_end13-series_getplayer
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
.Lfunc_end14:
	.size	series_sizebool, .Lfunc_end14-series_sizebool
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
.Lfunc_end15:
	.size	series_sizeint, .Lfunc_end15-series_sizeint
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
.Lfunc_end16:
	.size	series_sizefloat, .Lfunc_end16-series_sizefloat
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
.Lfunc_end17:
	.size	series_sizestr, .Lfunc_end17-series_sizestr
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
.Lfunc_end18:
	.size	series_sizecard, .Lfunc_end18-series_sizecard
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
.Lfunc_end19:
	.size	series_sizeplayer, .Lfunc_end19-series_sizeplayer
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
.Lfunc_end20:
	.size	series_popbool, .Lfunc_end20-series_popbool
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
.Lfunc_end21:
	.size	series_popint, .Lfunc_end21-series_popint
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
.Lfunc_end22:
	.size	series_popfloat, .Lfunc_end22-series_popfloat
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
.Lfunc_end23:
	.size	series_popstr, .Lfunc_end23-series_popstr
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
.Lfunc_end24:
	.size	series_popcard, .Lfunc_end24-series_popcard
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
.Lfunc_end25:
	.size	series_popplayer, .Lfunc_end25-series_popplayer
	.cfi_endproc
                                        # -- End function
	.globl	series_pushbool.5       # -- Begin function series_pushbool.5
	.p2align	4, 0x90
	.type	series_pushbool.5,@function
series_pushbool.5:                      # @series_pushbool.5
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
	.size	series_pushbool.5, .Lfunc_end26-series_pushbool.5
	.cfi_endproc
                                        # -- End function
	.globl	series_pushint.6        # -- Begin function series_pushint.6
	.p2align	4, 0x90
	.type	series_pushint.6,@function
series_pushint.6:                       # @series_pushint.6
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
	.size	series_pushint.6, .Lfunc_end27-series_pushint.6
	.cfi_endproc
                                        # -- End function
	.globl	series_pushfloat.7      # -- Begin function series_pushfloat.7
	.p2align	4, 0x90
	.type	series_pushfloat.7,@function
series_pushfloat.7:                     # @series_pushfloat.7
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
	.size	series_pushfloat.7, .Lfunc_end28-series_pushfloat.7
	.cfi_endproc
                                        # -- End function
	.globl	series_pushstr.8        # -- Begin function series_pushstr.8
	.p2align	4, 0x90
	.type	series_pushstr.8,@function
series_pushstr.8:                       # @series_pushstr.8
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
	.size	series_pushstr.8, .Lfunc_end29-series_pushstr.8
	.cfi_endproc
                                        # -- End function
	.globl	series_pushcard.9       # -- Begin function series_pushcard.9
	.p2align	4, 0x90
	.type	series_pushcard.9,@function
series_pushcard.9:                      # @series_pushcard.9
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
	.size	series_pushcard.9, .Lfunc_end30-series_pushcard.9
	.cfi_endproc
                                        # -- End function
	.globl	series_pushplayer.10    # -- Begin function series_pushplayer.10
	.p2align	4, 0x90
	.type	series_pushplayer.10,@function
series_pushplayer.10:                   # @series_pushplayer.10
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
	.size	series_pushplayer.10, .Lfunc_end31-series_pushplayer.10
	.cfi_endproc
                                        # -- End function
	.globl	series_getbool.11       # -- Begin function series_getbool.11
	.p2align	4, 0x90
	.type	series_getbool.11,@function
series_getbool.11:                      # @series_getbool.11
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movl	%esi, -12(%rsp)
	movq	8(%rdi), %rax
	movslq	-12(%rsp), %rcx
	movb	(%rax,%rcx), %al
	retq
.Lfunc_end32:
	.size	series_getbool.11, .Lfunc_end32-series_getbool.11
	.cfi_endproc
                                        # -- End function
	.globl	series_getint.12        # -- Begin function series_getint.12
	.p2align	4, 0x90
	.type	series_getint.12,@function
series_getint.12:                       # @series_getint.12
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movl	%esi, -12(%rsp)
	movq	8(%rdi), %rax
	movslq	-12(%rsp), %rcx
	movl	(%rax,%rcx,4), %eax
	retq
.Lfunc_end33:
	.size	series_getint.12, .Lfunc_end33-series_getint.12
	.cfi_endproc
                                        # -- End function
	.globl	series_getfloat.13      # -- Begin function series_getfloat.13
	.p2align	4, 0x90
	.type	series_getfloat.13,@function
series_getfloat.13:                     # @series_getfloat.13
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movl	%esi, -12(%rsp)
	movq	8(%rdi), %rax
	movslq	-12(%rsp), %rcx
	movsd	(%rax,%rcx,8), %xmm0    # xmm0 = mem[0],zero
	retq
.Lfunc_end34:
	.size	series_getfloat.13, .Lfunc_end34-series_getfloat.13
	.cfi_endproc
                                        # -- End function
	.globl	series_getstr.14        # -- Begin function series_getstr.14
	.p2align	4, 0x90
	.type	series_getstr.14,@function
series_getstr.14:                       # @series_getstr.14
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movl	%esi, -12(%rsp)
	movq	8(%rdi), %rax
	movslq	-12(%rsp), %rcx
	movq	(%rax,%rcx,8), %rax
	retq
.Lfunc_end35:
	.size	series_getstr.14, .Lfunc_end35-series_getstr.14
	.cfi_endproc
                                        # -- End function
	.globl	series_getcard.15       # -- Begin function series_getcard.15
	.p2align	4, 0x90
	.type	series_getcard.15,@function
series_getcard.15:                      # @series_getcard.15
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
	.size	series_getcard.15, .Lfunc_end36-series_getcard.15
	.cfi_endproc
                                        # -- End function
	.globl	series_getplayer.16     # -- Begin function series_getplayer.16
	.p2align	4, 0x90
	.type	series_getplayer.16,@function
series_getplayer.16:                    # @series_getplayer.16
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
	.size	series_getplayer.16, .Lfunc_end37-series_getplayer.16
	.cfi_endproc
                                        # -- End function
	.globl	series_sizebool.17      # -- Begin function series_sizebool.17
	.p2align	4, 0x90
	.type	series_sizebool.17,@function
series_sizebool.17:                     # @series_sizebool.17
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movq	(%rdi), %rax
	movl	(%rax), %eax
	retq
.Lfunc_end38:
	.size	series_sizebool.17, .Lfunc_end38-series_sizebool.17
	.cfi_endproc
                                        # -- End function
	.globl	series_sizeint.18       # -- Begin function series_sizeint.18
	.p2align	4, 0x90
	.type	series_sizeint.18,@function
series_sizeint.18:                      # @series_sizeint.18
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movq	(%rdi), %rax
	movl	(%rax), %eax
	retq
.Lfunc_end39:
	.size	series_sizeint.18, .Lfunc_end39-series_sizeint.18
	.cfi_endproc
                                        # -- End function
	.globl	series_sizefloat.19     # -- Begin function series_sizefloat.19
	.p2align	4, 0x90
	.type	series_sizefloat.19,@function
series_sizefloat.19:                    # @series_sizefloat.19
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movq	(%rdi), %rax
	movl	(%rax), %eax
	retq
.Lfunc_end40:
	.size	series_sizefloat.19, .Lfunc_end40-series_sizefloat.19
	.cfi_endproc
                                        # -- End function
	.globl	series_sizestr.20       # -- Begin function series_sizestr.20
	.p2align	4, 0x90
	.type	series_sizestr.20,@function
series_sizestr.20:                      # @series_sizestr.20
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movq	(%rdi), %rax
	movl	(%rax), %eax
	retq
.Lfunc_end41:
	.size	series_sizestr.20, .Lfunc_end41-series_sizestr.20
	.cfi_endproc
                                        # -- End function
	.globl	series_sizecard.21      # -- Begin function series_sizecard.21
	.p2align	4, 0x90
	.type	series_sizecard.21,@function
series_sizecard.21:                     # @series_sizecard.21
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movq	(%rdi), %rax
	movl	(%rax), %eax
	retq
.Lfunc_end42:
	.size	series_sizecard.21, .Lfunc_end42-series_sizecard.21
	.cfi_endproc
                                        # -- End function
	.globl	series_sizeplayer.22    # -- Begin function series_sizeplayer.22
	.p2align	4, 0x90
	.type	series_sizeplayer.22,@function
series_sizeplayer.22:                   # @series_sizeplayer.22
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movq	(%rdi), %rax
	movl	(%rax), %eax
	retq
.Lfunc_end43:
	.size	series_sizeplayer.22, .Lfunc_end43-series_sizeplayer.22
	.cfi_endproc
                                        # -- End function
	.globl	series_popbool.23       # -- Begin function series_popbool.23
	.p2align	4, 0x90
	.type	series_popbool.23,@function
series_popbool.23:                      # @series_popbool.23
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
	.size	series_popbool.23, .Lfunc_end44-series_popbool.23
	.cfi_endproc
                                        # -- End function
	.globl	series_popint.24        # -- Begin function series_popint.24
	.p2align	4, 0x90
	.type	series_popint.24,@function
series_popint.24:                       # @series_popint.24
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
	.size	series_popint.24, .Lfunc_end45-series_popint.24
	.cfi_endproc
                                        # -- End function
	.globl	series_popfloat.25      # -- Begin function series_popfloat.25
	.p2align	4, 0x90
	.type	series_popfloat.25,@function
series_popfloat.25:                     # @series_popfloat.25
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
	.size	series_popfloat.25, .Lfunc_end46-series_popfloat.25
	.cfi_endproc
                                        # -- End function
	.globl	series_popstr.26        # -- Begin function series_popstr.26
	.p2align	4, 0x90
	.type	series_popstr.26,@function
series_popstr.26:                       # @series_popstr.26
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
	.size	series_popstr.26, .Lfunc_end47-series_popstr.26
	.cfi_endproc
                                        # -- End function
	.globl	series_popcard.27       # -- Begin function series_popcard.27
	.p2align	4, 0x90
	.type	series_popcard.27,@function
series_popcard.27:                      # @series_popcard.27
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
	.size	series_popcard.27, .Lfunc_end48-series_popcard.27
	.cfi_endproc
                                        # -- End function
	.globl	series_popplayer.28     # -- Begin function series_popplayer.28
	.p2align	4, 0x90
	.type	series_popplayer.28,@function
series_popplayer.28:                    # @series_popplayer.28
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
	.size	series_popplayer.28, .Lfunc_end49-series_popplayer.28
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
.Lfunc_end50:
	.size	main, .Lfunc_end50-main
	.cfi_endproc
                                        # -- End function
	.globl	series_pushbool.30      # -- Begin function series_pushbool.30
	.p2align	4, 0x90
	.type	series_pushbool.30,@function
series_pushbool.30:                     # @series_pushbool.30
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
	.size	series_pushbool.30, .Lfunc_end51-series_pushbool.30
	.cfi_endproc
                                        # -- End function
	.globl	series_pushint.31       # -- Begin function series_pushint.31
	.p2align	4, 0x90
	.type	series_pushint.31,@function
series_pushint.31:                      # @series_pushint.31
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
	.size	series_pushint.31, .Lfunc_end52-series_pushint.31
	.cfi_endproc
                                        # -- End function
	.globl	series_pushfloat.32     # -- Begin function series_pushfloat.32
	.p2align	4, 0x90
	.type	series_pushfloat.32,@function
series_pushfloat.32:                    # @series_pushfloat.32
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
	.size	series_pushfloat.32, .Lfunc_end53-series_pushfloat.32
	.cfi_endproc
                                        # -- End function
	.globl	series_pushstr.33       # -- Begin function series_pushstr.33
	.p2align	4, 0x90
	.type	series_pushstr.33,@function
series_pushstr.33:                      # @series_pushstr.33
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
	.size	series_pushstr.33, .Lfunc_end54-series_pushstr.33
	.cfi_endproc
                                        # -- End function
	.globl	series_pushcard.34      # -- Begin function series_pushcard.34
	.p2align	4, 0x90
	.type	series_pushcard.34,@function
series_pushcard.34:                     # @series_pushcard.34
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
.Lfunc_end55:
	.size	series_pushcard.34, .Lfunc_end55-series_pushcard.34
	.cfi_endproc
                                        # -- End function
	.globl	series_pushplayer.35    # -- Begin function series_pushplayer.35
	.p2align	4, 0x90
	.type	series_pushplayer.35,@function
series_pushplayer.35:                   # @series_pushplayer.35
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
	.size	series_pushplayer.35, .Lfunc_end56-series_pushplayer.35
	.cfi_endproc
                                        # -- End function
	.globl	series_getbool.36       # -- Begin function series_getbool.36
	.p2align	4, 0x90
	.type	series_getbool.36,@function
series_getbool.36:                      # @series_getbool.36
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movl	%esi, -12(%rsp)
	movq	8(%rdi), %rax
	movslq	-12(%rsp), %rcx
	movb	(%rax,%rcx), %al
	retq
.Lfunc_end57:
	.size	series_getbool.36, .Lfunc_end57-series_getbool.36
	.cfi_endproc
                                        # -- End function
	.globl	series_getint.37        # -- Begin function series_getint.37
	.p2align	4, 0x90
	.type	series_getint.37,@function
series_getint.37:                       # @series_getint.37
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movl	%esi, -12(%rsp)
	movq	8(%rdi), %rax
	movslq	-12(%rsp), %rcx
	movl	(%rax,%rcx,4), %eax
	retq
.Lfunc_end58:
	.size	series_getint.37, .Lfunc_end58-series_getint.37
	.cfi_endproc
                                        # -- End function
	.globl	series_getfloat.38      # -- Begin function series_getfloat.38
	.p2align	4, 0x90
	.type	series_getfloat.38,@function
series_getfloat.38:                     # @series_getfloat.38
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movl	%esi, -12(%rsp)
	movq	8(%rdi), %rax
	movslq	-12(%rsp), %rcx
	movsd	(%rax,%rcx,8), %xmm0    # xmm0 = mem[0],zero
	retq
.Lfunc_end59:
	.size	series_getfloat.38, .Lfunc_end59-series_getfloat.38
	.cfi_endproc
                                        # -- End function
	.globl	series_getstr.39        # -- Begin function series_getstr.39
	.p2align	4, 0x90
	.type	series_getstr.39,@function
series_getstr.39:                       # @series_getstr.39
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movl	%esi, -12(%rsp)
	movq	8(%rdi), %rax
	movslq	-12(%rsp), %rcx
	movq	(%rax,%rcx,8), %rax
	retq
.Lfunc_end60:
	.size	series_getstr.39, .Lfunc_end60-series_getstr.39
	.cfi_endproc
                                        # -- End function
	.globl	series_getcard.40       # -- Begin function series_getcard.40
	.p2align	4, 0x90
	.type	series_getcard.40,@function
series_getcard.40:                      # @series_getcard.40
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
.Lfunc_end61:
	.size	series_getcard.40, .Lfunc_end61-series_getcard.40
	.cfi_endproc
                                        # -- End function
	.globl	series_getplayer.41     # -- Begin function series_getplayer.41
	.p2align	4, 0x90
	.type	series_getplayer.41,@function
series_getplayer.41:                    # @series_getplayer.41
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
	.size	series_getplayer.41, .Lfunc_end62-series_getplayer.41
	.cfi_endproc
                                        # -- End function
	.globl	series_sizebool.42      # -- Begin function series_sizebool.42
	.p2align	4, 0x90
	.type	series_sizebool.42,@function
series_sizebool.42:                     # @series_sizebool.42
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movq	(%rdi), %rax
	movl	(%rax), %eax
	retq
.Lfunc_end63:
	.size	series_sizebool.42, .Lfunc_end63-series_sizebool.42
	.cfi_endproc
                                        # -- End function
	.globl	series_sizeint.43       # -- Begin function series_sizeint.43
	.p2align	4, 0x90
	.type	series_sizeint.43,@function
series_sizeint.43:                      # @series_sizeint.43
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movq	(%rdi), %rax
	movl	(%rax), %eax
	retq
.Lfunc_end64:
	.size	series_sizeint.43, .Lfunc_end64-series_sizeint.43
	.cfi_endproc
                                        # -- End function
	.globl	series_sizefloat.44     # -- Begin function series_sizefloat.44
	.p2align	4, 0x90
	.type	series_sizefloat.44,@function
series_sizefloat.44:                    # @series_sizefloat.44
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movq	(%rdi), %rax
	movl	(%rax), %eax
	retq
.Lfunc_end65:
	.size	series_sizefloat.44, .Lfunc_end65-series_sizefloat.44
	.cfi_endproc
                                        # -- End function
	.globl	series_sizestr.45       # -- Begin function series_sizestr.45
	.p2align	4, 0x90
	.type	series_sizestr.45,@function
series_sizestr.45:                      # @series_sizestr.45
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movq	(%rdi), %rax
	movl	(%rax), %eax
	retq
.Lfunc_end66:
	.size	series_sizestr.45, .Lfunc_end66-series_sizestr.45
	.cfi_endproc
                                        # -- End function
	.globl	series_sizecard.46      # -- Begin function series_sizecard.46
	.p2align	4, 0x90
	.type	series_sizecard.46,@function
series_sizecard.46:                     # @series_sizecard.46
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movq	(%rdi), %rax
	movl	(%rax), %eax
	retq
.Lfunc_end67:
	.size	series_sizecard.46, .Lfunc_end67-series_sizecard.46
	.cfi_endproc
                                        # -- End function
	.globl	series_sizeplayer.47    # -- Begin function series_sizeplayer.47
	.p2align	4, 0x90
	.type	series_sizeplayer.47,@function
series_sizeplayer.47:                   # @series_sizeplayer.47
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movq	(%rdi), %rax
	movl	(%rax), %eax
	retq
.Lfunc_end68:
	.size	series_sizeplayer.47, .Lfunc_end68-series_sizeplayer.47
	.cfi_endproc
                                        # -- End function
	.globl	series_popbool.48       # -- Begin function series_popbool.48
	.p2align	4, 0x90
	.type	series_popbool.48,@function
series_popbool.48:                      # @series_popbool.48
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
	.size	series_popbool.48, .Lfunc_end69-series_popbool.48
	.cfi_endproc
                                        # -- End function
	.globl	series_popint.49        # -- Begin function series_popint.49
	.p2align	4, 0x90
	.type	series_popint.49,@function
series_popint.49:                       # @series_popint.49
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
	.size	series_popint.49, .Lfunc_end70-series_popint.49
	.cfi_endproc
                                        # -- End function
	.globl	series_popfloat.50      # -- Begin function series_popfloat.50
	.p2align	4, 0x90
	.type	series_popfloat.50,@function
series_popfloat.50:                     # @series_popfloat.50
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
	.size	series_popfloat.50, .Lfunc_end71-series_popfloat.50
	.cfi_endproc
                                        # -- End function
	.globl	series_popstr.51        # -- Begin function series_popstr.51
	.p2align	4, 0x90
	.type	series_popstr.51,@function
series_popstr.51:                       # @series_popstr.51
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
	.size	series_popstr.51, .Lfunc_end72-series_popstr.51
	.cfi_endproc
                                        # -- End function
	.globl	series_popcard.52       # -- Begin function series_popcard.52
	.p2align	4, 0x90
	.type	series_popcard.52,@function
series_popcard.52:                      # @series_popcard.52
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
.Lfunc_end73:
	.size	series_popcard.52, .Lfunc_end73-series_popcard.52
	.cfi_endproc
                                        # -- End function
	.globl	series_popplayer.53     # -- Begin function series_popplayer.53
	.p2align	4, 0x90
	.type	series_popplayer.53,@function
series_popplayer.53:                    # @series_popplayer.53
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
	.size	series_popplayer.53, .Lfunc_end74-series_popplayer.53
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

	.type	.Lstr.29,@object        # @str.29
	.p2align	4
.Lstr.29:
	.asciz	"two actions are cooler"
	.size	.Lstr.29, 23


	.section	".note.GNU-stack","",@progbits
