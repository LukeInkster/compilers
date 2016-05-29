
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq 24(%rbp), %rax
	movq $78, %rbx
	cmpq %rax, %rbx
	jnz label948
label946:
	leaq str0(%rip), %rbx
	movq %rbx, -8(%rbp)
	jmp label945
	jmp label947
label948:
	movq $66, %rbx
	cmpq %rax, %rbx
	jnz label950
label947:
	leaq str1(%rip), %rbx
	movq %rbx, -8(%rbp)
	jmp label945
	jmp label949
label950:
	movq $82, %rbx
	cmpq %rax, %rbx
	jnz label952
label949:
	leaq str2(%rip), %rbx
	movq %rbx, -8(%rbp)
	jmp label945
	jmp label951
label952:
	movq $81, %rbx
	cmpq %rax, %rbx
	jnz label954
label951:
	leaq str3(%rip), %rbx
	movq %rbx, -8(%rbp)
	jmp label945
	jmp label953
label954:
	movq $75, %rbx
	cmpq %rax, %rbx
	jnz label956
label953:
	leaq str4(%rip), %rbx
	movq %rbx, -8(%rbp)
	jmp label945
	jmp label955
label956:
label955:
	leaq str5(%rip), %rbx
	movq %rbx, -8(%rbp)
	jmp label945
label958:
label945:
	movq -8(%rbp), %rax
	movq %rax, 16(%rbp)
	jmp label944
label944:
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
	jnz label961
	movq $1, %rax
	jmp label962
label961:
	movq $0, %rax
label962:
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
	jnz label963
	movq $1, %rax
	jmp label964
label963:
	movq $0, %rax
label964:
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
	jnz label965
	movq $1, %rax
	jmp label966
label965:
	movq $0, %rax
label966:
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
	jnz label967
	movq $1, %rax
	jmp label968
label967:
	movq $0, %rax
label968:
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
	jnz label969
	movq $1, %rax
	jmp label970
label969:
	movq $0, %rax
label970:
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
	jnz label971
	movq $1, %rax
	jmp label972
label971:
	movq $0, %rax
label972:
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
	jnz label973
	movq $1, %rax
	jmp label974
label973:
	movq $0, %rax
label974:
	movq %rax, %rdi
	call assertion
label960:
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
