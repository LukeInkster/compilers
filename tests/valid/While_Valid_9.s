
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq $0, %rax
	movq %rax, -8(%rbp)
label1094:
	movq -8(%rbp), %rax
	movq $10, %rbx
	cmpq %rbx, %rax
	jge label1095
	movq -8(%rbp), %rax
	movq $1, %rbx
	addq %rbx, %rax
	movq %rax, -8(%rbp)
	movq $1, %rax
	cmpq $0, %rax
	jz label1096
	jmp label1095
	jmp label1096
label1096:
	movq -8(%rbp), %rax
	movq $1, %rbx
	addq %rbx, %rax
	movq %rax, -8(%rbp)
	jmp label1094
label1095:
	movq -8(%rbp), %rax
	movq %rax, 16(%rbp)
	jmp label1093
label1093:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	movq $1, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label1098
	movq $1, %rax
	jmp label1099
label1098:
	movq $0, %rax
label1099:
	movq %rax, %rdi
	call assertion
label1097:
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
