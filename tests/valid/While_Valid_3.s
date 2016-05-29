
	.text
wl_sum:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq $0, %rax
	movq %rax, -8(%rbp)
	movq $0, %rax
	movq %rax, -16(%rbp)
label1034:
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
	jge label1035
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
	movq -8(%rbp), %rbx
	incq %rbx
	movq (%rax,%rbx,8), %rcx
	movq %rcx, %rax
	movq $0, %rbx
	cmpq %rbx, %rax
	jge label1036
	movq -8(%rbp), %rax
	movq $1, %rbx
	addq %rbx, %rax
	movq %rax, -8(%rbp)
	jmp label1034
	jmp label1036
label1036:
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
	jmp label1034
label1035:
	movq -16(%rbp), %rax
	movq %rax, 16(%rbp)
	jmp label1033
label1033:
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
	jnz label1038
	movq $1, %rax
	jmp label1039
label1038:
	movq $0, %rax
label1039:
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
	jnz label1040
	movq $1, %rax
	jmp label1041
label1040:
	movq $0, %rax
label1041:
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
	movq $1, %rbx
	movq %rbx, 8(%rax)
	movq $-1, %rbx
	movq %rbx, 16(%rax)
	movq $2, %rbx
	movq %rbx, 24(%rax)
	movq $-2, %rbx
	movq %rbx, 32(%rax)
	movq $3, %rbx
	movq %rbx, 40(%rax)
	call wl_sum
	addq $16, %rsp
	movq -16(%rsp), %rax
	movq $6, %rbx
	cmpq %rax, %rbx
	jnz label1042
	movq $1, %rax
	jmp label1043
label1042:
	movq $0, %rax
label1043:
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
	jnz label1044
	movq $1, %rax
	jmp label1045
label1044:
	movq $0, %rax
label1045:
	movq %rax, %rdi
	call assertion
	subq $16, %rsp
	movq $64, %rax
	movq %rax, %rdi
	call malloc
	movq %rax, %rax
	movq %rax, 8(%rsp)
	movq $7, %rbx
	movq %rbx, 0(%rax)
	movq $123, %rbx
	movq %rbx, 8(%rax)
	movq $-1, %rbx
	movq %rbx, 16(%rax)
	movq $981, %rbx
	movq %rbx, 24(%rax)
	movq $1, %rbx
	movq %rbx, 32(%rax)
	movq $-1, %rbx
	movq %rbx, 40(%rax)
	movq $3, %rbx
	movq %rbx, 48(%rax)
	movq $0, %rbx
	movq %rbx, 56(%rax)
	call wl_sum
	addq $16, %rsp
	movq -16(%rsp), %rax
	movq $1108, %rbx
	cmpq %rax, %rbx
	jnz label1046
	movq $1, %rax
	jmp label1047
label1046:
	movq $0, %rax
label1047:
	movq %rax, %rdi
	call assertion
label1037:
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
