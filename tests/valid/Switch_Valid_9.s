
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label911
label909:
	movq $0, %rbx
	movq %rbx, 16(%rbp)
	jmp label907
	jmp label910
label911:
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label913
label910:
	movq $1, %rbx
	movq %rbx, 16(%rbp)
	jmp label907
label913:
label908:
	movq $3, %rax
	movq %rax, 16(%rbp)
	jmp label907
label907:
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
	movq $1, %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label916
	movq $1, %rax
	jmp label917
label916:
	movq $0, %rax
label917:
	movq %rax, %rdi
	call assertion
	movq $1, %rax
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
	jnz label918
	movq $1, %rax
	jmp label919
label918:
	movq $0, %rax
label919:
	movq %rax, %rdi
	call assertion
label915:
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
