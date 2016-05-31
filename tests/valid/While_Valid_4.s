
	.text
wl_trim:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq $0, %rax
	movq %rax, -16(%rbp)
	movq 24(%rbp), %rax
	movq %rax, %rbx
	incq %rbx
	imulq $8, %rbx
	subq $16, %rsp
	movq %rax, 0(%rsp)
	movq %rbx, %rdi
	call malloc
	movq %rax, %rbx
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq %rbx, -8(%rbp)
	movq %rax, 0(%rbx)
	movq $0, %rcx
	addq $8, %rbx
	subq $32, %rsp
	movq %rax, 0(%rsp)
	movq %rbx, 8(%rsp)
	movq %rcx, 16(%rsp)
	movq %rbx, %rdi
	movq %rax, %rsi
	movq %rcx, %rdx
	call intnfill
	movq %rax, %rbx
	movq 0(%rsp), %rax
	movq 8(%rsp), %rbx
	movq 16(%rsp), %rcx
	addq $32, %rsp
label1054:
	movq -16(%rbp), %rax
	movq 24(%rbp), %rbx
	cmpq %rbx, %rax
	jge label1055
	movq -8(%rbp), %rax
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
	movq -16(%rbp), %rbx
	incq %rbx
	movq 32(%rbp), %rcx
	movq 0(%rcx), %rdx
	incq %rdx
	movq %rdx, %rdi
	imulq $8, %rdi
	subq $32, %rsp
	movq %rax, 0(%rsp)
	movq %rbx, 8(%rsp)
	movq %rcx, 16(%rsp)
	movq %rdx, 24(%rsp)
	call malloc
	movq %rax, %rdi
	movq 0(%rsp), %rax
	movq 8(%rsp), %rbx
	movq 16(%rsp), %rcx
	movq 24(%rsp), %rdx
	addq $32, %rsp
	subq $48, %rsp
	movq %rax, 0(%rsp)
	movq %rbx, 8(%rsp)
	movq %rcx, 16(%rsp)
	movq %rdx, 24(%rsp)
	movq %rdi, 32(%rsp)
	movq %rcx, %rsi
	call intncpy
	movq 0(%rsp), %rax
	movq 8(%rsp), %rbx
	movq 16(%rsp), %rcx
	movq 24(%rsp), %rdx
	movq 32(%rsp), %rdi
	addq $48, %rsp
	movq %rdi, %rcx
	movq -16(%rbp), %rdx
	incq %rdx
	movq (%rcx,%rdx,8), %rdi
	movq %rdi, %rcx
	movq %rcx, (%rax,%rbx,8)
	movq %rax, -8(%rbp)
	movq -16(%rbp), %rax
	movq $1, %rbx
	addq %rbx, %rax
	movq %rax, -16(%rbp)
	jmp label1054
label1055:
	movq -8(%rbp), %rax
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
	movq %rcx, 16(%rbp)
	jmp label1053
label1053:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	subq $32, %rsp
	movq $4, %rax
	movq %rax, 8(%rsp)
	movq $80, %rax
	movq %rax, %rdi
	call malloc
	movq %rax, %rax
	movq %rax, 16(%rsp)
	movq $9, %rbx
	movq %rbx, 0(%rax)
	movq $-2, %rbx
	movq %rbx, 8(%rax)
	movq $-3, %rbx
	movq %rbx, 16(%rax)
	movq $1, %rbx
	movq %rbx, 24(%rax)
	movq $2, %rbx
	movq %rbx, 32(%rax)
	movq $-23, %rbx
	movq %rbx, 40(%rax)
	movq $3, %rbx
	movq %rbx, 48(%rax)
	movq $2345, %rbx
	movq %rbx, 56(%rax)
	movq $4, %rbx
	movq %rbx, 64(%rax)
	movq $5, %rbx
	movq %rbx, 72(%rax)
	call wl_trim
	addq $32, %rsp
	movq -32(%rsp), %rax
	movq %rax, -8(%rbp)
	movq -8(%rbp), %rax
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
	movq $40, %rbx
	subq $16, %rsp
	movq %rax, 0(%rsp)
	movq %rbx, %rdi
	call malloc
	movq %rax, %rbx
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq $4, %rcx
	movq %rcx, 0(%rbx)
	movq $-2, %rcx
	movq %rcx, 8(%rbx)
	movq $-3, %rcx
	movq %rcx, 16(%rbx)
	movq $1, %rcx
	movq %rcx, 24(%rbx)
	movq $2, %rcx
	movq %rcx, 32(%rbx)
	movq %rax, %rcx
	movq %rbx, %rdx
	movq 0(%rcx), %rdi
	incq %rdi
	subq $48, %rsp
	movq %rax, 0(%rsp)
	movq %rbx, 8(%rsp)
	movq %rcx, 16(%rsp)
	movq %rdx, 24(%rsp)
	movq %rdi, 32(%rsp)
	xchgq %rcx, %rdi
	movq %rdx, %rsi
	movq %rcx, %rdx
	call intncmp
	movq %rax, %rsi
	movq 0(%rsp), %rax
	movq 8(%rsp), %rbx
	movq 16(%rsp), %rcx
	movq 24(%rsp), %rdx
	movq 32(%rsp), %rdi
	addq $48, %rsp
	cmpq $0, %rsi
	jz label1057
	movq $1, %rax
	jmp label1058
label1057:
	movq $0, %rax
label1058:
	movq %rax, %rdi
	call assertion
label1056:
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
