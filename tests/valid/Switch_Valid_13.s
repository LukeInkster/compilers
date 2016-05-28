
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 32(%rbp), %rax
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label587
label585:
	movq 24(%rbp), %rbx
	movq $0, %rcx
	cmpq %rbx, %rcx
	jnz label591
label589:
	jmp label588
	jmp label590
label591:
	movq $1, %rcx
	cmpq %rbx, %rcx
	jnz label593
label590:
	leaq str0(%rip), %rcx
	movq %rcx, 16(%rbp)
	jmp label583
	jmp label592
label593:
	movq $2, %rcx
	cmpq %rbx, %rcx
	jnz label595
label592:
	leaq str1(%rip), %rcx
	movq %rcx, 16(%rbp)
	jmp label583
label595:
label588:
	leaq str2(%rip), %rbx
	movq %rbx, 16(%rbp)
	jmp label583
	jmp label586
label587:
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label598
label586:
	leaq str3(%rip), %rbx
	movq %rbx, 16(%rbp)
	jmp label583
	jmp label597
label598:
	movq $2, %rbx
	cmpq %rax, %rbx
	jnz label600
label597:
	leaq str4(%rip), %rbx
	movq %rbx, 16(%rbp)
	jmp label583
label600:
label584:
	leaq str5(%rip), %rax
	movq %rax, 16(%rbp)
	jmp label583
label583:
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
	jnz label603
	movq $1, %rax
	jmp label604
label603:
	movq $0, %rax
label604:
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
	jnz label605
	movq $1, %rax
	jmp label606
label605:
	movq $0, %rax
label606:
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
	jnz label607
	movq $1, %rax
	jmp label608
label607:
	movq $0, %rax
label608:
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
	jnz label609
	movq $1, %rax
	jmp label610
label609:
	movq $0, %rax
label610:
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
	jnz label611
	movq $1, %rax
	jmp label612
label611:
	movq $0, %rax
label612:
	movq %rax, %rdi
	call assertion
label602:
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
