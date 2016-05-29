
	.text
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	movq $8, %rax
	movq %rax, %rdi
	call malloc
	movq %rax, %rax
	movq $0, %rbx
	movq %rbx, 0(%rax)
	movq 0(%rax), %rax
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label86
	movq $1, %rax
	jmp label87
label86:
	movq $0, %rax
label87:
	movq %rax, %rdi
	call assertion
	movq $16, %rax
	movq %rax, %rdi
	call malloc
	movq %rax, %rax
	movq $1, %rbx
	movq %rbx, 0(%rax)
	movq $1, %rbx
	movq %rbx, 8(%rax)
	movq 0(%rax), %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label88
	movq $1, %rax
	jmp label89
label88:
	movq $0, %rax
label89:
	movq %rax, %rdi
	call assertion
	movq $24, %rax
	movq %rax, %rdi
	call malloc
	movq %rax, %rax
	movq $2, %rbx
	movq %rbx, 0(%rax)
	movq $1, %rbx
	movq %rbx, 8(%rax)
	movq $2, %rbx
	movq %rbx, 16(%rax)
	movq 0(%rax), %rax
	movq $2, %rbx
	cmpq %rax, %rbx
	jnz label90
	movq $1, %rax
	jmp label91
label90:
	movq $0, %rax
label91:
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
	movq 0(%rax), %rax
	movq $3, %rbx
	cmpq %rax, %rbx
	jnz label92
	movq $1, %rax
	jmp label93
label92:
	movq $0, %rax
label93:
	movq %rax, %rdi
	call assertion
label85:
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
