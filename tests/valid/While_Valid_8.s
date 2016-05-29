
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
label1078:
	movq 24(%rbp), %rax
	movq $0, %rbx
	cmpq %rbx, %rax
	jl label1079
	movq 24(%rbp), %rax
	movq $0, %rbx
	cmpq %rbx, %rax
	jge label1081
	movq $0, %rax
	movq %rax, 16(%rbp)
	jmp label1077
	jmp label1080
label1081:
	movq 24(%rbp), %rax
	movq %rax, -8(%rbp)
label1080:
	movq -8(%rbp), %rax
	movq %rax, 16(%rbp)
	jmp label1077
	jmp label1078
label1079:
	movq $0, %rax
	movq %rax, 16(%rbp)
	jmp label1077
label1077:
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
	jnz label1083
	movq $1, %rax
	jmp label1084
label1083:
	movq $0, %rax
label1084:
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
	jnz label1085
	movq $1, %rax
	jmp label1086
label1085:
	movq $0, %rax
label1086:
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
	jnz label1087
	movq $1, %rax
	jmp label1088
label1087:
	movq $0, %rax
label1088:
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
	jnz label1089
	movq $1, %rax
	jmp label1090
label1089:
	movq $0, %rax
label1090:
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
	jnz label1091
	movq $1, %rax
	jmp label1092
label1091:
	movq $0, %rax
label1092:
	movq %rax, %rdi
	call assertion
label1082:
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
