
	.text
wl_sum:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq $0, %rax
	movq %rax, -8(%rbp)
	movq $0, %rax
	movq %rax, -16(%rbp)
label1029:
	movq -8(%rbp), %rax
	movq 24(%rbp), %rbx
	movq 0(%rbx), %rcx
	incq %rcx
	movq %rcx, %rdx
	imulq $8, %rdx
	subq $32, %rsp
	movq %rax, 0(%rsp)
	movq %rbx, 8(%rsp)
	movq %rcx, 16(%rsp)
	movq %rdx, %rdi
	call malloc
	movq %rax, %rdx
	movq 0(%rsp), %rax
	movq 8(%rsp), %rbx
	movq 16(%rsp), %rcx
	addq $32, %rsp
	subq $32, %rsp
	movq %rax, 0(%rsp)
	movq %rbx, 8(%rsp)
	movq %rcx, 16(%rsp)
	movq %rdx, 24(%rsp)
	movq %rdx, %rdi
	movq %rbx, %rsi
	movq %rcx, %rdx
	call intncpy
	movq 0(%rsp), %rax
	movq 8(%rsp), %rbx
	movq 16(%rsp), %rcx
	movq 24(%rsp), %rdx
	addq $32, %rsp
	movq %rdx, %rbx
	movq 0(%rbx), %rbx
	cmpq %rbx, %rax
	jge label1030
	movq -16(%rbp), %rax
	movq 24(%rbp), %rbx
	movq 0(%rbx), %rcx
	incq %rcx
	movq %rcx, %rdx
	imulq $8, %rdx
	subq $32, %rsp
	movq %rax, 0(%rsp)
	movq %rbx, 8(%rsp)
	movq %rcx, 16(%rsp)
	movq %rdx, %rdi
	call malloc
	movq %rax, %rdx
	movq 0(%rsp), %rax
	movq 8(%rsp), %rbx
	movq 16(%rsp), %rcx
	addq $32, %rsp
	subq $32, %rsp
	movq %rax, 0(%rsp)
	movq %rbx, 8(%rsp)
	movq %rcx, 16(%rsp)
	movq %rdx, 24(%rsp)
	movq %rdx, %rdi
	movq %rbx, %rsi
	movq %rcx, %rdx
	call intncpy
	movq 0(%rsp), %rax
	movq 8(%rsp), %rbx
	movq 16(%rsp), %rcx
	movq 24(%rsp), %rdx
	addq $32, %rsp
	movq %rdx, %rbx
	movq -8(%rbp), %rcx
	incq %rcx
	movq (%rbx,%rcx,8), %rdx
	movq %rdx, %rbx
	addq %rbx, %rax
	movq %rax, -16(%rbp)
	movq -8(%rbp), %rax
	movq $1, %rbx
	addq %rbx, %rax
	movq %rax, -8(%rbp)
	jmp label1029
label1030:
	movq -16(%rbp), %rax
	movq %rax, 16(%rbp)
	jmp label1028
label1028:
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
	call wl_sum
	addq $16, %rsp
	movq -16(%rsp), %rax
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label1032
	movq $1, %rax
	jmp label1033
label1032:
	movq $0, %rax
label1033:
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
	movq $1, %rbx
	movq %rbx, 8(%rax)
	movq $2, %rbx
	movq %rbx, 16(%rax)
	movq $3, %rbx
	movq %rbx, 24(%rax)
	call wl_sum
	addq $16, %rsp
	movq -16(%rsp), %rax
	movq $6, %rbx
	cmpq %rax, %rbx
	jnz label1034
	movq $1, %rax
	jmp label1035
label1034:
	movq $0, %rax
label1035:
	movq %rax, %rdi
	call assertion
	subq $16, %rsp
	movq $48, %rax
	movq %rax, %rdi
	call malloc
	movq %rax, %rax
	movq %rax, 8(%rsp)
	movq $5, %rbx
	movq %rbx, 0(%rax)
	movq $123, %rbx
	movq %rbx, 8(%rax)
	movq $981, %rbx
	movq %rbx, 16(%rax)
	movq $1, %rbx
	movq %rbx, 24(%rax)
	movq $3, %rbx
	movq %rbx, 32(%rax)
	movq $0, %rbx
	movq %rbx, 40(%rax)
	call wl_sum
	addq $16, %rsp
	movq -16(%rsp), %rax
	movq $1108, %rbx
	cmpq %rax, %rbx
	jnz label1036
	movq $1, %rax
	jmp label1037
label1036:
	movq $0, %rax
label1037:
	movq %rax, %rdi
	call assertion
label1031:
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
