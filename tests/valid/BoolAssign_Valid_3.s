
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq 32(%rbp), %rax
	movq 24(%rbp), %rbx
	cmpq %rax, %rbx
	jnz label109
	movq $1, %rax
	jmp label110
label109:
	movq $0, %rax
label110:
	movq %rax, -8(%rbp)
	movq -8(%rbp), %rax
	cmpq $0, %rax
	jz label112
	movq $1, %rax
	movq %rax, 16(%rbp)
	jmp label108
	jmp label111
label112:
	movq 32(%rbp), %rax
	movq 24(%rbp), %rbx
	addq %rbx, %rax
	movq %rax, 16(%rbp)
	jmp label108
label111:
label108:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_g:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq 32(%rbp), %rax
	movq 24(%rbp), %rbx
	cmpq %rbx, %rax
	jl label114
	movq $1, %rax
	jmp label115
label114:
	movq $0, %rax
label115:
	movq %rax, -8(%rbp)
	movq -8(%rbp), %rax
	cmpq $0, %rax
	jz label118
	jmp label117
label118:
	movq 32(%rbp), %rax
	movq 24(%rbp), %rbx
	addq %rbx, %rax
	movq %rax, 16(%rbp)
	jmp label113
	jmp label116
label117:
	movq $1, %rax
	movq %rax, 16(%rbp)
	jmp label113
label116:
label113:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	movq $1, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $32, %rsp
	movq $1, %rbx
	movq %rbx, 8(%rsp)
	movq $1, %rbx
	movq %rbx, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -48(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label120
	movq $1, %rax
	jmp label121
label120:
	movq $0, %rax
label121:
	movq %rax, %rdi
	call assertion
	movq $1, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $32, %rsp
	movq $0, %rbx
	movq %rbx, 8(%rsp)
	movq $0, %rbx
	movq %rbx, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -48(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label122
	movq $1, %rax
	jmp label123
label122:
	movq $0, %rax
label123:
	movq %rax, %rdi
	call assertion
	movq $349, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $32, %rsp
	movq $345, %rbx
	movq %rbx, 8(%rsp)
	movq $4, %rbx
	movq %rbx, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -48(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label124
	movq $1, %rax
	jmp label125
label124:
	movq $0, %rax
label125:
	movq %rax, %rdi
	call assertion
	movq $1, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $32, %rsp
	movq $1, %rbx
	movq %rbx, 8(%rsp)
	movq $1, %rbx
	movq %rbx, 16(%rsp)
	call wl_g
	addq $32, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -48(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label126
	movq $1, %rax
	jmp label127
label126:
	movq $0, %rax
label127:
	movq %rax, %rdi
	call assertion
	movq $1, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $32, %rsp
	movq $0, %rbx
	movq %rbx, 8(%rsp)
	movq $0, %rbx
	movq %rbx, 16(%rsp)
	call wl_g
	addq $32, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -48(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label128
	movq $1, %rax
	jmp label129
label128:
	movq $0, %rax
label129:
	movq %rax, %rdi
	call assertion
	movq $349, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $32, %rsp
	movq $345, %rbx
	movq %rbx, 8(%rsp)
	movq $4, %rbx
	movq %rbx, 16(%rsp)
	call wl_g
	addq $32, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -48(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label130
	movq $1, %rax
	jmp label131
label130:
	movq $0, %rax
label131:
	movq %rax, %rdi
	call assertion
label119:
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
