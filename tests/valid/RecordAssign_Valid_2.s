
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq 32(%rbp), %rax
	movq %rax, 0(%rsp)
	movq 40(%rbp), %rax
	movq %rax, 8(%rsp)
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq $1, %rbx
	subq %rbx, %rax
	movq %rax, 16(%rbp)
	subq $16, %rsp
	movq 32(%rbp), %rax
	movq %rax, 0(%rsp)
	movq 40(%rbp), %rax
	movq %rax, 8(%rsp)
	movq 8(%rsp), %rax
	movq %rax, 24(%rbp)
	addq $16, %rsp
	jmp label384
label384:
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
	jnz label386
	movq 8(%rsp), %rax
	movq 24(%rsp), %rbx
	cmpq %rbx, %rax
	jnz label386
	addq $32, %rsp
	movq $1, %rax
	jmp label387
label386:
	movq $0, %rax
label387:
	movq %rax, %rdi
	call assertion
	subq $16, %rsp
	movq -16(%rbp), %rax
	movq %rax, 0(%rsp)
	movq -8(%rbp), %rax
	movq %rax, 8(%rsp)
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq $2, %rbx
	cmpq %rax, %rbx
	jnz label388
	movq $1, %rax
	jmp label389
label388:
	movq $0, %rax
label389:
	movq %rax, %rdi
	call assertion
	subq $16, %rsp
	movq -16(%rbp), %rax
	movq %rax, 0(%rsp)
	movq -8(%rbp), %rax
	movq %rax, 8(%rsp)
	movq 8(%rsp), %rax
	addq $16, %rsp
	movq $3, %rbx
	cmpq %rax, %rbx
	jnz label390
	movq $1, %rax
	jmp label391
label390:
	movq $0, %rax
label391:
	movq %rax, %rdi
	call assertion
	movq -16(%rbp), %rax
	movq $1, %rbx
	movq %rbx, 0(%rax)
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
	jnz label392
	movq 8(%rsp), %rax
	movq 24(%rsp), %rbx
	cmpq %rbx, %rax
	jnz label392
	addq $32, %rsp
	movq $1, %rax
	jmp label393
label392:
	movq $0, %rax
label393:
	movq %rax, %rdi
	call assertion
	subq $16, %rsp
	movq -16(%rbp), %rax
	movq %rax, 0(%rsp)
	movq -8(%rbp), %rax
	movq %rax, 8(%rsp)
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label394
	movq $1, %rax
	jmp label395
label394:
	movq $0, %rax
label395:
	movq %rax, %rdi
	call assertion
	subq $16, %rsp
	movq -16(%rbp), %rax
	movq %rax, 0(%rsp)
	movq -8(%rbp), %rax
	movq %rax, 8(%rsp)
	movq 8(%rsp), %rax
	addq $16, %rsp
	movq $3, %rbx
	cmpq %rax, %rbx
	jnz label396
	movq $1, %rax
	jmp label397
label396:
	movq $0, %rax
label397:
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
	jnz label398
	movq 8(%rsp), %rax
	movq 24(%rsp), %rbx
	cmpq %rbx, %rax
	jnz label398
	addq $32, %rsp
	movq $1, %rax
	jmp label399
label398:
	movq $0, %rax
label399:
	movq %rax, %rdi
	call assertion
	subq $16, %rsp
	movq -32(%rbp), %rax
	movq %rax, 0(%rsp)
	movq -24(%rbp), %rax
	movq %rax, 8(%rsp)
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label400
	movq $1, %rax
	jmp label401
label400:
	movq $0, %rax
label401:
	movq %rax, %rdi
	call assertion
	subq $16, %rsp
	movq -32(%rbp), %rax
	movq %rax, 0(%rsp)
	movq -24(%rbp), %rax
	movq %rax, 8(%rsp)
	movq 8(%rsp), %rax
	addq $16, %rsp
	movq $3, %rbx
	cmpq %rax, %rbx
	jnz label402
	movq $1, %rax
	jmp label403
label402:
	movq $0, %rax
label403:
	movq %rax, %rdi
	call assertion
label385:
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
