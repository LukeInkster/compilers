
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 32(%rbp), %rax
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label557
label555:
	movq 24(%rbp), %rbx
	movq $0, %rcx
	cmpq %rbx, %rcx
	jnz label561
label559:
	leaq str0(%rip), %rcx
	movq %rcx, 16(%rbp)
	jmp label553
	jmp label560
label561:
	movq $1, %rcx
	cmpq %rbx, %rcx
	jnz label563
label560:
	leaq str1(%rip), %rcx
	movq %rcx, 16(%rbp)
	jmp label553
	jmp label562
label563:
	movq $2, %rcx
	cmpq %rbx, %rcx
	jnz label565
label562:
	leaq str2(%rip), %rcx
	movq %rcx, 16(%rbp)
	jmp label553
label565:
label558:
	jmp label556
label557:
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label568
label556:
	leaq str3(%rip), %rbx
	movq %rbx, 16(%rbp)
	jmp label553
	jmp label567
label568:
	movq $2, %rbx
	cmpq %rax, %rbx
	jnz label570
label567:
	leaq str4(%rip), %rbx
	movq %rbx, 16(%rbp)
	jmp label553
label570:
label554:
	leaq str5(%rip), %rax
	movq %rax, 16(%rbp)
	jmp label553
label553:
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
	jnz label573
	movq $1, %rax
	jmp label574
label573:
	movq $0, %rax
label574:
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
	jnz label575
	movq $1, %rax
	jmp label576
label575:
	movq $0, %rax
label576:
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
	jnz label577
	movq $1, %rax
	jmp label578
label577:
	movq $0, %rax
label578:
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
	jnz label579
	movq $1, %rax
	jmp label580
label579:
	movq $0, %rax
label580:
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
	jnz label581
	movq $1, %rax
	jmp label582
label581:
	movq $0, %rax
label582:
	movq %rax, %rdi
	call assertion
label572:
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
