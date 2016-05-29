
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
	jnz label557
	jmp label555
label557:
	movq $1, %rax
	jmp label556
label555:
	movq $0, %rax
label556:
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
	jnz label558
	movq $1, %rax
	jmp label559
label558:
	movq $0, %rax
label559:
	movq %rax, %rdi
	call assertion
label554:
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
