
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq 24(%rbp), %rax
	movq %rax, -16(%rbp)
label209:
	movq -16(%rbp), %rax
	movq $0, %rbx
	cmpq %rbx, %rax
	jl label210
	movq 24(%rbp), %rax
	movq $0, %rbx
	cmpq %rbx, %rax
	jge label213
	movq $0, %rax
	movq %rax, 16(%rbp)
	jmp label208
	jmp label212
label213:
	movq 24(%rbp), %rax
	movq %rax, -8(%rbp)
label212:
	movq -8(%rbp), %rax
	movq %rax, 16(%rbp)
	jmp label208
label211:
	movq -16(%rbp), %rax
	movq $1, %rbx
	subq %rbx, %rax
	movq %rax, -16(%rbp)
	jmp label209
label210:
	movq $0, %rax
	movq %rax, 16(%rbp)
	jmp label208
label208:
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
	movq $1, %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label215
	movq $1, %rax
	jmp label216
label215:
	movq $0, %rax
label216:
	movq %rax, %rdi
	call assertion
	movq $10, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	movq $10, %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label217
	movq $1, %rax
	jmp label218
label217:
	movq $0, %rax
label218:
	movq %rax, %rdi
	call assertion
	movq $11, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	movq $11, %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label219
	movq $1, %rax
	jmp label220
label219:
	movq $0, %rax
label220:
	movq %rax, %rdi
	call assertion
	movq $1212, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	movq $1212, %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label221
	movq $1, %rax
	jmp label222
label221:
	movq $0, %rax
label222:
	movq %rax, %rdi
	call assertion
	movq $0, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	movq $-1212, %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label223
	movq $1, %rax
	jmp label224
label223:
	movq $0, %rax
label224:
	movq %rax, %rdi
	call assertion
label214:
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
