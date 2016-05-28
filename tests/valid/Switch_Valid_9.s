
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label870
label868:
	movq $0, %rbx
	movq %rbx, 16(%rbp)
	jmp label866
	jmp label869
label870:
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label872
label869:
	movq $1, %rbx
	movq %rbx, 16(%rbp)
	jmp label866
label872:
label867:
	movq $3, %rax
	movq %rax, 16(%rbp)
	jmp label866
label866:
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
	jnz label875
	movq $1, %rax
	jmp label876
label875:
	movq $0, %rax
label876:
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
	jnz label877
	movq $1, %rax
	jmp label878
label877:
	movq $0, %rax
label878:
	movq %rax, %rdi
	call assertion
label874:
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
