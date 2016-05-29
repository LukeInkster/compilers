
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
