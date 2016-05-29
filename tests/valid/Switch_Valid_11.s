
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	leaq str0(%rip), %rbx
	cmpq %rax, %rbx
	jnz label622
label620:
	movq $0, %rbx
	movq %rbx, 16(%rbp)
	jmp label618
	jmp label621
label622:
	leaq str1(%rip), %rbx
	cmpq %rax, %rbx
	jnz label624
label621:
	movq $1, %rbx
	movq %rbx, 16(%rbp)
	jmp label618
	jmp label623
label624:
	leaq str2(%rip), %rbx
	cmpq %rax, %rbx
	jnz label626
label623:
	movq $2, %rbx
	movq %rbx, 16(%rbp)
	jmp label618
label626:
label619:
	movq $-1, %rax
	movq %rax, 16(%rbp)
	jmp label618
label618:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	movq $0, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	leaq str0(%rip), %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label629
	movq $1, %rax
	jmp label630
label629:
	movq $0, %rax
label630:
	movq %rax, %rdi
	call assertion
	movq $1, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	leaq str1(%rip), %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label631
	movq $1, %rax
	jmp label632
label631:
	movq $0, %rax
label632:
	movq %rax, %rdi
	call assertion
	movq $2, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	leaq str2(%rip), %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label633
	movq $1, %rax
	jmp label634
label633:
	movq $0, %rax
label634:
	movq %rax, %rdi
	call assertion
	movq $-1, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	leaq str3(%rip), %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label635
	movq $1, %rax
	jmp label636
label635:
	movq $0, %rax
label636:
	movq %rax, %rdi
	call assertion
label628:
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
	.asciz "Red"
str1:
	.asciz "Blue"
str2:
	.asciz "Green"
str3:
	.asciz "Dave"
