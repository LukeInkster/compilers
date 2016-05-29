
	.text
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq $3, %rax
	movq %rax, -8(%rbp)
	movq $2, %rax
	movq $3, %rbx
	imulq %rbx, %rax
	movq -8(%rbp), %rbx
	addq %rbx, %rax
	movq $9, %rbx
	cmpq %rax, %rbx
	jnz label427
	movq $1, %rax
	jmp label428
label427:
	movq $0, %rax
label428:
	movq %rax, %rdi
	call assertion
	movq -8(%rbp), %rax
	movq $1, %rbx
	addq %rbx, %rax
	movq $2, %rbx
	imulq %rbx, %rax
	movq $8, %rbx
	cmpq %rax, %rbx
	jnz label429
	movq $1, %rax
	jmp label430
label429:
	movq $0, %rax
label430:
	movq %rax, %rdi
	call assertion
	movq -8(%rbp), %rax
	movq -8(%rbp), %rbx
	imulq %rbx, %rax
	movq $9, %rbx
	cmpq %rax, %rbx
	jnz label431
	movq $1, %rax
	jmp label432
label431:
	movq $0, %rax
label432:
	movq %rax, %rdi
	call assertion
	movq -8(%rbp), %rax
	negq %rax
	movq $2, %rbx
	imulq %rbx, %rax
	movq $-6, %rbx
	cmpq %rax, %rbx
	jnz label433
	movq $1, %rax
	jmp label434
label433:
	movq $0, %rax
label434:
	movq %rax, %rdi
	call assertion
label426:
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
