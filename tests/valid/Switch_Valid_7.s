
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq 24(%rbp), %rax
	movq $78, %rbx
	cmpq %rax, %rbx
	jnz label953
label951:
	leaq str0(%rip), %rcx
	movq %rcx, -8(%rbp)
	jmp label950
	jmp label952
label953:
	movq $66, %rbx
	cmpq %rax, %rbx
	jnz label955
label952:
	leaq str1(%rip), %rcx
	movq %rcx, -8(%rbp)
	jmp label950
	jmp label954
label955:
	movq $82, %rbx
	cmpq %rax, %rbx
	jnz label957
label954:
	leaq str2(%rip), %rcx
	movq %rcx, -8(%rbp)
	jmp label950
	jmp label956
label957:
	movq $81, %rbx
	cmpq %rax, %rbx
	jnz label959
label956:
	leaq str3(%rip), %rcx
	movq %rcx, -8(%rbp)
	jmp label950
	jmp label958
label959:
	movq $75, %rbx
	cmpq %rax, %rbx
	jnz label961
label958:
	leaq str4(%rip), %rcx
	movq %rcx, -8(%rbp)
	jmp label950
	jmp label960
label961:
label960:
	leaq str5(%rip), %rcx
	movq %rcx, -8(%rbp)
	jmp label950
label963:
label950:
	movq -8(%rbp), %rax
	movq %rax, 16(%rbp)
	jmp label949
label949:
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
	jnz label966
	movq $1, %rax
	jmp label967
label966:
	movq $0, %rax
label967:
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
	jnz label968
	movq $1, %rax
	jmp label969
label968:
	movq $0, %rax
label969:
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
	jnz label970
	movq $1, %rax
	jmp label971
label970:
	movq $0, %rax
label971:
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
	jnz label972
	movq $1, %rax
	jmp label973
label972:
	movq $0, %rax
label973:
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
	jnz label974
	movq $1, %rax
	jmp label975
label974:
	movq $0, %rax
label975:
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
	jnz label976
	movq $1, %rax
	jmp label977
label976:
	movq $0, %rax
label977:
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
	jnz label978
	movq $1, %rax
	jmp label979
label978:
	movq $0, %rax
label979:
	movq %rax, %rdi
	call assertion
label965:
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
