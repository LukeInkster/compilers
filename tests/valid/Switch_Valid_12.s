
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 32(%rbp), %rax
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label493
	movq 24(%rbp), %rbx
	movq $0, %rcx
	cmpq %rbx, %rcx
	jnz label495
	leaq str0(%rip), %rcx
	movq %rcx, 16(%rbp)
	jmp label491
label495:
	movq $1, %rcx
	cmpq %rbx, %rcx
	jnz label496
	leaq str1(%rip), %rcx
	movq %rcx, 16(%rbp)
	jmp label491
label496:
	movq $2, %rcx
	cmpq %rbx, %rcx
	jnz label497
	leaq str2(%rip), %rcx
	movq %rcx, 16(%rbp)
	jmp label491
label497:
label494:
label493:
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label498
	leaq str3(%rip), %rbx
	movq %rbx, 16(%rbp)
	jmp label491
label498:
	movq $2, %rbx
	cmpq %rax, %rbx
	jnz label499
	leaq str4(%rip), %rbx
	movq %rbx, 16(%rbp)
	jmp label491
label499:
label492:
	leaq str5(%rip), %rax
	movq %rax, 16(%rbp)
	jmp label491
label491:
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
	jnz label501
	movq $1, %rax
	jmp label502
label501:
	movq $0, %rax
label502:
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
	jnz label503
	movq $1, %rax
	jmp label504
label503:
	movq $0, %rax
label504:
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
	jnz label505
	movq $1, %rax
	jmp label506
label505:
	movq $0, %rax
label506:
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
	jnz label507
	movq $1, %rax
	jmp label508
label507:
	movq $0, %rax
label508:
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
	jnz label509
	movq $1, %rax
	jmp label510
label509:
	movq $0, %rax
label510:
	movq %rax, %rdi
	call assertion
label500:
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
