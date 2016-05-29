
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq 24(%rbp), %rax
	movq $78, %rbx
	cmpq %rax, %rbx
	jnz label920
label918:
	leaq str0(%rip), %rbx
	movq %rbx, -8(%rbp)
	jmp label917
	jmp label919
label920:
	movq $66, %rbx
	cmpq %rax, %rbx
	jnz label922
label919:
	leaq str1(%rip), %rbx
	movq %rbx, -8(%rbp)
	jmp label917
	jmp label921
label922:
	movq $82, %rbx
	cmpq %rax, %rbx
	jnz label924
label921:
	leaq str2(%rip), %rbx
	movq %rbx, -8(%rbp)
	jmp label917
	jmp label923
label924:
	movq $81, %rbx
	cmpq %rax, %rbx
	jnz label926
label923:
	leaq str3(%rip), %rbx
	movq %rbx, -8(%rbp)
	jmp label917
	jmp label925
label926:
	movq $75, %rbx
	cmpq %rax, %rbx
	jnz label928
label925:
	leaq str4(%rip), %rbx
	movq %rbx, -8(%rbp)
	jmp label917
	jmp label927
label928:
label927:
	leaq str5(%rip), %rbx
	movq %rbx, -8(%rbp)
	jmp label917
label930:
label917:
	movq -8(%rbp), %rax
	movq %rax, 16(%rbp)
	jmp label916
label916:
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
	jnz label933
	movq $1, %rax
	jmp label934
label933:
	movq $0, %rax
label934:
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
	jnz label935
	movq $1, %rax
	jmp label936
label935:
	movq $0, %rax
label936:
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
	jnz label937
	movq $1, %rax
	jmp label938
label937:
	movq $0, %rax
label938:
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
	jnz label939
	movq $1, %rax
	jmp label940
label939:
	movq $0, %rax
label940:
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
	jnz label941
	movq $1, %rax
	jmp label942
label941:
	movq $0, %rax
label942:
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
	jnz label943
	movq $1, %rax
	jmp label944
label943:
	movq $0, %rax
label944:
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
	jnz label945
	movq $1, %rax
	jmp label946
label945:
	movq $0, %rax
label946:
	movq %rax, %rdi
	call assertion
label932:
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
