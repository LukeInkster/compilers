
	.text
wl_pred:
	pushq %rbp
	movq %rsp, %rbp
	movq $0, %rax
	movq %rax, 16(%rbp)
	jmp label176
label176:
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
	jnz label178
	movq $1, %rax
	jmp label179
label178:
	movq $0, %rax
label179:
	movq %rax, %rdi
	call assertion
label177:
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
