
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	movq 0(%rax), %rbx
	incq %rbx
	movq %rbx, %rcx
	imulq $8, %rcx
	subq $16, %rsp
	movq %rax, 0(%rsp)
	movq %rbx, 8(%rsp)
	movq %rcx, %rdi
	call malloc
	movq %rax, %rcx
	movq 0(%rsp), %rax
	movq 8(%rsp), %rbx
	addq $16, %rsp
	subq $32, %rsp
	movq %rax, 0(%rsp)
	movq %rbx, 8(%rsp)
	movq %rcx, 16(%rsp)
	movq %rcx, %rdi
	movq %rax, %rsi
	movq %rbx, %rdx
	call intncpy
	movq 0(%rsp), %rax
	movq 8(%rsp), %rbx
	movq 16(%rsp), %rcx
	addq $32, %rsp
	movq %rcx, %rax
	movq 0(%rax), %rax
	movq %rax, 16(%rbp)
	jmp label73
label73:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq $8, %rax
	movq %rax, %rdi
	call malloc
	movq %rax, %rax
	movq %rax, 8(%rsp)
	movq $0, %rbx
	movq %rbx, 0(%rax)
	call wl_f
	addq $16, %rsp
	movq -16(%rsp), %rax
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label75
	movq $1, %rax
	jmp label76
label75:
	movq $0, %rax
label76:
	movq %rax, %rdi
	call assertion
	subq $16, %rsp
	movq $16, %rax
	movq %rax, %rdi
	call malloc
	movq %rax, %rax
	movq %rax, 8(%rsp)
	movq $1, %rbx
	movq %rbx, 0(%rax)
	movq $5, %rbx
	movq %rbx, 8(%rax)
	call wl_f
	addq $16, %rsp
	movq -16(%rsp), %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label77
	movq $1, %rax
	jmp label78
label77:
	movq $0, %rax
label78:
	movq %rax, %rdi
	call assertion
	subq $16, %rsp
	movq $24, %rax
	movq %rax, %rdi
	call malloc
	movq %rax, %rax
	movq %rax, 8(%rsp)
	movq $2, %rbx
	movq %rbx, 0(%rax)
	movq $5, %rbx
	movq %rbx, 8(%rax)
	movq $5, %rbx
	movq %rbx, 16(%rax)
	call wl_f
	addq $16, %rsp
	movq -16(%rsp), %rax
	movq $2, %rbx
	cmpq %rax, %rbx
	jnz label79
	movq $1, %rax
	jmp label80
label79:
	movq $0, %rax
label80:
	movq %rax, %rdi
	call assertion
	subq $16, %rsp
	movq $32, %rax
	movq %rax, %rdi
	call malloc
	movq %rax, %rax
	movq %rax, 8(%rsp)
	movq $3, %rbx
	movq %rbx, 0(%rax)
	movq $5, %rbx
	movq %rbx, 8(%rax)
	movq $5, %rbx
	movq %rbx, 16(%rax)
	movq $5, %rbx
	movq %rbx, 24(%rax)
	call wl_f
	addq $16, %rsp
	movq -16(%rsp), %rax
	movq $3, %rbx
	cmpq %rax, %rbx
	jnz label81
	movq $1, %rax
	jmp label82
label81:
	movq $0, %rax
label82:
	movq %rax, %rdi
	call assertion
	subq $16, %rsp
	movq $40, %rax
	movq %rax, %rdi
	call malloc
	movq %rax, %rax
	movq %rax, 8(%rsp)
	movq $4, %rbx
	movq %rbx, 0(%rax)
	movq $5, %rbx
	movq %rbx, 8(%rax)
	movq $5, %rbx
	movq %rbx, 16(%rax)
	movq $5, %rbx
	movq %rbx, 24(%rax)
	movq $5, %rbx
	movq %rbx, 32(%rax)
	call wl_f
	addq $16, %rsp
	movq -16(%rsp), %rax
	movq $4, %rbx
	cmpq %rax, %rbx
	jnz label83
	movq $1, %rax
	jmp label84
label83:
	movq $0, %rax
label84:
	movq %rax, %rdi
	call assertion
label74:
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
