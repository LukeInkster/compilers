
	.text
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq $1, %rax
	movq %rax, -8(%rbp)
	movq $0, %rax
	movq %rax, -16(%rbp)
	movq -8(%rbp), %rax
	cmpq $0, %rax
	jz label52
	movq -16(%rbp), %rax
	cmpq $0, %rax
	jz label52
	movq $1, %rax
	jmp label53
label52:
	movq $0, %rax
label53:
	movq %rax, -8(%rbp)
	movq -8(%rbp), %rax
	notq %rax
	andq $1, %rax
	movq %rax, %rdi
	call assertion
label51:
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
