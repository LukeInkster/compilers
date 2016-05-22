
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
	jnz label477
	jmp label475
label477:
	movq $1, %rax
	jmp label476
label475:
	movq $0, %rax
label476:
	movq %rax, %rdi
	call assertion
	subq $16, %rsp
	movq -16(%rbp), %rax
	movq %rax, 0(%rsp)
	movq -8(%rbp), %rax
	movq %rax, 0(%rsp)
	subq $16, %rsp
	movq -16(%rbp), %rax
	movq %rax, 0(%rsp)
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -8(%rbp), %rbx
	cmpq %rax, %rbx
	jnz label478
	movq $1, %rax
	jmp label479
label478:
	movq $0, %rax
label479:
	movq %rax, %rdi
	call assertion
label474:
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
