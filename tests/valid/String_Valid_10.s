
	.text
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	leaq str0(%rip), %rax
	movq %rax, -8(%rbp)
	leaq str1(%rip), %rax
	movq %rax, -16(%rbp)
	subq $16, %rsp
	movq -16(%rbp), %rax
	movq %rax, 0(%rsp)
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -8(%rbp), %rbx
	cmpq %rax, %rbx
	jnz label503
	jmp label501
label503:
	movq $1, %rax
	jmp label502
label501:
	movq $0, %rax
label502:
	movq %rax, %rdi
	call assertion
	movq -8(%rbp), %rax
	movq %rax, -16(%rbp)
	subq $16, %rsp
	movq -16(%rbp), %rax
	movq %rax, 0(%rsp)
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -8(%rbp), %rbx
	cmpq %rax, %rbx
	jnz label504
	movq $1, %rax
	jmp label505
label504:
	movq $0, %rax
label505:
	movq %rax, %rdi
	call assertion
label500:
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
	.asciz "Hello World"
str1:
	.asciz "blah"
