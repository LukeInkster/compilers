
	.text
wl_f1:
	pushq %rbp
	movq %rsp, %rbp
	leaq str0(%rip), %rax
	movq %rax, 16(%rbp)
	jmp label435
label435:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_f2:
	pushq %rbp
	movq %rsp, %rbp
	leaq str1(%rip), %rax
	movq %rax, 16(%rbp)
	jmp label436
label436:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq $1, %rax
	movq %rax, 8(%rsp)
	call wl_f2
	addq $16, %rsp
	movq -16(%rsp), %rax
	leaq str1(%rip), %rbx
	cmpq %rax, %rbx
	jnz label438
	movq $1, %rax
	jmp label439
label438:
	movq $0, %rax
label439:
	movq %rax, %rdi
	call assertion
	subq $16, %rsp
	movq $0, %rax
	movq %rax, 8(%rsp)
	call wl_f1
	addq $16, %rsp
	movq -16(%rsp), %rax
	leaq str0(%rip), %rbx
	cmpq %rax, %rbx
	jnz label440
	movq $1, %rax
	jmp label441
label440:
	movq $0, %rax
label441:
	movq %rax, %rdi
	call assertion
label437:
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
	.asciz "GOT BOOL"
str1:
	.asciz "GOT INT"
