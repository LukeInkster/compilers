
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	leaq str0(%rip), %rbx
	cmpq %rax, %rbx
	jnz label1201
label1199:
	movq $0, %rbx
	movq %rbx, 16(%rbp)
	jmp label1197
	jmp label1200
label1201:
	leaq str1(%rip), %rbx
	cmpq %rax, %rbx
	jnz label1203
label1200:
	movq $1, %rbx
	movq %rbx, 16(%rbp)
	jmp label1197
	jmp label1202
label1203:
	leaq str2(%rip), %rbx
	cmpq %rax, %rbx
	jnz label1205
label1202:
	movq $2, %rbx
	movq %rbx, 16(%rbp)
	jmp label1197
label1205:
label1198:
	movq $3, %rax
	movq %rax, 16(%rbp)
	jmp label1197
label1197:
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
	jnz label1208
	movq $1, %rax
	jmp label1209
label1208:
	movq $0, %rax
label1209:
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
	jnz label1210
	movq $1, %rax
	jmp label1211
label1210:
	movq $0, %rax
label1211:
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
	jnz label1212
	movq $1, %rax
	jmp label1213
label1212:
	movq $0, %rax
label1213:
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
	jnz label1214
	movq $1, %rax
	jmp label1215
label1214:
	movq $0, %rax
label1215:
	movq %rax, %rdi
	call assertion
label1207:
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
