
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq $0, %rax
	movq %rax, -8(%rbp)
	movq 24(%rbp), %rax
	movq %rax, -16(%rbp)
label1111:
	movq -16(%rbp), %rax
	movq $10, %rbx
	cmpq %rbx, %rax
	jge label1112
	movq -16(%rbp), %rax
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label1116
label1114:
	movq -8(%rbp), %rbx
	movq $1, %rcx
	addq %rcx, %rbx
	movq %rbx, -8(%rbp)
	movq -16(%rbp), %rbx
	movq $1, %rcx
	addq %rcx, %rbx
	movq %rbx, -16(%rbp)
	jmp label1111
	jmp label1115
label1116:
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label1118
label1115:
	movq -8(%rbp), %rbx
	movq $10, %rcx
	addq %rcx, %rbx
	movq %rbx, -8(%rbp)
	jmp label1117
label1118:
	movq $2, %rbx
	cmpq %rax, %rbx
	jnz label1120
label1117:
	movq -8(%rbp), %rbx
	movq $100, %rcx
	addq %rcx, %rbx
	movq %rbx, -8(%rbp)
	jmp label1113
	jmp label1119
label1120:
	movq $3, %rbx
	cmpq %rax, %rbx
	jnz label1122
label1119:
	movq -8(%rbp), %rbx
	movq $1000, %rcx
	addq %rcx, %rbx
	movq %rbx, -8(%rbp)
	movq -8(%rbp), %rbx
	movq %rbx, 16(%rbp)
	jmp label1110
	jmp label1121
label1122:
label1121:
	movq -8(%rbp), %rbx
	movq $10000, %rcx
	addq %rcx, %rbx
	movq %rbx, -8(%rbp)
label1124:
label1113:
	movq -16(%rbp), %rax
	movq $1, %rbx
	addq %rbx, %rax
	movq %rax, -16(%rbp)
	movq -16(%rbp), %rax
	movq $5, %rbx
	cmpq %rax, %rbx
	jnz label1126
	jmp label1112
	jmp label1126
label1126:
	jmp label1111
label1112:
	movq -8(%rbp), %rax
	movq %rax, 16(%rbp)
	jmp label1110
label1110:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq $0, %rax
	movq %rax, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq -16(%rsp), %rax
	movq $1211, %rbx
	cmpq %rax, %rbx
	jnz label1128
	movq $1, %rax
	jmp label1129
label1128:
	movq $0, %rax
label1129:
	movq %rax, %rdi
	call assertion
	subq $16, %rsp
	movq $1, %rax
	movq %rax, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq -16(%rsp), %rax
	movq $1210, %rbx
	cmpq %rax, %rbx
	jnz label1130
	movq $1, %rax
	jmp label1131
label1130:
	movq $0, %rax
label1131:
	movq %rax, %rdi
	call assertion
	subq $16, %rsp
	movq $2, %rax
	movq %rax, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq -16(%rsp), %rax
	movq $1100, %rbx
	cmpq %rax, %rbx
	jnz label1132
	movq $1, %rax
	jmp label1133
label1132:
	movq $0, %rax
label1133:
	movq %rax, %rdi
	call assertion
	subq $16, %rsp
	movq $3, %rax
	movq %rax, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq -16(%rsp), %rax
	movq $1000, %rbx
	cmpq %rax, %rbx
	jnz label1134
	movq $1, %rax
	jmp label1135
label1134:
	movq $0, %rax
label1135:
	movq %rax, %rdi
	call assertion
	subq $16, %rsp
	movq $4, %rax
	movq %rax, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq -16(%rsp), %rax
	movq $10000, %rbx
	cmpq %rax, %rbx
	jnz label1136
	movq $1, %rax
	jmp label1137
label1136:
	movq $0, %rax
label1137:
	movq %rax, %rdi
	call assertion
	subq $16, %rsp
	movq $5, %rax
	movq %rax, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq -16(%rsp), %rax
	movq $50000, %rbx
	cmpq %rax, %rbx
	jnz label1138
	movq $1, %rax
	jmp label1139
label1138:
	movq $0, %rax
label1139:
	movq %rax, %rdi
	call assertion
	subq $16, %rsp
	movq $6, %rax
	movq %rax, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq -16(%rsp), %rax
	movq $40000, %rbx
	cmpq %rax, %rbx
	jnz label1140
	movq $1, %rax
	jmp label1141
label1140:
	movq $0, %rax
label1141:
	movq %rax, %rdi
	call assertion
label1127:
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
