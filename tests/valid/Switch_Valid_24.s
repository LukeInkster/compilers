
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	leaq str0(%rip), %rbx
	cmpq %rax, %rbx
	jnz label876
label874:
	movq $0, %rbx
	movq %rbx, 16(%rbp)
	jmp label872
	jmp label875
label876:
	leaq str1(%rip), %rbx
	cmpq %rax, %rbx
	jnz label878
label875:
	movq $1, %rbx
	movq %rbx, 16(%rbp)
	jmp label872
	jmp label877
label878:
	leaq str2(%rip), %rbx
	cmpq %rax, %rbx
	jnz label880
label877:
	movq $2, %rbx
	movq %rbx, 16(%rbp)
	jmp label872
label880:
label873:
	movq $3, %rax
	movq %rax, 16(%rbp)
	jmp label872
label872:
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
	jnz label883
	movq $1, %rax
	jmp label884
label883:
	movq $0, %rax
label884:
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
	jnz label885
	movq $1, %rax
	jmp label886
label885:
	movq $0, %rax
label886:
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
	jnz label887
	movq $1, %rax
	jmp label888
label887:
	movq $0, %rax
label888:
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
	jnz label889
	movq $1, %rax
	jmp label890
label889:
	movq $0, %rax
label890:
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
	jnz label891
	movq $1, %rax
	jmp label892
label891:
	movq $0, %rax
label892:
	movq %rax, %rdi
	call assertion
label882:
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
