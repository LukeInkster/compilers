
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq $0, %rax
	movq %rax, -16(%rbp)
	movq $0, %rax
	movq %rax, -8(%rbp)
label934:
	movq -8(%rbp), %rax
	movq $10, %rbx
	cmpq %rbx, %rax
	jge label935
	movq -16(%rbp), %rax
	movq $1, %rbx
	addq %rbx, %rax
	movq %rax, -16(%rbp)
	movq $1, %rax
	cmpq $0, %rax
	jz label937
	jmp label935
	jmp label937
label937:
	movq -16(%rbp), %rax
	movq $1, %rbx
	addq %rbx, %rax
	movq %rax, -16(%rbp)
label936:
	movq -8(%rbp), %rax
	movq $1, %rbx
	addq %rbx, %rax
	movq %rax, -8(%rbp)
	jmp label934
label935:
	movq -16(%rbp), %rax
	movq %rax, 16(%rbp)
	jmp label933
label933:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	movq $1, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label939
	movq $1, %rax
	jmp label940
label939:
	movq $0, %rax
label940:
	movq %rax, %rdi
	call assertion
label938:
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
