
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label1124
label1122:
	movq 24(%rbp), %rcx
	movq $1, %rdx
	addq %rdx, %rcx
	movq %rcx, 24(%rbp)
	jmp label1123
label1124:
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label1126
label1123:
	movq 24(%rbp), %rcx
	movq $1, %rdx
	addq %rdx, %rcx
	movq %rcx, 24(%rbp)
	jmp label1125
label1126:
	movq $2, %rbx
	cmpq %rax, %rbx
	jnz label1128
label1125:
	movq 24(%rbp), %rcx
	movq $1, %rdx
	addq %rdx, %rcx
	movq %rcx, 24(%rbp)
	jmp label1127
label1128:
label1127:
	movq 24(%rbp), %rcx
	movq $1, %rdx
	addq %rdx, %rcx
	movq %rcx, 24(%rbp)
label1130:
label1121:
	movq 24(%rbp), %rax
	movq %rax, 16(%rbp)
	jmp label1120
label1120:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	movq $4, %rax
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
	jnz label1133
	movq $1, %rax
	jmp label1134
label1133:
	movq $0, %rax
label1134:
	movq %rax, %rdi
	call assertion
	movq $4, %rax
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
	jnz label1135
	movq $1, %rax
	jmp label1136
label1135:
	movq $0, %rax
label1136:
	movq %rax, %rdi
	call assertion
	movq $4, %rax
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
	jnz label1137
	movq $1, %rax
	jmp label1138
label1137:
	movq $0, %rax
label1138:
	movq %rax, %rdi
	call assertion
	movq $4, %rax
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
	jnz label1139
	movq $1, %rax
	jmp label1140
label1139:
	movq $0, %rax
label1140:
	movq %rax, %rdi
	call assertion
label1132:
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
