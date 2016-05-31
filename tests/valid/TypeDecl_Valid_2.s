
	.text
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq $0, %rax
	movq %rax, -16(%rbp)
	movq $1, %rax
	movq %rax, -8(%rbp)
	subq $16, %rsp
	movq -16(%rbp), %rax
	movq %rax, 0(%rsp)
	movq -8(%rbp), %rax
	movq %rax, 8(%rsp)
	movq %rsp, %rax
	addq $16, %rsp
	movq 0(%rax), %rax
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label1024
	movq $1, %rax
	jmp label1025
label1024:
	movq $0, %rax
label1025:
	movq %rax, %rdi
	call assertion
	subq $16, %rsp
	movq -16(%rbp), %rax
	movq %rax, 0(%rsp)
	movq -8(%rbp), %rax
	movq %rax, 8(%rsp)
	movq %rsp, %rax
	addq $16, %rsp
	movq 8(%rax), %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label1026
	movq $1, %rax
	jmp label1027
label1026:
	movq $0, %rax
label1027:
	movq %rax, %rdi
	call assertion
label1023:
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
