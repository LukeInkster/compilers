
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	leaq str0(%rip), %rbx
	cmpq %rax, %rbx
	jnz label1217
label1215:
	movq $0, %rcx
	movq %rcx, 16(%rbp)
	jmp label1213
	jmp label1216
label1217:
	leaq str1(%rip), %rbx
	cmpq %rax, %rbx
	jnz label1219
label1216:
	movq $1, %rcx
	movq %rcx, 16(%rbp)
	jmp label1213
	jmp label1218
label1219:
	leaq str2(%rip), %rbx
	cmpq %rax, %rbx
	jnz label1221
label1218:
	movq $2, %rcx
	movq %rcx, 16(%rbp)
	jmp label1213
label1221:
label1214:
	movq $3, %rax
	movq %rax, 16(%rbp)
	jmp label1213
label1213:
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
	leaq str0(%rip), %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label1224
	movq $1, %rax
	jmp label1225
label1224:
	movq $0, %rax
label1225:
	movq %rax, %rdi
	call assertion
	movq $1, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	leaq str1(%rip), %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label1226
	movq $1, %rax
	jmp label1227
label1226:
	movq $0, %rax
label1227:
	movq %rax, %rdi
	call assertion
	movq $2, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	leaq str2(%rip), %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label1228
	movq $1, %rax
	jmp label1229
label1228:
	movq $0, %rax
label1229:
	movq %rax, %rdi
	call assertion
	movq $3, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	leaq str3(%rip), %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label1230
	movq $1, %rax
	jmp label1231
label1230:
	movq $0, %rax
label1231:
	movq %rax, %rdi
	call assertion
label1223:
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
str0:
	.asciz "hi"
str1:
	.asciz "bye"
str2:
	.asciz "hello"
str3:
	.asciz "btrwb"
