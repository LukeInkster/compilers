
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq $24, %rax
	movq %rax, %rdi
	call malloc
	movq %rax, %rax
	movq %rax, 16(%rbp)
	movq $2, %rbx
	movq %rbx, 0(%rax)
	movq $1, %rbx
	movq %rbx, 8(%rax)
	movq $2, %rbx
	movq %rbx, 16(%rax)
	jmp label16
label16:
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
	movq %rax, -8(%rbp)
	subq $16, %rsp
	call wl_f
	addq $16, %rsp
	movq -16(%rsp), %rax
	movq %rax, -16(%rbp)
	movq -16(%rbp), %rax
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
	movq $0, %rcx
	movq %rcx, (%rax,%rbx,8)
	movq %rax, -16(%rbp)
	movq $1, %rax
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
	movq $0, %rcx
	incq %rcx
	movq (%rbx,%rcx,8), %rdx
	movq %rdx, %rbx
	cmpq %rax, %rbx
	jnz label18
	movq $1, %rax
	jmp label19
label18:
	movq $0, %rax
label19:
	movq %rax, %rdi
	call assertion
	movq $2, %rax
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
	movq $1, %rcx
	incq %rcx
	movq (%rbx,%rcx,8), %rdx
	movq %rdx, %rbx
	cmpq %rax, %rbx
	jnz label20
	movq $1, %rax
	jmp label21
label20:
	movq $0, %rax
label21:
	movq %rax, %rdi
	call assertion
	movq $0, %rax
	movq -16(%rbp), %rbx
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
	movq $0, %rcx
	incq %rcx
	movq (%rbx,%rcx,8), %rdx
	movq %rdx, %rbx
	cmpq %rax, %rbx
	jnz label22
	movq $1, %rax
	jmp label23
label22:
	movq $0, %rax
label23:
	movq %rax, %rdi
	call assertion
	movq $2, %rax
	movq -16(%rbp), %rbx
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
	movq $1, %rcx
	incq %rcx
	movq (%rbx,%rcx,8), %rdx
	movq %rdx, %rbx
	cmpq %rax, %rbx
	jnz label24
	movq $1, %rax
	jmp label25
label24:
	movq $0, %rax
label25:
	movq %rax, %rdi
	call assertion
label17:
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
