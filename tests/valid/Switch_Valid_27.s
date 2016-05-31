
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	movq 0(%rax), %rbx
	incq %rbx
	movq %rbx, %rcx
	imulq $8, %rcx
	subq $16, %rsp
	movq %rax, 0(%rsp)
	movq %rbx, 8(%rsp)
	movq %rcx, %rdi
	call malloc
	movq %rax, %rcx
	movq 0(%rsp), %rax
	movq 8(%rsp), %rbx
	addq $16, %rsp
	subq $32, %rsp
	movq %rax, 0(%rsp)
	movq %rbx, 8(%rsp)
	movq %rcx, 16(%rsp)
	movq %rcx, %rdi
	movq %rax, %rsi
	movq %rbx, %rdx
	call intncpy
	movq 0(%rsp), %rax
	movq 8(%rsp), %rbx
	movq 16(%rsp), %rcx
	addq $32, %rsp
	movq %rcx, %rax
	movq $16, %rbx
	subq $16, %rsp
	movq %rax, 0(%rsp)
	movq %rbx, %rdi
	call malloc
	movq %rax, %rbx
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq $1, %rcx
	movq %rcx, 0(%rbx)
	movq $1, %rcx
	movq %rcx, 8(%rbx)
	movq %rax, %rcx
	movq %rbx, %rdx
	movq 0(%rcx), %rdi
	incq %rdi
	subq $48, %rsp
	movq %rax, 0(%rsp)
	movq %rbx, 8(%rsp)
	movq %rcx, 16(%rsp)
	movq %rdx, 24(%rsp)
	movq %rdi, 32(%rsp)
	xchgq %rcx, %rdi
	movq %rdx, %rsi
	movq %rcx, %rdx
	call intncmp
	movq %rax, %rsi
	movq 0(%rsp), %rax
	movq 8(%rsp), %rbx
	movq 16(%rsp), %rcx
	movq 24(%rsp), %rdx
	movq 32(%rsp), %rdi
	addq $48, %rsp
	cmpq $0, %rsi
	jz label1206
label1204:
	movq $1, %rcx
	movq %rcx, 16(%rbp)
	jmp label1202
label1206:
label1203:
	movq $0, %rax
	movq %rax, 16(%rbp)
	jmp label1202
label1202:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq $16, %rax
	movq %rax, %rdi
	call malloc
	movq %rax, %rax
	movq %rax, 8(%rsp)
	movq $1, %rbx
	movq %rbx, 0(%rax)
	movq $1, %rbx
	movq %rbx, 8(%rax)
	call wl_f
	addq $16, %rsp
	movq -16(%rsp), %rax
	movq %rax, %rdi
	call prnint
	subq $16, %rsp
	movq $16, %rax
	movq %rax, %rdi
	call malloc
	movq %rax, %rax
	movq %rax, 8(%rsp)
	movq $1, %rbx
	movq %rbx, 0(%rax)
	movq $2, %rbx
	movq %rbx, 8(%rax)
	call wl_f
	addq $16, %rsp
	movq -16(%rsp), %rax
	movq %rax, %rdi
	call prnint
	movq $1, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	movq $16, %rbx
	subq $16, %rsp
	movq %rax, 0(%rsp)
	movq %rbx, %rdi
	call malloc
	movq %rax, %rbx
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq %rbx, 8(%rsp)
	movq $1, %rcx
	movq %rcx, 0(%rbx)
	movq $1, %rcx
	movq %rcx, 8(%rbx)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label1209
	movq $1, %rax
	jmp label1210
label1209:
	movq $0, %rax
label1210:
	movq %rax, %rdi
	call assertion
	movq $0, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	movq $16, %rbx
	subq $16, %rsp
	movq %rax, 0(%rsp)
	movq %rbx, %rdi
	call malloc
	movq %rax, %rbx
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq %rbx, 8(%rsp)
	movq $1, %rcx
	movq %rcx, 0(%rbx)
	movq $2, %rcx
	movq %rcx, 8(%rbx)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label1211
	movq $1, %rax
	jmp label1212
label1211:
	movq $0, %rax
label1212:
	movq %rax, %rdi
	call assertion
label1208:
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
