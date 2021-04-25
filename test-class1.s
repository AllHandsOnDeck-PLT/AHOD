	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 11, 0
	.globl	_main                           ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:                               ## %entry
	pushq	%rax
	.cfi_def_cfa_offset 16
	leaq	L_str.4(%rip), %rdi
	xorl	%esi, %esi
	callq	_playercall
	movq	%rax, _player(%rip)
	movl	%edx, _player+8(%rip)
	xorl	%eax, %eax
	popq	%rcx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_series_addbool                 ## -- Begin function series_addbool
	.p2align	4, 0x90
_series_addbool:                        ## @series_addbool
	.cfi_startproc
## %bb.0:                               ## %entry
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
	.cfi_endproc
                                        ## -- End function
	.globl	_series_addint                  ## -- Begin function series_addint
	.p2align	4, 0x90
_series_addint:                         ## @series_addint
	.cfi_startproc
## %bb.0:                               ## %entry
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
	.cfi_endproc
                                        ## -- End function
	.globl	_series_addfloat                ## -- Begin function series_addfloat
	.p2align	4, 0x90
_series_addfloat:                       ## @series_addfloat
	.cfi_startproc
## %bb.0:                               ## %entry
	movq	%rdi, -8(%rsp)
	movsd	%xmm0, -16(%rsp)
	movq	(%rdi), %rax
	movq	8(%rdi), %rcx
	movslq	(%rax), %rdx
	leal	1(%rdx), %esi
	movl	%esi, (%rax)
	movsd	-16(%rsp), %xmm0                ## xmm0 = mem[0],zero
	movsd	%xmm0, (%rcx,%rdx,8)
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_series_addstr                  ## -- Begin function series_addstr
	.p2align	4, 0x90
_series_addstr:                         ## @series_addstr
	.cfi_startproc
## %bb.0:                               ## %entry
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
	.cfi_endproc
                                        ## -- End function
	.globl	_series_getbool                 ## -- Begin function series_getbool
	.p2align	4, 0x90
_series_getbool:                        ## @series_getbool
	.cfi_startproc
## %bb.0:                               ## %entry
	movq	%rdi, -8(%rsp)
	movl	%esi, -12(%rsp)
	movq	8(%rdi), %rax
	movslq	%esi, %rcx
	movb	(%rax,%rcx), %al
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_series_getint                  ## -- Begin function series_getint
	.p2align	4, 0x90
_series_getint:                         ## @series_getint
	.cfi_startproc
## %bb.0:                               ## %entry
	movq	%rdi, -8(%rsp)
	movl	%esi, -12(%rsp)
	movq	8(%rdi), %rax
	movslq	%esi, %rcx
	movl	(%rax,%rcx,4), %eax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_series_getfloat                ## -- Begin function series_getfloat
	.p2align	4, 0x90
_series_getfloat:                       ## @series_getfloat
	.cfi_startproc
## %bb.0:                               ## %entry
	movq	%rdi, -8(%rsp)
	movl	%esi, -12(%rsp)
	movq	8(%rdi), %rax
	movslq	%esi, %rcx
	movsd	(%rax,%rcx,8), %xmm0            ## xmm0 = mem[0],zero
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_series_getstr                  ## -- Begin function series_getstr
	.p2align	4, 0x90
_series_getstr:                         ## @series_getstr
	.cfi_startproc
## %bb.0:                               ## %entry
	movq	%rdi, -8(%rsp)
	movl	%esi, -12(%rsp)
	movq	8(%rdi), %rax
	movslq	%esi, %rcx
	movq	(%rax,%rcx,8), %rax
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__DATA,__data
	.globl	_str                            ## @str
_str:
	.asciz	"%s\n"

	.globl	_str.1                          ## @str.1
_str.1:
	.asciz	"%d\n"

	.globl	_str.2                          ## @str.2
_str.2:
	.asciz	"%g\n"

	.globl	_str.3                          ## @str.3
_str.3:
	.asciz	"%d\n"

	.globl	_player                         ## @player
.zerofill __DATA,__common,_player,16,3
	.section	__TEXT,__cstring,cstring_literals
L_str.4:                                ## @str.4
	.asciz	"bob"

.subsections_via_symbols
