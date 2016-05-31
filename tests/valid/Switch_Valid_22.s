
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label838
label836:
	jmp label837
label838:
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label840
label837:
	jmp label839
label840:
	movq $2, %rbx
	cmpq %rax, %rbx
	jnz label842
label839:
	movq 24(%rbp), %rcx
	movq $0, %rdx
	cmpq %rcx, %rdx
	jnz label843
	jmp label835
	jmp label843
label843:
	movq 24(%rbp), %rcx
	movq $1, %rdx
	subq %rdx, %rcx
	movq %rcx, 24(%rbp)
	jmp label835
	jmp label841
label842:
label841:
	movq 24(%rbp), %rcx
	movq $1, %rdx
	addq %rdx, %rcx
	movq %rcx, 24(%rbp)
	jmp label835
label845:
label835:
	movq 24(%rbp), %rax
	movq %rax, 16(%rbp)
	jmp label834
label834:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	movq $0, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	movq $0, %rbx
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
	movq $0, %rax
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
	jnz label850
	movq $1, %rax
	jmp label851
label850:
	movq $0, %rax
label851:
	movq %rax, %rdi
	call assertion
	movq $1, %rax
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
	jnz label852
	movq $1, %rax
	jmp label853
label852:
	movq $0, %rax
label853:
	movq %rax, %rdi
	call assertion
	movq $4, %rax
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
	jnz label854
	movq $1, %rax
	jmp label855
label854:
	movq $0, %rax
label855:
	movq %rax, %rdi
	call assertion
label847:
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
