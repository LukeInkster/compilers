
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 32(%rbp), %rax
	movq 24(%rbp), %rbx
	movq %rax, %rax
	cqto
	idivq %rbx
	movq %rax, %rax
	movq %rax, 16(%rbp)
	jmp label406
label406:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
	movq $2, %rax
	movq %rax, 8(%rsp)
	movq $10, %rax
	movq %rax, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq -32(%rsp), %rax
	movq $5, %rbx
	cmpq %rax, %rbx
	jnz label408
	movq $1, %rax
	jmp label409
label408:
	movq $0, %rax
label409:
	movq %rax, %rdi
	call assertion
	subq $32, %rsp
	movq $3, %rax
	movq %rax, 8(%rsp)
	movq $10, %rax
	movq %rax, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq -32(%rsp), %rax
	movq $3, %rbx
	cmpq %rax, %rbx
	jnz label410
	movq $1, %rax
	jmp label411
label410:
	movq $0, %rax
label411:
	movq %rax, %rdi
	call assertion
	subq $32, %rsp
	movq $3, %rax
	movq %rax, 8(%rsp)
	movq $-10, %rax
	movq %rax, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq -32(%rsp), %rax
	movq $-3, %rbx
	cmpq %rax, %rbx
	jnz label412
	movq $1, %rax
	jmp label413
label412:
	movq $0, %rax
label413:
	movq %rax, %rdi
	call assertion
	subq $32, %rsp
	movq $4, %rax
	movq %rax, 8(%rsp)
	movq $1, %rax
	movq %rax, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq -32(%rsp), %rax
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label414
	movq $1, %rax
	jmp label415
label414:
	movq $0, %rax
label415:
	movq %rax, %rdi
	call assertion
label407:
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
