
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 32(%rbp), %rax
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label590
label588:
	movq 24(%rbp), %rbx
	movq $0, %rcx
	cmpq %rbx, %rcx
	jnz label594
label592:
	leaq str0(%rip), %rcx
	movq %rcx, 16(%rbp)
	jmp label586
	jmp label593
label594:
	movq $1, %rcx
	cmpq %rbx, %rcx
	jnz label596
label593:
	leaq str1(%rip), %rcx
	movq %rcx, 16(%rbp)
	jmp label586
	jmp label595
label596:
	movq $2, %rcx
	cmpq %rbx, %rcx
	jnz label598
label595:
	leaq str2(%rip), %rcx
	movq %rcx, 16(%rbp)
	jmp label586
label598:
label591:
	jmp label589
label590:
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label601
label589:
	leaq str3(%rip), %rbx
	movq %rbx, 16(%rbp)
	jmp label586
	jmp label600
label601:
	movq $2, %rbx
	cmpq %rax, %rbx
	jnz label603
label600:
	leaq str4(%rip), %rbx
	movq %rbx, 16(%rbp)
	jmp label586
label603:
label587:
	leaq str5(%rip), %rax
	movq %rax, 16(%rbp)
	jmp label586
label586:
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
	leaq str0(%rip), %rax
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
	jnz label606
	movq $1, %rax
	jmp label607
label606:
	movq $0, %rax
label607:
	movq %rax, %rdi
	call assertion
	leaq str1(%rip), %rax
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
	jnz label608
	movq $1, %rax
	jmp label609
label608:
	movq $0, %rax
label609:
	movq %rax, %rdi
	call assertion
	leaq str2(%rip), %rax
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
	jnz label610
	movq $1, %rax
	jmp label611
label610:
	movq $0, %rax
label611:
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
	jnz label612
	movq $1, %rax
	jmp label613
label612:
	movq $0, %rax
label613:
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
	jnz label614
	movq $1, %rax
	jmp label615
label614:
	movq $0, %rax
label615:
	movq %rax, %rdi
	call assertion
label605:
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
	.asciz "RED RED"
str1:
	.asciz "RED BLUE"
str2:
	.asciz "RED GREEN"
str3:
	.asciz "BLUE ???"
str4:
	.asciz "GREEN ???"
str5:
	.asciz ""
