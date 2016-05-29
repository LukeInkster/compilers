
	.text
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
	movq $32, %rax
	movq %rax, %rdi
	call malloc
	movq %rax, %rax
	movq %rax, -32(%rbp)
	movq $3, %rbx
	movq %rbx, 0(%rax)
	movq $1, %rbx
	movq %rbx, 8(%rax)
	movq $2, %rbx
	movq %rbx, 16(%rax)
	movq $3, %rbx
	movq %rbx, 24(%rax)
	movq $1, %rax
	movq %rax, -16(%rbp)
	movq $2, %rax
	movq %rax, -8(%rbp)
	subq $16, %rsp
	movq -16(%rbp), %rax
	movq %rax, 0(%rsp)
	movq -8(%rbp), %rax
	movq %rax, 8(%rsp)
	movq 0(%rsp), %rax
	movq %rax, -24(%rbp)
	addq $16, %rsp
	movq -24(%rbp), %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label1006
	movq $1, %rax
	jmp label1007
label1006:
	movq $0, %rax
label1007:
	movq %rax, %rdi
	call assertion
	subq $16, %rsp
	movq -16(%rbp), %rax
	movq %rax, 0(%rsp)
	movq -8(%rbp), %rax
	movq %rax, 8(%rsp)
	movq 8(%rsp), %rax
	addq $16, %rsp
	movq $2, %rbx
	cmpq %rax, %rbx
	jnz label1008
	movq $1, %rax
	jmp label1009
label1008:
	movq $0, %rax
label1009:
	movq %rax, %rdi
	call assertion
	movq -32(%rbp), %rax
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
	movq $3, %rbx
	cmpq %rax, %rbx
	jnz label1010
	movq $1, %rax
	jmp label1011
label1010:
	movq $0, %rax
label1011:
	movq %rax, %rdi
	call assertion
	movq -32(%rbp), %rax
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
	movq (%rax,%rbx,8), %rcx
	movq %rcx, %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label1012
	movq $1, %rax
	jmp label1013
label1012:
	movq $0, %rax
label1013:
	movq %rax, %rdi
	call assertion
	movq -32(%rbp), %rax
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
	movq $1, %rbx
	incq %rbx
	movq (%rax,%rbx,8), %rcx
	movq %rcx, %rax
	movq $2, %rbx
	cmpq %rax, %rbx
	jnz label1014
	movq $1, %rax
	jmp label1015
label1014:
	movq $0, %rax
label1015:
	movq %rax, %rdi
	call assertion
	movq -32(%rbp), %rax
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
	movq $2, %rbx
	incq %rbx
	movq (%rax,%rbx,8), %rcx
	movq %rcx, %rax
	movq $3, %rbx
	cmpq %rax, %rbx
	jnz label1016
	movq $1, %rax
	jmp label1017
label1016:
	movq $0, %rax
label1017:
	movq %rax, %rdi
	call assertion
label1005:
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
