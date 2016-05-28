
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq 24(%rbp), %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label803
label801:
	movq $-1, %rbx
	movq %rbx, -8(%rbp)
	jmp label800
	jmp label802
label803:
	movq $2, %rbx
	cmpq %rax, %rbx
	jnz label805
label802:
	movq $-2, %rbx
	movq %rbx, -8(%rbp)
	jmp label800
	jmp label804
label805:
label804:
	movq $0, %rbx
	movq %rbx, -8(%rbp)
label807:
label800:
	movq -8(%rbp), %rax
	movq %rax, 16(%rbp)
	jmp label799
label799:
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
	jnz label810
	movq $1, %rax
	jmp label811
label810:
	movq $0, %rax
label811:
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
	jnz label812
	movq $1, %rax
	jmp label813
label812:
	movq $0, %rax
label813:
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
	jnz label814
	movq $1, %rax
	jmp label815
label814:
	movq $0, %rax
label815:
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
	jnz label816
	movq $1, %rax
	jmp label817
label816:
	movq $0, %rax
label817:
	movq %rax, %rdi
	call assertion
label809:
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
