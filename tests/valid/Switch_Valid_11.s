
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	leaq str0(%rip), %rbx
	cmpq %rax, %rbx
	jnz label537
label535:
	movq $0, %rbx
	movq %rbx, 16(%rbp)
	jmp label533
	jmp label536
label537:
	leaq str1(%rip), %rbx
	cmpq %rax, %rbx
	jnz label539
label536:
	movq $1, %rbx
	movq %rbx, 16(%rbp)
	jmp label533
	jmp label538
label539:
	leaq str2(%rip), %rbx
	cmpq %rax, %rbx
	jnz label541
label538:
	movq $2, %rbx
	movq %rbx, 16(%rbp)
	jmp label533
label541:
label534:
	movq $-1, %rax
	movq %rax, 16(%rbp)
	jmp label533
label533:
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
	jnz label544
	movq $1, %rax
	jmp label545
label544:
	movq $0, %rax
label545:
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
	jnz label546
	movq $1, %rax
	jmp label547
label546:
	movq $0, %rax
label547:
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
	jnz label548
	movq $1, %rax
	jmp label549
label548:
	movq $0, %rax
label549:
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
	jnz label550
	movq $1, %rax
	jmp label551
label550:
	movq $0, %rax
label551:
	movq %rax, %rdi
	call assertion
label543:
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
