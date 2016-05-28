
	.text
wl_len:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	movq %rax, 16(%rbp)
	jmp label40
label40:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq $32, %rbp
	movq %rbp, %rdi
	call malloc
	movq %rax, %rbp
	movq -8(%rbp), %rbx
	movq $3, %rax
	movq %rax, 0(%rbx)
	movq $1, %rax
	movq %rax, 8(%rbx)
	movq $2, %rax
	movq %rax, 16(%rbx)
	movq $3, %rax
	movq %rax, 24(%rbx)
	subq $16, %rsp
	movq -8(%rbp), %rax
	movq %rax, 8(%rsp)
	call wl_len
	addq $16, %rsp
	movq -16(%rsp), %rax
	movq $3, %rbx
	cmpq %rax, %rbx
	jnz label42
	movq $1, %rax
	jmp label43
label42:
	movq $0, %rax
label43:
	movq %rax, %rdi
	call assertion
	movq $56, %rbp
	movq %rbp, %rdi
	call malloc
	movq %rax, %rbp
	movq -8(%rbp), %rbx
	movq $6, %rax
	movq %rax, 0(%rbx)
	movq $1, %rax
	movq %rax, 8(%rbx)
	movq $2, %rax
	movq %rax, 16(%rbx)
	movq $3, %rax
	movq %rax, 24(%rbx)
	movq $4, %rax
	movq %rax, 32(%rbx)
	movq $5, %rax
	movq %rax, 40(%rbx)
	movq $6, %rax
	movq %rax, 48(%rbx)
	subq $16, %rsp
	movq -8(%rbp), %rax
	movq %rax, 8(%rsp)
	call wl_len
	addq $16, %rsp
	movq -16(%rsp), %rax
	movq $6, %rbx
	cmpq %rax, %rbx
	jnz label44
	movq $1, %rax
	jmp label45
label44:
	movq $0, %rax
label45:
	movq %rax, %rdi
	call assertion
label41:
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
