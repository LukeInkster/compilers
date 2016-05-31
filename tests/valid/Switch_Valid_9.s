
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label1001
label999:
	movq $0, %rcx
	movq %rcx, 16(%rbp)
	jmp label997
	jmp label1000
label1001:
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label1003
label1000:
	movq $1, %rcx
	movq %rcx, 16(%rbp)
	jmp label997
label1003:
label998:
	movq $3, %rax
	movq %rax, 16(%rbp)
	jmp label997
label997:
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
	jnz label1006
	movq $1, %rax
	jmp label1007
label1006:
	movq $0, %rax
label1007:
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
	jnz label1008
	movq $1, %rax
	jmp label1009
label1008:
	movq $0, %rax
label1009:
	movq %rax, %rdi
	call assertion
label1005:
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
