
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 32(%rbp), %rax
	movq 24(%rbp), %rbx
	movq %rax, %rax
	cqto
	idivq %rbx
	movq %rdx, %rax
	movq %rax, 16(%rbp)
	jmp label435
label435:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	movq $0, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $32, %rsp
	movq $5, %rbx
	movq %rbx, 8(%rsp)
	movq $10, %rbx
	movq %rbx, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -48(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label437
	movq $1, %rax
	jmp label438
label437:
	movq $0, %rax
label438:
	movq %rax, %rdi
	call assertion
	movq $2, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $32, %rsp
	movq $4, %rbx
	movq %rbx, 8(%rsp)
	movq $10, %rbx
	movq %rbx, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -48(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label439
	movq $1, %rax
	jmp label440
label439:
	movq $0, %rax
label440:
	movq %rax, %rdi
	call assertion
	movq $1, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $32, %rsp
	movq $4, %rbx
	movq %rbx, 8(%rsp)
	movq $1, %rbx
	movq %rbx, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -48(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label441
	movq $1, %rax
	jmp label442
label441:
	movq $0, %rax
label442:
	movq %rax, %rdi
	call assertion
	movq $1, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $32, %rsp
	movq $2, %rbx
	movq %rbx, 8(%rsp)
	movq $103, %rbx
	movq %rbx, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -48(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label443
	movq $1, %rax
	jmp label444
label443:
	movq $0, %rax
label444:
	movq %rax, %rdi
	call assertion
	movq $0, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $32, %rsp
	movq $5, %rbx
	movq %rbx, 8(%rsp)
	movq $-10, %rbx
	movq %rbx, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -48(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label445
	movq $1, %rax
	jmp label446
label445:
	movq $0, %rax
label446:
	movq %rax, %rdi
	call assertion
	movq $-2, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $32, %rsp
	movq $4, %rbx
	movq %rbx, 8(%rsp)
	movq $-10, %rbx
	movq %rbx, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -48(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label447
	movq $1, %rax
	jmp label448
label447:
	movq $0, %rax
label448:
	movq %rax, %rdi
	call assertion
	movq $-1, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $32, %rsp
	movq $4, %rbx
	movq %rbx, 8(%rsp)
	movq $-1, %rbx
	movq %rbx, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -48(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label449
	movq $1, %rax
	jmp label450
label449:
	movq $0, %rax
label450:
	movq %rax, %rdi
	call assertion
	movq $-1, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $32, %rsp
	movq $2, %rbx
	movq %rbx, 8(%rsp)
	movq $-103, %rbx
	movq %rbx, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -48(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label451
	movq $1, %rax
	jmp label452
label451:
	movq $0, %rax
label452:
	movq %rax, %rdi
	call assertion
	movq $0, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $32, %rsp
	movq $-5, %rbx
	movq %rbx, 8(%rsp)
	movq $-10, %rbx
	movq %rbx, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -48(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label453
	movq $1, %rax
	jmp label454
label453:
	movq $0, %rax
label454:
	movq %rax, %rdi
	call assertion
	movq $-2, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $32, %rsp
	movq $-4, %rbx
	movq %rbx, 8(%rsp)
	movq $-10, %rbx
	movq %rbx, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -48(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label455
	movq $1, %rax
	jmp label456
label455:
	movq $0, %rax
label456:
	movq %rax, %rdi
	call assertion
	movq $-1, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $32, %rsp
	movq $-4, %rbx
	movq %rbx, 8(%rsp)
	movq $-1, %rbx
	movq %rbx, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -48(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label457
	movq $1, %rax
	jmp label458
label457:
	movq $0, %rax
label458:
	movq %rax, %rdi
	call assertion
	movq $-1, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $32, %rsp
	movq $-2, %rbx
	movq %rbx, 8(%rsp)
	movq $-103, %rbx
	movq %rbx, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -48(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label459
	movq $1, %rax
	jmp label460
label459:
	movq $0, %rax
label460:
	movq %rax, %rdi
	call assertion
	movq $0, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $32, %rsp
	movq $-5, %rbx
	movq %rbx, 8(%rsp)
	movq $10, %rbx
	movq %rbx, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -48(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label461
	movq $1, %rax
	jmp label462
label461:
	movq $0, %rax
label462:
	movq %rax, %rdi
	call assertion
	movq $2, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $32, %rsp
	movq $-4, %rbx
	movq %rbx, 8(%rsp)
	movq $10, %rbx
	movq %rbx, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -48(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label463
	movq $1, %rax
	jmp label464
label463:
	movq $0, %rax
label464:
	movq %rax, %rdi
	call assertion
	movq $1, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $32, %rsp
	movq $-4, %rbx
	movq %rbx, 8(%rsp)
	movq $1, %rbx
	movq %rbx, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -48(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label465
	movq $1, %rax
	jmp label466
label465:
	movq $0, %rax
label466:
	movq %rax, %rdi
	call assertion
	movq $1, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $32, %rsp
	movq $-2, %rbx
	movq %rbx, 8(%rsp)
	movq $103, %rbx
	movq %rbx, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -48(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label467
	movq $1, %rax
	jmp label468
label467:
	movq $0, %rax
label468:
	movq %rax, %rdi
	call assertion
label436:
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
