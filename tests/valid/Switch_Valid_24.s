
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	leaq str0(%rip), %rbx
	cmpq %rax, %rbx
	jnz label860
label858:
	movq $0, %rbx
	movq %rbx, 16(%rbp)
	jmp label856
	jmp label859
label860:
	leaq str1(%rip), %rbx
	cmpq %rax, %rbx
	jnz label862
label859:
	movq $1, %rbx
	movq %rbx, 16(%rbp)
	jmp label856
	jmp label861
label862:
	leaq str2(%rip), %rbx
	cmpq %rax, %rbx
	jnz label864
label861:
	movq $2, %rbx
	movq %rbx, 16(%rbp)
	jmp label856
label864:
label857:
	movq $3, %rax
	movq %rax, 16(%rbp)
	jmp label856
label856:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	movq $3, %rax
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
	jnz label867
	movq $1, %rax
	jmp label868
label867:
	movq $0, %rax
label868:
	movq %rax, %rdi
	call assertion
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
	jnz label869
	movq $1, %rax
	jmp label870
label869:
	movq $0, %rax
label870:
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
	jnz label871
	movq $1, %rax
	jmp label872
label871:
	movq $0, %rax
label872:
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
	jnz label873
	movq $1, %rax
	jmp label874
label873:
	movq $0, %rax
label874:
	movq %rax, %rdi
	call assertion
	movq $3, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	leaq str4(%rip), %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label875
	movq $1, %rax
	jmp label876
label875:
	movq $0, %rax
label876:
	movq %rax, %rdi
	call assertion
label866:
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
	.asciz "ZERO"
str1:
	.asciz "ONE"
str2:
	.asciz "TWO"
str3:
	.asciz "SOMETHING"
str4:
	.asciz "THREE"
