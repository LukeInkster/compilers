
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
	jz label106
	movq -16(%rbp), %rax
	cmpq $0, %rax
	jz label106
	movq $1, %rax
	jmp label107
label106:
	movq $0, %rax
label107:
	movq %rax, -8(%rbp)
	movq -8(%rbp), %rax
	notq %rax
	andq $1, %rax
	movq %rax, %rdi
	call assertion
label105:
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
