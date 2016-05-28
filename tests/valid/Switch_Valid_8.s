
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label853
label851:
	movq $123, %rbx
	movq %rbx, 16(%rbp)
	jmp label849
	jmp label852
label853:
	movq $2, %rbx
	cmpq %rax, %rbx
	jnz label855
label852:
	movq $234, %rbx
	movq %rbx, 16(%rbp)
	jmp label849
	jmp label854
label855:
label854:
	movq $456, %rbx
	movq %rbx, 16(%rbp)
	jmp label849
label857:
label850:
label849:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	movq $123, %rax
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
	jnz label860
	movq $1, %rax
	jmp label861
label860:
	movq $0, %rax
label861:
	movq %rax, %rdi
	call assertion
	movq $234, %rax
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
	jnz label862
	movq $1, %rax
	jmp label863
label862:
	movq $0, %rax
label863:
	movq %rax, %rdi
	call assertion
	movq $456, %rax
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
	jnz label864
	movq $1, %rax
	jmp label865
label864:
	movq $0, %rax
label865:
	movq %rax, %rdi
	call assertion
label859:
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
