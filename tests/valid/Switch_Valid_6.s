
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq 24(%rbp), %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label901
label899:
	movq $-1, %rbx
	movq %rbx, -8(%rbp)
	jmp label898
	jmp label900
label901:
	movq $2, %rbx
	cmpq %rax, %rbx
	jnz label903
label900:
	movq $-2, %rbx
	movq %rbx, -8(%rbp)
	jmp label898
	jmp label902
label903:
label902:
	movq $0, %rbx
	movq %rbx, -8(%rbp)
label905:
label898:
	movq -8(%rbp), %rax
	movq %rax, 16(%rbp)
	jmp label897
label897:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	movq $-1, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	movq $1, %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label908
	movq $1, %rax
	jmp label909
label908:
	movq $0, %rax
label909:
	movq %rax, %rdi
	call assertion
	movq $-2, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	movq $2, %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label910
	movq $1, %rax
	jmp label911
label910:
	movq $0, %rax
label911:
	movq %rax, %rdi
	call assertion
	movq $0, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	movq $3, %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label912
	movq $1, %rax
	jmp label913
label912:
	movq $0, %rax
label913:
	movq %rax, %rdi
	call assertion
	movq $0, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	movq $-1, %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label914
	movq $1, %rax
	jmp label915
label914:
	movq $0, %rax
label915:
	movq %rax, %rdi
	call assertion
label907:
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
