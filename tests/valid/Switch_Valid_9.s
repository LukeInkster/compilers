
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label996
label994:
	movq $0, %rbx
	movq %rbx, 16(%rbp)
	jmp label992
	jmp label995
label996:
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label998
label995:
	movq $1, %rbx
	movq %rbx, 16(%rbp)
	jmp label992
label998:
label993:
	movq $3, %rax
	movq %rax, 16(%rbp)
	jmp label992
label992:
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
	jnz label1001
	movq $1, %rax
	jmp label1002
label1001:
	movq $0, %rax
label1002:
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
	jnz label1003
	movq $1, %rax
	jmp label1004
label1003:
	movq $0, %rax
label1004:
	movq %rax, %rdi
	call assertion
label1000:
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
