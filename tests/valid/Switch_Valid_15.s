
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	movq $114, %rbx
	cmpq %rax, %rbx
	jnz label567
	leaq str0(%rip), %rbx
	movq %rbx, 16(%rbp)
	jmp label565
label567:
	movq $98, %rbx
	cmpq %rax, %rbx
	jnz label568
	leaq str1(%rip), %rbx
	movq %rbx, 16(%rbp)
	jmp label565
label568:
	movq $103, %rbx
	cmpq %rax, %rbx
	jnz label569
	leaq str2(%rip), %rbx
	movq %rbx, 16(%rbp)
	jmp label565
label569:
label566:
	leaq str3(%rip), %rax
	movq %rax, 16(%rbp)
	jmp label565
label565:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	leaq str0(%rip), %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	movq $114, %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label571
	movq $1, %rax
	jmp label572
label571:
	movq $0, %rax
label572:
	movq %rax, %rdi
	call assertion
	leaq str2(%rip), %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	movq $103, %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label573
	movq $1, %rax
	jmp label574
label573:
	movq $0, %rax
label574:
	movq %rax, %rdi
	call assertion
	leaq str1(%rip), %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	movq $98, %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label575
	movq $1, %rax
	jmp label576
label575:
	movq $0, %rax
label576:
	movq %rax, %rdi
	call assertion
label570:
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
	.asciz "RED"
str1:
	.asciz "BLUE"
str2:
	.asciz "GREEN"
str3:
	.asciz ""
