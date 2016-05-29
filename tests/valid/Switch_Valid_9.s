
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label968
label966:
	movq $0, %rbx
	movq %rbx, 16(%rbp)
	jmp label964
	jmp label967
label968:
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label970
label967:
	movq $1, %rbx
	movq %rbx, 16(%rbp)
	jmp label964
label970:
label965:
	movq $3, %rax
	movq %rax, 16(%rbp)
	jmp label964
label964:
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
	jnz label973
	movq $1, %rax
	jmp label974
label973:
	movq $0, %rax
label974:
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
	jnz label975
	movq $1, %rax
	jmp label976
label975:
	movq $0, %rax
label976:
	movq %rax, %rdi
	call assertion
label972:
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
