	.text
	.file	"AHOD"
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
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	leaq	.Lstr.4(%rip), %rdi
	xorl	%esi, %esi
	callq	playercall@PLT
	movq	player@GOTPCREL(%rip), %rbx
	movq	%rax, (%rbx)
	movl	%edx, 8(%rbx)
	movq	%rax, %rdi
	movl	%edx, %esi
	callq	getplayername@PLT
	movq	%rax, %rcx
	movq	str@GOTPCREL(%rip), %r14
	xorl	%eax, %eax
	movq	%r14, %rdi
	movq	%rcx, %rsi
	callq	printf@PLT
	movq	(%rbx), %rdi
	movl	8(%rbx), %esi
	callq	getplayerscore@PLT
	movl	%eax, %ecx
	movq	str.1@GOTPCREL(%rip), %r15
	xorl	%eax, %eax
	movq	%r15, %rdi
	movl	%ecx, %esi
	callq	printf@PLT
	movq	(%rbx), %rdi
	movl	8(%rbx), %esi
	leaq	.Lstr.5(%rip), %rdx
	callq	setplayername@PLT
	movq	(%rbx), %rdi
	movl	8(%rbx), %esi
	movl	$1, %edx
	callq	setplayerscore@PLT
	movq	(%rbx), %rdi
	movl	8(%rbx), %esi
	callq	getplayername@PLT
	movq	%rax, %rcx
	xorl	%eax, %eax
	movq	%r14, %rdi
	movq	%rcx, %rsi
	callq	printf@PLT
	movq	(%rbx), %rdi
	movl	8(%rbx), %esi
	callq	getplayerscore@PLT
	movl	%eax, %ecx
	xorl	%eax, %eax
	movq	%r15, %rdi
	movl	%ecx, %esi
	callq	printf@PLT
	xorl	%eax, %eax
	popq	%rbx
	popq	%r14
	popq	%r15
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

	.type	player,@object          # @player
	.bss
	.globl	player
	.p2align	3
player:
	.zero	16
	.size	player, 16

	.type	.Lstr.4,@object         # @str.4
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstr.4:
	.asciz	"bob"
	.size	.Lstr.4, 4

	.type	.Lstr.5,@object         # @str.5
.Lstr.5:
	.asciz	"kevin"
	.size	.Lstr.5, 6


	.section	".note.GNU-stack","",@progbits
