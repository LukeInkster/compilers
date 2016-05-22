
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 32(%rbp), %rax
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label592
label590:
	movq 24(%rbp), %rbx
	movq $0, %rcx
	cmpq %rbx, %rcx
	jnz label596
label594:
	jmp label593
	jmp label595
label596:
	movq $1, %rcx
	cmpq %rbx, %rcx
	jnz label598
label595:
	leaq str0(%rip), %rcx
	movq %rcx, 16(%rbp)
	jmp label588
	jmp label597
label598:
	movq $2, %rcx
	cmpq %rbx, %rcx
	jnz label600
label597:
	leaq str1(%rip), %rcx
	movq %rcx, 16(%rbp)
	jmp label588
label600:
label593:
	leaq str2(%rip), %rbx
	movq %rbx, 16(%rbp)
	jmp label588
	jmp label591
label592:
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label603
label591:
	leaq str3(%rip), %rbx
	movq %rbx, 16(%rbp)
	jmp label588
	jmp label602
label603:
	movq $2, %rbx
	cmpq %rax, %rbx
	jnz label605
label602:
	leaq str4(%rip), %rbx
	movq %rbx, 16(%rbp)
	jmp label588
label605:
label589:
	leaq str5(%rip), %rax
	movq %rax, 16(%rbp)
	jmp label588
label588:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
	movq $0, %rax
	movq %rax, -8(%rbp)
	movq $1, %rax
	movq %rax, -16(%rbp)
	movq $2, %rax
	movq %rax, -24(%rbp)
	leaq str2(%rip), %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $32, %rsp
	movq -8(%rbp), %rbx
	movq %rbx, 8(%rsp)
	movq -8(%rbp), %rbx
	movq %rbx, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -48(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label608
	movq $1, %rax
	jmp label609
label608:
	movq $0, %rax
label609:
	movq %rax, %rdi
	call assertion
	leaq str0(%rip), %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $32, %rsp
	movq -16(%rbp), %rbx
	movq %rbx, 8(%rsp)
	movq -8(%rbp), %rbx
	movq %rbx, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -48(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label610
	movq $1, %rax
	jmp label611
label610:
	movq $0, %rax
label611:
	movq %rax, %rdi
	call assertion
	leaq str1(%rip), %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $32, %rsp
	movq -24(%rbp), %rbx
	movq %rbx, 8(%rsp)
	movq -8(%rbp), %rbx
	movq %rbx, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -48(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label612
	movq $1, %rax
	jmp label613
label612:
	movq $0, %rax
label613:
	movq %rax, %rdi
	call assertion
	leaq str3(%rip), %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $32, %rsp
	movq -8(%rbp), %rbx
	movq %rbx, 8(%rsp)
	movq -16(%rbp), %rbx
	movq %rbx, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -48(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label614
	movq $1, %rax
	jmp label615
label614:
	movq $0, %rax
label615:
	movq %rax, %rdi
	call assertion
	leaq str4(%rip), %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $32, %rsp
	movq -8(%rbp), %rbx
	movq %rbx, 8(%rsp)
	movq -24(%rbp), %rbx
	movq %rbx, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -48(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label616
	movq $1, %rax
	jmp label617
label616:
	movq $0, %rax
label617:
	movq %rax, %rdi
	call assertion
label607:
	movq %rbp, %rsp
	popq %rbp
	ret
	.globl main
main:
	pushq %rbp
	call wl_main
	popq %rbp
	movq $0, %rax
	ret

	.data
str0:
	.asciz "RED BLUE"
str1:
	.asciz "RED GREEN"
str2:
	.asciz "RED RED"
str3:
	.asciz "BLUE ???"
str4:
	.asciz "GREEN ???"
str5:
	.asciz ""
