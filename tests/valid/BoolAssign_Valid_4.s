
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq $1, %rax
	movq %rax, -8(%rbp)
	movq 32(%rbp), %rax
	movq 24(%rbp), %rbx
	cmpq %rbx, %rax
	jge label133
	movq $0, %rax
	movq %rax, -8(%rbp)
	jmp label133
label133:
	movq -8(%rbp), %rax
	cmpq $0, %rax
	jz label136
	jmp label135
label136:
	movq 32(%rbp), %rax
	movq 24(%rbp), %rbx
	addq %rbx, %rax
	movq %rax, 16(%rbp)
	jmp label132
	jmp label134
label135:
	movq $123, %rax
	movq %rax, 16(%rbp)
	jmp label132
label134:
label132:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
	movq $1, %rax
	movq %rax, 8(%rsp)
	movq $1, %rax
	movq %rax, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq -32(%rsp), %rax
	movq $123, %rbx
	cmpq %rax, %rbx
	jnz label138
	movq $1, %rax
	jmp label139
label138:
	movq $0, %rax
label139:
	movq %rax, %rdi
	call assertion
	subq $32, %rsp
	movq $11, %rax
	movq %rax, 8(%rsp)
	movq $0, %rax
	movq %rax, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq -32(%rsp), %rax
	movq $11, %rbx
	cmpq %rax, %rbx
	jnz label140
	movq $1, %rax
	jmp label141
label140:
	movq $0, %rax
label141:
	movq %rax, %rdi
	call assertion
	subq $32, %rsp
	movq $0, %rax
	movq %rax, 8(%rsp)
	movq $11, %rax
	movq %rax, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq -32(%rsp), %rax
	movq $123, %rbx
	cmpq %rax, %rbx
	jnz label142
	movq $1, %rax
	jmp label143
label142:
	movq $0, %rax
label143:
	movq %rax, %rdi
	call assertion
label137:
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
