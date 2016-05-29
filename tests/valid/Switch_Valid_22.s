
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label817
label815:
	jmp label816
label817:
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label819
label816:
	jmp label818
label819:
	movq $2, %rbx
	cmpq %rax, %rbx
	jnz label821
label818:
	movq 24(%rbp), %rbx
	movq $0, %rcx
	cmpq %rbx, %rcx
	jnz label822
	jmp label814
	jmp label822
label822:
	movq 24(%rbp), %rbx
	movq $1, %rcx
	subq %rcx, %rbx
	movq %rbx, 24(%rbp)
	jmp label814
	jmp label820
label821:
label820:
	movq 24(%rbp), %rbx
	movq $1, %rcx
	addq %rcx, %rbx
	movq %rbx, 24(%rbp)
	jmp label814
label824:
label814:
	movq 24(%rbp), %rax
	movq %rax, 16(%rbp)
	jmp label813
label813:
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
	jnz label827
	movq $1, %rax
	jmp label828
label827:
	movq $0, %rax
label828:
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
	jnz label829
	movq $1, %rax
	jmp label830
label829:
	movq $0, %rax
label830:
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
	jnz label831
	movq $1, %rax
	jmp label832
label831:
	movq $0, %rax
label832:
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
	jnz label833
	movq $1, %rax
	jmp label834
label833:
	movq $0, %rax
label834:
	movq %rax, %rdi
	call assertion
label826:
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
