
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	movq $114, %rbx
	cmpq %rax, %rbx
	jnz label634
label632:
	leaq str0(%rip), %rbx
	movq %rbx, 16(%rbp)
	jmp label630
	jmp label633
label634:
	movq $98, %rbx
	cmpq %rax, %rbx
	jnz label636
label633:
	leaq str1(%rip), %rbx
	movq %rbx, 16(%rbp)
	jmp label630
	jmp label635
label636:
	movq $103, %rbx
	cmpq %rax, %rbx
	jnz label638
label635:
	leaq str2(%rip), %rbx
	movq %rbx, 16(%rbp)
	jmp label630
label638:
label631:
	leaq str3(%rip), %rax
	movq %rax, 16(%rbp)
	jmp label630
label630:
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
	jnz label641
	movq $1, %rax
	jmp label642
label641:
	movq $0, %rax
label642:
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
	jnz label643
	movq $1, %rax
	jmp label644
label643:
	movq $0, %rax
label644:
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
	jnz label645
	movq $1, %rax
	jmp label646
label645:
	movq $0, %rax
label646:
	movq %rax, %rdi
	call assertion
label640:
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
