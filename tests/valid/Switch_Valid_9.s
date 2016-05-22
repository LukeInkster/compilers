
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label875
label873:
	movq $0, %rbx
	movq %rbx, 16(%rbp)
	jmp label871
	jmp label874
label875:
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label877
label874:
	movq $1, %rbx
	movq %rbx, 16(%rbp)
	jmp label871
label877:
label872:
	movq $3, %rax
	movq %rax, 16(%rbp)
	jmp label871
label871:
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
	jnz label880
	movq $1, %rax
	jmp label881
label880:
	movq $0, %rax
label881:
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
	jnz label882
	movq $1, %rax
	jmp label883
label882:
	movq $0, %rax
label883:
	movq %rax, %rdi
	call assertion
label879:
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
