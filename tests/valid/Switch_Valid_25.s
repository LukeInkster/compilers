
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq $0, %rax
	movq %rax, -8(%rbp)
	movq 24(%rbp), %rax
	movq %rax, -16(%rbp)
label1139:
	movq -16(%rbp), %rax
	movq $10, %rbx
	cmpq %rbx, %rax
	jge label1140
	movq -16(%rbp), %rax
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label1144
label1142:
	movq -8(%rbp), %rbx
	movq $1, %rcx
	addq %rcx, %rbx
	movq %rbx, -8(%rbp)
	movq -16(%rbp), %rbx
	movq $1, %rcx
	addq %rcx, %rbx
	movq %rbx, -16(%rbp)
	jmp label1139
	jmp label1143
label1144:
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label1146
label1143:
	movq -8(%rbp), %rbx
	movq $10, %rcx
	addq %rcx, %rbx
	movq %rbx, -8(%rbp)
	jmp label1145
label1146:
	movq $2, %rbx
	cmpq %rax, %rbx
	jnz label1148
label1145:
	movq -8(%rbp), %rbx
	movq $100, %rcx
	addq %rcx, %rbx
	movq %rbx, -8(%rbp)
	jmp label1141
	jmp label1147
label1148:
	movq $3, %rbx
	cmpq %rax, %rbx
	jnz label1150
label1147:
	movq -8(%rbp), %rbx
	movq $1000, %rcx
	addq %rcx, %rbx
	movq %rbx, -8(%rbp)
	movq -8(%rbp), %rbx
	movq %rbx, 16(%rbp)
	jmp label1138
	jmp label1149
label1150:
label1149:
	movq -8(%rbp), %rbx
	movq $10000, %rcx
	addq %rcx, %rbx
	movq %rbx, -8(%rbp)
label1152:
label1141:
	movq -16(%rbp), %rax
	movq $1, %rbx
	addq %rbx, %rax
	movq %rax, -16(%rbp)
	movq -16(%rbp), %rax
	movq $5, %rbx
	cmpq %rax, %rbx
	jnz label1154
	jmp label1140
	jmp label1154
label1154:
	jmp label1139
label1140:
	movq -8(%rbp), %rax
	movq %rax, 16(%rbp)
	jmp label1138
label1138:
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
	jnz label1156
	movq $1, %rax
	jmp label1157
label1156:
	movq $0, %rax
label1157:
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
	jnz label1158
	movq $1, %rax
	jmp label1159
label1158:
	movq $0, %rax
label1159:
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
	jnz label1160
	movq $1, %rax
	jmp label1161
label1160:
	movq $0, %rax
label1161:
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
	jnz label1162
	movq $1, %rax
	jmp label1163
label1162:
	movq $0, %rax
label1163:
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
	jnz label1164
	movq $1, %rax
	jmp label1165
label1164:
	movq $0, %rax
label1165:
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
	jnz label1166
	movq $1, %rax
	jmp label1167
label1166:
	movq $0, %rax
label1167:
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
	jnz label1168
	movq $1, %rax
	jmp label1169
label1168:
	movq $0, %rax
label1169:
	movq %rax, %rdi
	call assertion
label1155:
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
