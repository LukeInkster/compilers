
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
	movq %rsp, %rax
	addq $16, %rsp
	movq 0(%rax), %rax
	movq -8(%rbp), %rbx
	cmpq %rax, %rbx
	jnz label562
	jmp label560
label562:
	movq $1, %rax
	jmp label561
label560:
	movq $0, %rax
label561:
	movq %rax, %rdi
	call assertion
	movq -8(%rbp), %rax
	movq %rax, -16(%rbp)
	subq $16, %rsp
	movq -16(%rbp), %rax
	movq %rax, 0(%rsp)
	movq %rsp, %rax
	addq $16, %rsp
	movq 0(%rax), %rax
	movq -8(%rbp), %rbx
	cmpq %rax, %rbx
	jnz label563
	movq $1, %rax
	jmp label564
label563:
	movq $0, %rax
label564:
	movq %rax, %rdi
	call assertion
label559:
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
