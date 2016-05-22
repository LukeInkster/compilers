
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq 24(%rbp), %rax
	movq $78, %rbx
	cmpq %rax, %rbx
	jnz label827
label825:
	leaq str0(%rip), %rbx
	movq %rbx, -8(%rbp)
	jmp label824
	jmp label826
label827:
	movq $66, %rbx
	cmpq %rax, %rbx
	jnz label829
label826:
	leaq str1(%rip), %rbx
	movq %rbx, -8(%rbp)
	jmp label824
	jmp label828
label829:
	movq $82, %rbx
	cmpq %rax, %rbx
	jnz label831
label828:
	leaq str2(%rip), %rbx
	movq %rbx, -8(%rbp)
	jmp label824
	jmp label830
label831:
	movq $81, %rbx
	cmpq %rax, %rbx
	jnz label833
label830:
	leaq str3(%rip), %rbx
	movq %rbx, -8(%rbp)
	jmp label824
	jmp label832
label833:
	movq $75, %rbx
	cmpq %rax, %rbx
	jnz label835
label832:
	leaq str4(%rip), %rbx
	movq %rbx, -8(%rbp)
	jmp label824
	jmp label834
label835:
label834:
	leaq str5(%rip), %rbx
	movq %rbx, -8(%rbp)
	jmp label824
label837:
label824:
	movq -8(%rbp), %rax
	movq %rax, 16(%rbp)
	jmp label823
label823:
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
	movq $78, %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label840
	movq $1, %rax
	jmp label841
label840:
	movq $0, %rax
label841:
	movq %rax, %rdi
	call assertion
	leaq str4(%rip), %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	movq $75, %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label842
	movq $1, %rax
	jmp label843
label842:
	movq $0, %rax
label843:
	movq %rax, %rdi
	call assertion
	leaq str3(%rip), %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	movq $81, %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label844
	movq $1, %rax
	jmp label845
label844:
	movq $0, %rax
label845:
	movq %rax, %rdi
	call assertion
	leaq str1(%rip), %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	movq $66, %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label846
	movq $1, %rax
	jmp label847
label846:
	movq $0, %rax
label847:
	movq %rax, %rdi
	call assertion
	leaq str2(%rip), %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	movq $82, %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label848
	movq $1, %rax
	jmp label849
label848:
	movq $0, %rax
label849:
	movq %rax, %rdi
	call assertion
	leaq str5(%rip), %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	movq $101, %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label850
	movq $1, %rax
	jmp label851
label850:
	movq $0, %rax
label851:
	movq %rax, %rdi
	call assertion
	leaq str5(%rip), %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	movq $49, %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label852
	movq $1, %rax
	jmp label853
label852:
	movq $0, %rax
label853:
	movq %rax, %rdi
	call assertion
label839:
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
	.asciz "KNIGHT"
str1:
	.asciz "BISHOP"
str2:
	.asciz "ROOK"
str3:
	.asciz "QUEEN"
str4:
	.asciz "KING"
str5:
	.asciz "NOTHING"
