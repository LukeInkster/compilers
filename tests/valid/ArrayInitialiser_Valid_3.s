
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	movq %rax, 16(%rbp)
	jmp label2
label2:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq $8, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	movq %rax, %rdi
	call malloc
	movq %rax, %rax
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq %rax, 8(%rsp)
	movq $0, %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq -16(%rsp), %rax
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label4
	movq $1, %rax
	jmp label5
label4:
	movq $0, %rax
label5:
	movq %rax, %rdi
	call assertion
	subq $16, %rsp
	movq $16, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	movq %rax, %rdi
	call malloc
	movq %rax, %rax
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq %rax, 8(%rsp)
	movq $1, %rbx
	movq %rbx, 8(%rsp)
	movq $5, %rbx
	movq %rbx, 16(%rsp)
	call wl_f
	addq $16, %rsp
	movq -16(%rsp), %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label6
	movq $1, %rax
	jmp label7
label6:
	movq $0, %rax
label7:
	movq %rax, %rdi
	call assertion
	subq $16, %rsp
	movq $24, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	movq %rax, %rdi
	call malloc
	movq %rax, %rax
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq %rax, 8(%rsp)
	movq $2, %rbx
	movq %rbx, 8(%rsp)
	movq $5, %rbx
	movq %rbx, 16(%rsp)
	movq $5, %rbx
	movq %rbx, 24(%rsp)
	call wl_f
	addq $16, %rsp
	movq -16(%rsp), %rax
	movq $2, %rbx
	cmpq %rax, %rbx
	jnz label8
	movq $1, %rax
	jmp label9
label8:
	movq $0, %rax
label9:
	movq %rax, %rdi
	call assertion
	subq $16, %rsp
	movq $32, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	movq %rax, %rdi
	call malloc
	movq %rax, %rax
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq %rax, 8(%rsp)
	movq $3, %rbx
	movq %rbx, 8(%rsp)
	movq $5, %rbx
	movq %rbx, 16(%rsp)
	movq $5, %rbx
	movq %rbx, 24(%rsp)
	movq $5, %rbx
	movq %rbx, 32(%rsp)
	call wl_f
	addq $16, %rsp
	movq -16(%rsp), %rax
	movq $3, %rbx
	cmpq %rax, %rbx
	jnz label10
	movq $1, %rax
	jmp label11
label10:
	movq $0, %rax
label11:
	movq %rax, %rdi
	call assertion
	subq $16, %rsp
	movq $40, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	movq %rax, %rdi
	call malloc
	movq %rax, %rax
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq %rax, 8(%rsp)
	movq $4, %rbx
	movq %rbx, 8(%rsp)
	movq $5, %rbx
	movq %rbx, 16(%rsp)
	movq $5, %rbx
	movq %rbx, 24(%rsp)
	movq $5, %rbx
	movq %rbx, 32(%rsp)
	movq $5, %rbx
	movq %rbx, 40(%rsp)
	call wl_f
	addq $16, %rsp
	movq -16(%rsp), %rax
	movq $4, %rbx
	cmpq %rax, %rbx
	jnz label12
	movq $1, %rax
	jmp label13
label12:
	movq $0, %rax
label13:
	movq %rax, %rdi
	call assertion
label3:
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
