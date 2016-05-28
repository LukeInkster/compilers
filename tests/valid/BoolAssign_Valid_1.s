
	.text
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq $1, %rax
	movq %rax, -8(%rbp)
	movq -8(%rbp), %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label47
	movq $1, %rax
	jmp label48
label47:
	movq $0, %rax
label48:
	movq %rax, %rdi
	call assertion
	movq $0, %rax
	movq %rax, -8(%rbp)
	movq -8(%rbp), %rax
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label49
	movq $1, %rax
	jmp label50
label49:
	movq $0, %rax
label50:
	movq %rax, %rdi
	call assertion
label46:
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
