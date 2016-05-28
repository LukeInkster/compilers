
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 32(%rbp), %rax
	movq 24(%rbp), %rbx
	cmpq %rax, %rbx
	jnz label12
	leaq str0(%rip), %rax
	movq %rax, 16(%rbp)
	jmp label10
	jmp label11
label12:
	leaq str1(%rip), %rax
	movq %rax, 16(%rbp)
	jmp label10
label11:
label10:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_g:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
	movq 24(%rbp), %rax
	movq %rax, 8(%rsp)
	movq 32(%rbp), %rax
	movq %rax, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq -32(%rsp), %rax
	movq %rax, 16(%rbp)
	jmp label13
label13:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
	movq $24, %rsp
	movq %rsp, %rdi
	call malloc
	movq %rax, %rsp
	movq 8(%rsp), %rbx
	movq $2, %rax
	movq %rax, 0(%rbx)
	movq $1, %rax
	movq %rax, 8(%rbx)
	movq $4, %rax
	movq %rax, 16(%rbx)
	movq $24, %rsp
	movq %rsp, %rdi
	call malloc
	movq %rax, %rsp
	movq 16(%rsp), %rbx
	movq $2, %rax
	movq %rax, 0(%rbx)
	movq $1, %rax
	movq %rax, 8(%rbx)
	movq $4, %rax
	movq %rax, 16(%rbx)
	call wl_g
	addq $32, %rsp
	movq -32(%rsp), %rax
	leaq str0(%rip), %rbx
	cmpq %rax, %rbx
	jnz label15
	movq $1, %rax
	jmp label16
label15:
	movq $0, %rax
label16:
	movq %rax, %rdi
	call assertion
	subq $32, %rsp
	movq $24, %rsp
	movq %rsp, %rdi
	call malloc
	movq %rax, %rsp
	movq 8(%rsp), %rbx
	movq $2, %rax
	movq %rax, 0(%rbx)
	movq $1, %rax
	movq %rax, 8(%rbx)
	movq $42, %rax
	movq %rax, 16(%rbx)
	movq $24, %rsp
	movq %rsp, %rdi
	call malloc
	movq %rax, %rsp
	movq 16(%rsp), %rbx
	movq $2, %rax
	movq %rax, 0(%rbx)
	movq $1, %rax
	movq %rax, 8(%rbx)
	movq $4, %rax
	movq %rax, 16(%rbx)
	call wl_g
	addq $32, %rsp
	movq -32(%rsp), %rax
	leaq str1(%rip), %rbx
	cmpq %rax, %rbx
	jnz label17
	movq $1, %rax
	jmp label18
label17:
	movq $0, %rax
label18:
	movq %rax, %rdi
	call assertion
	subq $32, %rsp
	movq $8, %rsp
	movq %rsp, %rdi
	call malloc
	movq %rax, %rsp
	movq 8(%rsp), %rbx
	movq $0, %rax
	movq %rax, 0(%rbx)
	movq $8, %rsp
	movq %rsp, %rdi
	call malloc
	movq %rax, %rsp
	movq 16(%rsp), %rbx
	movq $0, %rax
	movq %rax, 0(%rbx)
	call wl_g
	addq $32, %rsp
	movq -32(%rsp), %rax
	leaq str0(%rip), %rbx
	cmpq %rax, %rbx
	jnz label19
	movq $1, %rax
	jmp label20
label19:
	movq $0, %rax
label20:
	movq %rax, %rdi
	call assertion
label14:
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
	.asciz "EQUAL"
str1:
	.asciz "NOT EQUAL"
