
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq $0, %rax
	movq %rax, -8(%rbp)
	movq 24(%rbp), %rax
	movq %rax, -16(%rbp)
label1144:
	movq -16(%rbp), %rax
	movq $10, %rbx
	cmpq %rbx, %rax
	jge label1145
	movq -16(%rbp), %rax
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label1149
label1147:
	movq -8(%rbp), %rcx
	movq $1, %rdx
	addq %rdx, %rcx
	movq %rcx, -8(%rbp)
	movq -16(%rbp), %rcx
	movq $1, %rdx
	addq %rdx, %rcx
	movq %rcx, -16(%rbp)
	jmp label1144
	jmp label1148
label1149:
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label1151
label1148:
	movq -8(%rbp), %rcx
	movq $10, %rdx
	addq %rdx, %rcx
	movq %rcx, -8(%rbp)
	jmp label1150
label1151:
	movq $2, %rbx
	cmpq %rax, %rbx
	jnz label1153
label1150:
	movq -8(%rbp), %rcx
	movq $100, %rdx
	addq %rdx, %rcx
	movq %rcx, -8(%rbp)
	jmp label1146
	jmp label1152
label1153:
	movq $3, %rbx
	cmpq %rax, %rbx
	jnz label1155
label1152:
	movq -8(%rbp), %rcx
	movq $1000, %rdx
	addq %rdx, %rcx
	movq %rcx, -8(%rbp)
	movq -8(%rbp), %rcx
	movq %rcx, 16(%rbp)
	jmp label1143
	jmp label1154
label1155:
label1154:
	movq -8(%rbp), %rcx
	movq $10000, %rdx
	addq %rdx, %rcx
	movq %rcx, -8(%rbp)
label1157:
label1146:
	movq -16(%rbp), %rax
	movq $1, %rbx
	addq %rbx, %rax
	movq %rax, -16(%rbp)
	movq -16(%rbp), %rax
	movq $5, %rbx
	cmpq %rax, %rbx
	jnz label1159
	jmp label1145
	jmp label1159
label1159:
	jmp label1144
label1145:
	movq -8(%rbp), %rax
	movq %rax, 16(%rbp)
	jmp label1143
label1143:
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
	jnz label1161
	movq $1, %rax
	jmp label1162
label1161:
	movq $0, %rax
label1162:
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
	jnz label1163
	movq $1, %rax
	jmp label1164
label1163:
	movq $0, %rax
label1164:
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
	jnz label1165
	movq $1, %rax
	jmp label1166
label1165:
	movq $0, %rax
label1166:
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
	jnz label1167
	movq $1, %rax
	jmp label1168
label1167:
	movq $0, %rax
label1168:
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
	jnz label1169
	movq $1, %rax
	jmp label1170
label1169:
	movq $0, %rax
label1170:
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
	jnz label1171
	movq $1, %rax
	jmp label1172
label1171:
	movq $0, %rax
label1172:
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
	jnz label1173
	movq $1, %rax
	jmp label1174
label1173:
	movq $0, %rax
label1174:
	movq %rax, %rdi
	call assertion
label1160:
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
