
	.text
wl_pred:
	pushq %rbp
	movq %rsp, %rbp
	movq $0, %rax
	movq %rax, 16(%rbp)
	jmp label122
label122:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	call wl_pred
	addq $16, %rsp
	movq -16(%rsp), %rax
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label124
	movq $1, %rax
	jmp label125
label124:
	movq $0, %rax
label125:
	movq %rax, %rdi
	call assertion
label123:
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
