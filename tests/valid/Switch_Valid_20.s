
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label818
label816:
	jmp label817
label818:
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label820
label817:
	jmp label819
label820:
	movq $2, %rbx
	cmpq %rax, %rbx
	jnz label822
label819:
	movq 24(%rbp), %rcx
	movq $0, %rdx
	cmpq %rcx, %rdx
	jnz label823
	jmp label815
	jmp label823
label823:
	jmp label821
label822:
label821:
	movq 24(%rbp), %rcx
	movq $1, %rdx
	addq %rdx, %rcx
	movq %rcx, 24(%rbp)
label825:
label815:
	movq 24(%rbp), %rax
	movq %rax, 16(%rbp)
	jmp label814
label814:
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
	jnz label828
	movq $1, %rax
	jmp label829
label828:
	movq $0, %rax
label829:
	movq %rax, %rdi
	call assertion
	movq $2, %rax
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
	jnz label830
	movq $1, %rax
	jmp label831
label830:
	movq $0, %rax
label831:
	movq %rax, %rdi
	call assertion
	movq $3, %rax
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
	jnz label832
	movq $1, %rax
	jmp label833
label832:
	movq $0, %rax
label833:
	movq %rax, %rdi
	call assertion
label827:
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
