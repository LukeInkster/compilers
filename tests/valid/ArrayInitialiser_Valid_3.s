
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	movq 0(%rax), %rax
	movq %rax, 16(%rbp)
	jmp label12
label12:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq $8, %rax
	movq %rax, %rdi
	call malloc
	movq %rax, %rax
	movq %rax, 8(%rsp)
	movq $0, %rbx
	movq %rbx, 0(%rax)
	call wl_f
	addq $16, %rsp
	movq -16(%rsp), %rax
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label14
	movq $1, %rax
	jmp label15
label14:
	movq $0, %rax
label15:
	movq %rax, %rdi
	call assertion
	subq $16, %rsp
	movq $16, %rax
	movq %rax, %rdi
	call malloc
	movq %rax, %rax
	movq %rax, 8(%rsp)
	movq $1, %rbx
	movq %rbx, 0(%rax)
	movq $5, %rbx
	movq %rbx, 8(%rax)
	call wl_f
	addq $16, %rsp
	movq -16(%rsp), %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label16
	movq $1, %rax
	jmp label17
label16:
	movq $0, %rax
label17:
	movq %rax, %rdi
	call assertion
	subq $16, %rsp
	movq $24, %rax
	movq %rax, %rdi
	call malloc
	movq %rax, %rax
	movq %rax, 8(%rsp)
	movq $2, %rbx
	movq %rbx, 0(%rax)
	movq $5, %rbx
	movq %rbx, 8(%rax)
	movq $5, %rbx
	movq %rbx, 16(%rax)
	call wl_f
	addq $16, %rsp
	movq -16(%rsp), %rax
	movq $2, %rbx
	cmpq %rax, %rbx
	jnz label18
	movq $1, %rax
	jmp label19
label18:
	movq $0, %rax
label19:
	movq %rax, %rdi
	call assertion
	subq $16, %rsp
	movq $32, %rax
	movq %rax, %rdi
	call malloc
	movq %rax, %rax
	movq %rax, 8(%rsp)
	movq $3, %rbx
	movq %rbx, 0(%rax)
	movq $5, %rbx
	movq %rbx, 8(%rax)
	movq $5, %rbx
	movq %rbx, 16(%rax)
	movq $5, %rbx
	movq %rbx, 24(%rax)
	call wl_f
	addq $16, %rsp
	movq -16(%rsp), %rax
	movq $3, %rbx
	cmpq %rax, %rbx
	jnz label20
	movq $1, %rax
	jmp label21
label20:
	movq $0, %rax
label21:
	movq %rax, %rdi
	call assertion
	subq $16, %rsp
	movq $40, %rax
	movq %rax, %rdi
	call malloc
	movq %rax, %rax
	movq %rax, 8(%rsp)
	movq $4, %rbx
	movq %rbx, 0(%rax)
	movq $5, %rbx
	movq %rbx, 8(%rax)
	movq $5, %rbx
	movq %rbx, 16(%rax)
	movq $5, %rbx
	movq %rbx, 24(%rax)
	movq $5, %rbx
	movq %rbx, 32(%rax)
	call wl_f
	addq $16, %rsp
	movq -16(%rsp), %rax
	movq $4, %rbx
	cmpq %rax, %rbx
	jnz label22
	movq $1, %rax
	jmp label23
label22:
	movq $0, %rax
label23:
	movq %rax, %rdi
	call assertion
label13:
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
