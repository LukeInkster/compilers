
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
	cmpq %rax, %rbx
	jnz label912
label910:
	movq $0, %rbx
	movq %rbx, 16(%rbp)
	jmp label908
	jmp label911
label912:
	cmpq %rax, %rbx
	jnz label914
label911:
	movq $-1, %rbx
	movq %rbx, 16(%rbp)
	jmp label908
label914:
label909:
	movq $10, %rax
	movq %rax, 16(%rbp)
	jmp label908
label908:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	movq $0, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	movq $8, %rbx
	subq $16, %rsp
	movq %rax, 0(%rsp)
	movq %rbx, %rdi
	call malloc
	movq %rax, %rbx
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq %rbx, 8(%rsp)
	movq $0, %rcx
	movq %rcx, 0(%rbx)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label917
	movq $1, %rax
	jmp label918
label917:
	movq $0, %rax
label918:
	movq %rax, %rdi
	call assertion
	movq $-1, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	movq $16, %rbx
	subq $16, %rsp
	movq %rax, 0(%rsp)
	movq %rbx, %rdi
	call malloc
	movq %rax, %rbx
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq %rbx, 8(%rsp)
	movq $1, %rcx
	movq %rcx, 0(%rbx)
	movq $1, %rcx
	movq %rcx, 8(%rbx)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label919
	movq $1, %rax
	jmp label920
label919:
	movq $0, %rax
label920:
	movq %rax, %rdi
	call assertion
	movq $10, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	movq $16, %rbx
	subq $16, %rsp
	movq %rax, 0(%rsp)
	movq %rbx, %rdi
	call malloc
	movq %rax, %rbx
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq %rbx, 8(%rsp)
	movq $1, %rcx
	movq %rcx, 0(%rbx)
	movq $3, %rcx
	movq %rcx, 8(%rbx)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label921
	movq $1, %rax
	jmp label922
label921:
	movq $0, %rax
label922:
	movq %rax, %rdi
	call assertion
	movq $10, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	movq $32, %rbx
	subq $16, %rsp
	movq %rax, 0(%rsp)
	movq %rbx, %rdi
	call malloc
	movq %rax, %rbx
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq %rbx, 8(%rsp)
	movq $3, %rcx
	movq %rcx, 0(%rbx)
	movq $1, %rcx
	movq %rcx, 8(%rbx)
	movq $2, %rcx
	movq %rcx, 16(%rbx)
	movq $3, %rcx
	movq %rcx, 24(%rbx)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label923
	movq $1, %rax
	jmp label924
label923:
	movq $0, %rax
label924:
	movq %rax, %rdi
	call assertion
label916:
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
