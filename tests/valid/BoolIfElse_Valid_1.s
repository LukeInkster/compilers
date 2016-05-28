
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	cmpq $0, %rax
	jz label92
	leaq str0(%rip), %rax
	movq %rax, 16(%rbp)
	jmp label90
	jmp label91
label92:
	leaq str1(%rip), %rax
	movq %rax, 16(%rbp)
	jmp label90
label91:
label90:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq $1, %rax
	movq %rax, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq -16(%rsp), %rax
	leaq str0(%rip), %rbx
	cmpq %rax, %rbx
	jnz label94
	movq $1, %rax
	jmp label95
label94:
	movq $0, %rax
label95:
	movq %rax, %rdi
	call assertion
	subq $16, %rsp
	movq $0, %rax
	movq %rax, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq -16(%rsp), %rax
	leaq str1(%rip), %rbx
	cmpq %rax, %rbx
	jnz label96
	movq $1, %rax
	jmp label97
label96:
	movq $0, %rax
label97:
	movq %rax, %rdi
	call assertion
label93:
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
str0:
	.asciz "TRUE"
str1:
	.asciz "FALSE"
