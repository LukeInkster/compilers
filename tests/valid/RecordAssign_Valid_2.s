
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq 32(%rbp), %rax
	movq %rax, 0(%rsp)
	movq 40(%rbp), %rax
	movq %rax, 8(%rsp)
	movq %rsp, %rax
	addq $16, %rsp
	movq 0(%rax), %rax
	movq $1, %rbx
	subq %rbx, %rax
	movq %rax, 16(%rbp)
	subq $16, %rsp
	movq 32(%rbp), %rax
	movq %rax, 0(%rsp)
	movq 40(%rbp), %rax
	movq %rax, 8(%rsp)
	movq %rsp, %rax
	addq $16, %rsp
	movq 8(%rax), %rbx
	movq %rbx, 24(%rbp)
	jmp label469
label469:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
	movq $2, %rax
	movq %rax, -16(%rbp)
	movq $3, %rax
	movq %rax, -8(%rbp)
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
	jnz label471
	movq 8(%rsp), %rax
	movq 24(%rsp), %rbx
	cmpq %rbx, %rax
	jnz label471
	addq $32, %rsp
	movq $1, %rax
	jmp label472
label471:
	movq $0, %rax
label472:
	movq %rax, %rdi
	call assertion
	subq $16, %rsp
	movq -16(%rbp), %rax
	movq %rax, 0(%rsp)
	movq -8(%rbp), %rax
	movq %rax, 8(%rsp)
	movq %rsp, %rax
	addq $16, %rsp
	movq 0(%rax), %rax
	movq $2, %rbx
	cmpq %rax, %rbx
	jnz label473
	movq $1, %rax
	jmp label474
label473:
	movq $0, %rax
label474:
	movq %rax, %rdi
	call assertion
	subq $16, %rsp
	movq -16(%rbp), %rax
	movq %rax, 0(%rsp)
	movq -8(%rbp), %rax
	movq %rax, 8(%rsp)
	movq %rsp, %rax
	addq $16, %rsp
	movq 8(%rax), %rax
	movq $3, %rbx
	cmpq %rax, %rbx
	jnz label475
	movq $1, %rax
	jmp label476
label475:
	movq $0, %rax
label476:
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
	jnz label477
	movq 8(%rsp), %rax
	movq 24(%rsp), %rbx
	cmpq %rbx, %rax
	jnz label477
	addq $32, %rsp
	movq $1, %rax
	jmp label478
label477:
	movq $0, %rax
label478:
	movq %rax, %rdi
	call assertion
	subq $16, %rsp
	movq -16(%rbp), %rax
	movq %rax, 0(%rsp)
	movq -8(%rbp), %rax
	movq %rax, 8(%rsp)
	movq %rsp, %rax
	addq $16, %rsp
	movq 0(%rax), %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label479
	movq $1, %rax
	jmp label480
label479:
	movq $0, %rax
label480:
	movq %rax, %rdi
	call assertion
	subq $16, %rsp
	movq -16(%rbp), %rax
	movq %rax, 0(%rsp)
	movq -8(%rbp), %rax
	movq %rax, 8(%rsp)
	movq %rsp, %rax
	addq $16, %rsp
	movq 8(%rax), %rax
	movq $3, %rbx
	cmpq %rax, %rbx
	jnz label481
	movq $1, %rax
	jmp label482
label481:
	movq $0, %rax
label482:
	movq %rax, %rdi
	call assertion
	subq $32, %rsp
	movq -16(%rbp), %rax
	movq %rax, 16(%rsp)
	movq -8(%rbp), %rax
	movq %rax, 24(%rsp)
	call wl_f
	addq $32, %rsp
	movq -32(%rsp), %rax
	movq %rax, -32(%rbp)
	movq -24(%rsp), %rax
	movq %rax, -24(%rbp)
	subq $32, %rsp
	movq -32(%rbp), %rax
	movq %rax, 0(%rsp)
	movq -24(%rbp), %rax
	movq %rax, 8(%rsp)
	movq $0, %rax
	movq %rax, 16(%rsp)
	movq $3, %rax
	movq %rax, 24(%rsp)
	movq 0(%rsp), %rax
	movq 16(%rsp), %rbx
	cmpq %rbx, %rax
	jnz label483
	movq 8(%rsp), %rax
	movq 24(%rsp), %rbx
	cmpq %rbx, %rax
	jnz label483
	addq $32, %rsp
	movq $1, %rax
	jmp label484
label483:
	movq $0, %rax
label484:
	movq %rax, %rdi
	call assertion
	subq $16, %rsp
	movq -32(%rbp), %rax
	movq %rax, 0(%rsp)
	movq -24(%rbp), %rax
	movq %rax, 8(%rsp)
	movq %rsp, %rax
	addq $16, %rsp
	movq 0(%rax), %rax
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label485
	movq $1, %rax
	jmp label486
label485:
	movq $0, %rax
label486:
	movq %rax, %rdi
	call assertion
	subq $16, %rsp
	movq -32(%rbp), %rax
	movq %rax, 0(%rsp)
	movq -24(%rbp), %rax
	movq %rax, 8(%rsp)
	movq %rsp, %rax
	addq $16, %rsp
	movq 8(%rax), %rax
	movq $3, %rbx
	cmpq %rax, %rbx
	jnz label487
	movq $1, %rax
	jmp label488
label487:
	movq $0, %rax
label488:
	movq %rax, %rdi
	call assertion
label470:
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
