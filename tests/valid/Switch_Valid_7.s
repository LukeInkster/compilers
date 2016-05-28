
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq 24(%rbp), %rax
	movq $78, %rbx
	cmpq %rax, %rbx
	jnz label863
label861:
	leaq str0(%rip), %rbx
	movq %rbx, -8(%rbp)
	jmp label860
	jmp label862
label863:
	movq $66, %rbx
	cmpq %rax, %rbx
	jnz label865
label862:
	leaq str1(%rip), %rbx
	movq %rbx, -8(%rbp)
	jmp label860
	jmp label864
label865:
	movq $82, %rbx
	cmpq %rax, %rbx
	jnz label867
label864:
	leaq str2(%rip), %rbx
	movq %rbx, -8(%rbp)
	jmp label860
	jmp label866
label867:
	movq $81, %rbx
	cmpq %rax, %rbx
	jnz label869
label866:
	leaq str3(%rip), %rbx
	movq %rbx, -8(%rbp)
	jmp label860
	jmp label868
label869:
	movq $75, %rbx
	cmpq %rax, %rbx
	jnz label871
label868:
	leaq str4(%rip), %rbx
	movq %rbx, -8(%rbp)
	jmp label860
	jmp label870
label871:
label870:
	leaq str5(%rip), %rbx
	movq %rbx, -8(%rbp)
	jmp label860
label873:
label860:
	movq -8(%rbp), %rax
	movq %rax, 16(%rbp)
	jmp label859
label859:
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
	jnz label876
	movq $1, %rax
	jmp label877
label876:
	movq $0, %rax
label877:
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
	jnz label878
	movq $1, %rax
	jmp label879
label878:
	movq $0, %rax
label879:
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
	jnz label880
	movq $1, %rax
	jmp label881
label880:
	movq $0, %rax
label881:
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
	jnz label882
	movq $1, %rax
	jmp label883
label882:
	movq $0, %rax
label883:
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
	jnz label884
	movq $1, %rax
	jmp label885
label884:
	movq $0, %rax
label885:
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
	jnz label886
	movq $1, %rax
	jmp label887
label886:
	movq $0, %rax
label887:
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
	jnz label888
	movq $1, %rax
	jmp label889
label888:
	movq $0, %rax
label889:
	movq %rax, %rdi
	call assertion
label875:
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
