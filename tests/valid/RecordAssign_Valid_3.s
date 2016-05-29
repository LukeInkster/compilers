
	.text
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
	movq $2, %rax
	movq %rax, -16(%rbp)
	movq $3, %rax
	movq %rax, -8(%rbp)
	movq $1, %rax
	movq %rax, -32(%rbp)
	movq $3, %rax
	movq %rax, -24(%rbp)
	subq $32, %rsp
	movq -16(%rbp), %rax
	movq %rax, 0(%rsp)
	movq -8(%rbp), %rax
	movq %rax, 8(%rsp)
	movq $2, %rax
	movq %rax, 16(%rsp)
	movq $3, %rax
	movq %rax, 24(%rsp)
	movq 0(%rsp), %rax
	movq 16(%rsp), %rbx
	cmpq %rbx, %rax
	jnz label490
	movq 8(%rsp), %rax
	movq 24(%rsp), %rbx
	cmpq %rbx, %rax
	jnz label490
	addq $32, %rsp
	movq $1, %rax
	jmp label491
label490:
	movq $0, %rax
label491:
	movq %rax, %rdi
	call assertion
	subq $32, %rsp
	movq -32(%rbp), %rax
	movq %rax, 0(%rsp)
	movq -24(%rbp), %rax
	movq %rax, 8(%rsp)
	movq $1, %rax
	movq %rax, 16(%rsp)
	movq $3, %rax
	movq %rax, 24(%rsp)
	movq 0(%rsp), %rax
	movq 16(%rsp), %rbx
	cmpq %rbx, %rax
	jnz label492
	movq 8(%rsp), %rax
	movq 24(%rsp), %rbx
	cmpq %rbx, %rax
	jnz label492
	addq $32, %rsp
	movq $1, %rax
	jmp label493
label492:
	movq $0, %rax
label493:
	movq %rax, %rdi
	call assertion
	subq $32, %rsp
	movq -16(%rbp), %rax
	movq %rax, 0(%rsp)
	movq -8(%rbp), %rax
	movq %rax, 8(%rsp)
	movq -32(%rbp), %rax
	movq %rax, 16(%rsp)
	movq -24(%rbp), %rax
	movq %rax, 24(%rsp)
	movq 0(%rsp), %rax
	movq 16(%rsp), %rbx
	cmpq %rbx, %rax
	jnz label496
	movq 8(%rsp), %rax
	movq 24(%rsp), %rbx
	cmpq %rbx, %rax
	jnz label496
	jmp label494
label496:
	addq $32, %rsp
	movq $1, %rax
	jmp label495
label494:
	movq $0, %rax
label495:
	movq %rax, %rdi
	call assertion
	movq $1, %rax
	movq %rax, -16(%rbp)
	subq $32, %rsp
	movq -16(%rbp), %rax
	movq %rax, 0(%rsp)
	movq -8(%rbp), %rax
	movq %rax, 8(%rsp)
	movq $1, %rax
	movq %rax, 16(%rsp)
	movq $3, %rax
	movq %rax, 24(%rsp)
	movq 0(%rsp), %rax
	movq 16(%rsp), %rbx
	cmpq %rbx, %rax
	jnz label497
	movq 8(%rsp), %rax
	movq 24(%rsp), %rbx
	cmpq %rbx, %rax
	jnz label497
	addq $32, %rsp
	movq $1, %rax
	jmp label498
label497:
	movq $0, %rax
label498:
	movq %rax, %rdi
	call assertion
	subq $32, %rsp
	movq -16(%rbp), %rax
	movq %rax, 0(%rsp)
	movq -8(%rbp), %rax
	movq %rax, 8(%rsp)
	movq -32(%rbp), %rax
	movq %rax, 16(%rsp)
	movq -24(%rbp), %rax
	movq %rax, 24(%rsp)
	movq 0(%rsp), %rax
	movq 16(%rsp), %rbx
	cmpq %rbx, %rax
	jnz label499
	movq 8(%rsp), %rax
	movq 24(%rsp), %rbx
	cmpq %rbx, %rax
	jnz label499
	addq $32, %rsp
	movq $1, %rax
	jmp label500
label499:
	movq $0, %rax
label500:
	movq %rax, %rdi
	call assertion
label489:
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
