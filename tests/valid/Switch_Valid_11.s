
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	leaq str0(%rip), %rbx
	cmpq %rax, %rbx
	jnz label542
label540:
	movq $0, %rbx
	movq %rbx, 16(%rbp)
	jmp label538
	jmp label541
label542:
	leaq str1(%rip), %rbx
	cmpq %rax, %rbx
	jnz label544
label541:
	movq $1, %rbx
	movq %rbx, 16(%rbp)
	jmp label538
	jmp label543
label544:
	leaq str2(%rip), %rbx
	cmpq %rax, %rbx
	jnz label546
label543:
	movq $2, %rbx
	movq %rbx, 16(%rbp)
	jmp label538
label546:
label539:
	movq $-1, %rax
	movq %rax, 16(%rbp)
	jmp label538
label538:
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
	jnz label549
	movq $1, %rax
	jmp label550
label549:
	movq $0, %rax
label550:
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
	jnz label551
	movq $1, %rax
	jmp label552
label551:
	movq $0, %rax
label552:
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
	jnz label553
	movq $1, %rax
	jmp label554
label553:
	movq $0, %rax
label554:
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
	jnz label555
	movq $1, %rax
	jmp label556
label555:
	movq $0, %rax
label556:
	movq %rax, %rdi
	call assertion
label548:
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
