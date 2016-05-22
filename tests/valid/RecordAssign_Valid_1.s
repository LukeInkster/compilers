
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq $2, %rax
	movq %rax, 16(%rbp)
	movq $3, %rax
	movq %rax, 24(%rbp)
	jmp label378
label378:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	subq $16, %rsp
	call wl_f
	addq $16, %rsp
	movq -16(%rsp), %rax
	movq %rax, -16(%rbp)
	movq -8(%rsp), %rax
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
	jnz label380
	movq 8(%rsp), %rax
	movq 24(%rsp), %rbx
	cmpq %rbx, %rax
	jnz label380
	addq $32, %rsp
	movq $1, %rax
	jmp label381
label380:
	movq $0, %rax
label381:
	movq %rax, %rdi
	call assertion
	movq -16(%rbp), %rax
	subq $16, %rsp
	movq -16(%rbp), %rbx
	movq %rbx, 0(%rsp)
	movq -8(%rbp), %rbx
	movq %rbx, 8(%rsp)
	movq 8(%rsp), %rbx
	addq $16, %rsp
	movq $2, %rcx
	subq %rcx, %rbx
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
	jnz label382
	movq 8(%rsp), %rax
	movq 24(%rsp), %rbx
	cmpq %rbx, %rax
	jnz label382
	addq $32, %rsp
	movq $1, %rax
	jmp label383
label382:
	movq $0, %rax
label383:
	movq %rax, %rdi
	call assertion
label379:
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
