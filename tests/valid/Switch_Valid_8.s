
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label951
label949:
	movq $123, %rbx
	movq %rbx, 16(%rbp)
	jmp label947
	jmp label950
label951:
	movq $2, %rbx
	cmpq %rax, %rbx
	jnz label953
label950:
	movq $234, %rbx
	movq %rbx, 16(%rbp)
	jmp label947
	jmp label952
label953:
label952:
	movq $456, %rbx
	movq %rbx, 16(%rbp)
	jmp label947
label955:
label948:
label947:
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
	jnz label958
	movq $1, %rax
	jmp label959
label958:
	movq $0, %rax
label959:
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
	jnz label960
	movq $1, %rax
	jmp label961
label960:
	movq $0, %rax
label961:
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
	jnz label962
	movq $1, %rax
	jmp label963
label962:
	movq $0, %rax
label963:
	movq %rax, %rdi
	call assertion
label957:
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
