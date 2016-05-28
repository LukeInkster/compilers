
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq 24(%rbp), %rax
	movq $78, %rbx
	cmpq %rax, %rbx
	jnz label822
label820:
	leaq str0(%rip), %rbx
	movq %rbx, -8(%rbp)
	jmp label819
	jmp label821
label822:
	movq $66, %rbx
	cmpq %rax, %rbx
	jnz label824
label821:
	leaq str1(%rip), %rbx
	movq %rbx, -8(%rbp)
	jmp label819
	jmp label823
label824:
	movq $82, %rbx
	cmpq %rax, %rbx
	jnz label826
label823:
	leaq str2(%rip), %rbx
	movq %rbx, -8(%rbp)
	jmp label819
	jmp label825
label826:
	movq $81, %rbx
	cmpq %rax, %rbx
	jnz label828
label825:
	leaq str3(%rip), %rbx
	movq %rbx, -8(%rbp)
	jmp label819
	jmp label827
label828:
	movq $75, %rbx
	cmpq %rax, %rbx
	jnz label830
label827:
	leaq str4(%rip), %rbx
	movq %rbx, -8(%rbp)
	jmp label819
	jmp label829
label830:
label829:
	leaq str5(%rip), %rbx
	movq %rbx, -8(%rbp)
	jmp label819
label832:
label819:
	movq -8(%rbp), %rax
	movq %rax, 16(%rbp)
	jmp label818
label818:
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
	jnz label835
	movq $1, %rax
	jmp label836
label835:
	movq $0, %rax
label836:
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
	jnz label837
	movq $1, %rax
	jmp label838
label837:
	movq $0, %rax
label838:
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
	jnz label839
	movq $1, %rax
	jmp label840
label839:
	movq $0, %rax
label840:
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
	jnz label841
	movq $1, %rax
	jmp label842
label841:
	movq $0, %rax
label842:
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
	jnz label843
	movq $1, %rax
	jmp label844
label843:
	movq $0, %rax
label844:
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
	jnz label845
	movq $1, %rax
	jmp label846
label845:
	movq $0, %rax
label846:
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
	jnz label847
	movq $1, %rax
	jmp label848
label847:
	movq $0, %rax
label848:
	movq %rax, %rdi
	call assertion
label834:
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
