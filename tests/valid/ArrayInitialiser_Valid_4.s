
	.text
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq $24, %rax
	movq %rax, %rdi
	call malloc
	movq %rax, %rax
	movq %rax, -8(%rbp)
	movq $2, %rbx
	movq %rbx, 0(%rax)
	movq $1, %rbx
	movq %rbx, 8(%rax)
	movq $2, %rbx
	movq %rbx, 16(%rax)
	movq -8(%rbp), %rax
	movq %rax, %rdi
	call prnintn
	movq -8(%rbp), %rax
	movq $2, %rbx
	cmpq %rax, %rbx
	jnz label15
	movq $1, %rax
	jmp label16
label15:
	movq $0, %rax
label16:
	movq %rax, %rdi
	call assertion
label14:
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