
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
	movq $0, %rbx
	incq %rbx
	movq $5, %rcx
	movq %rcx, (%rax,%rbx,8)
	movq %rax, 24(%rbp)
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
	movq %rcx, 16(%rbp)
	jmp label26
label26:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq $32, %rax
	movq %rax, %rdi
	call malloc
	movq %rax, %rax
	movq %rax, -8(%rbp)
	movq $3, %rbx
	movq %rbx, 0(%rax)
	movq $1, %rbx
	movq %rbx, 8(%rax)
	movq $2, %rbx
	movq %rbx, 16(%rax)
	movq $3, %rbx
	movq %rbx, 24(%rax)
	movq $32, %rax
	movq %rax, %rdi
	call malloc
	movq %rax, %rax
	movq $3, %rbx
	movq %rbx, 0(%rax)
	movq $1, %rbx
	movq %rbx, 8(%rax)
	movq $2, %rbx
	movq %rbx, 16(%rax)
	movq $3, %rbx
	movq %rbx, 24(%rax)
	movq -8(%rbp), %rbx
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
	jz label28
	movq $1, %rax
	jmp label29
label28:
	movq $0, %rax
label29:
	movq %rax, %rdi
	call assertion
	movq $32, %rax
	movq %rax, %rdi
	call malloc
	movq %rax, %rax
	movq $3, %rbx
	movq %rbx, 0(%rax)
	movq $5, %rbx
	movq %rbx, 8(%rax)
	movq $2, %rbx
	movq %rbx, 16(%rax)
	movq $3, %rbx
	movq %rbx, 24(%rax)
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	movq -8(%rbp), %rbx
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
	movq %rdx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
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
	jz label30
	movq $1, %rax
	jmp label31
label30:
	movq $0, %rax
label31:
	movq %rax, %rdi
	call assertion
	movq $32, %rax
	movq %rax, %rdi
	call malloc
	movq %rax, %rax
	movq $3, %rbx
	movq %rbx, 0(%rax)
	movq $1, %rbx
	movq %rbx, 8(%rax)
	movq $2, %rbx
	movq %rbx, 16(%rax)
	movq $3, %rbx
	movq %rbx, 24(%rax)
	movq -8(%rbp), %rbx
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
	jz label32
	movq $1, %rax
	jmp label33
label32:
	movq $0, %rax
label33:
	movq %rax, %rdi
	call assertion
label27:
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
