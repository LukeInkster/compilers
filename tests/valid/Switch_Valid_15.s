
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	movq $114, %rbx
	cmpq %rax, %rbx
	jnz label667
label665:
	leaq str0(%rip), %rbx
	movq %rbx, 16(%rbp)
	jmp label663
	jmp label666
label667:
	movq $98, %rbx
	cmpq %rax, %rbx
	jnz label669
label666:
	leaq str1(%rip), %rbx
	movq %rbx, 16(%rbp)
	jmp label663
	jmp label668
label669:
	movq $103, %rbx
	cmpq %rax, %rbx
	jnz label671
label668:
	leaq str2(%rip), %rbx
	movq %rbx, 16(%rbp)
	jmp label663
label671:
label664:
	leaq str3(%rip), %rax
	movq %rax, 16(%rbp)
	jmp label663
label663:
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
	jnz label674
	movq $1, %rax
	jmp label675
label674:
	movq $0, %rax
label675:
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
	jnz label676
	movq $1, %rax
	jmp label677
label676:
	movq $0, %rax
label677:
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
	jnz label678
	movq $1, %rax
	jmp label679
label678:
	movq $0, %rax
label679:
	movq %rax, %rdi
	call assertion
label673:
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
