
	.text
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
	movq $2, %rax
	movq %rax, -16(%rbp)
	movq $3, %rax
	movq %rax, -8(%rbp)
	movq $1, %rax
	movq %rax, -32(%rbp)
	movq $3, %rax
	movq %rax, -24(%rbp)
	subq $32, %rsp
	movq -16(%rbp), %rax
	movq %rax, 0(%rsp)
	movq -8(%rbp), %rax
	movq %rax, 8(%rsp)
	movq $2, %rax
	movq %rax, 16(%rsp)
	movq $3, %rax
	movq %rax, 24(%rsp)
	movq 0(%rsp), %rax
	movq 16(%rsp), %rbx
	cmpq %rbx, %rax
	jnz label405
	movq 8(%rsp), %rax
	movq 24(%rsp), %rbx
	cmpq %rbx, %rax
	jnz label405
	addq $32, %rsp
	movq $1, %rax
	jmp label406
label405:
	movq $0, %rax
label406:
	movq %rax, %rdi
	call assertion
	subq $32, %rsp
	movq -32(%rbp), %rax
	movq %rax, 0(%rsp)
	movq -24(%rbp), %rax
	movq %rax, 8(%rsp)
	movq $1, %rax
	movq %rax, 16(%rsp)
	movq $3, %rax
	movq %rax, 24(%rsp)
	movq 0(%rsp), %rax
	movq 16(%rsp), %rbx
	cmpq %rbx, %rax
	jnz label407
	movq 8(%rsp), %rax
	movq 24(%rsp), %rbx
	cmpq %rbx, %rax
	jnz label407
	addq $32, %rsp
	movq $1, %rax
	jmp label408
label407:
	movq $0, %rax
label408:
	movq %rax, %rdi
	call assertion
	subq $32, %rsp
	movq -16(%rbp), %rax
	movq %rax, 0(%rsp)
	movq -8(%rbp), %rax
	movq %rax, 8(%rsp)
	movq -32(%rbp), %rax
	movq %rax, 16(%rsp)
	movq -24(%rbp), %rax
	movq %rax, 24(%rsp)
	movq 0(%rsp), %rax
	movq 16(%rsp), %rbx
	cmpq %rbx, %rax
	jnz label411
	movq 8(%rsp), %rax
	movq 24(%rsp), %rbx
	cmpq %rbx, %rax
	jnz label411
	jmp label409
label411:
	addq $32, %rsp
	movq $1, %rax
	jmp label410
label409:
	movq $0, %rax
label410:
	movq %rax, %rdi
	call assertion
	movq -16(%rbp), %rax
	movq $1, %rbx
	movq %rbx, 0(%rax)
	subq $32, %rsp
	movq -16(%rbp), %rax
	movq %rax, 0(%rsp)
	movq -8(%rbp), %rax
	movq %rax, 8(%rsp)
	movq $1, %rax
	movq %rax, 16(%rsp)
	movq $3, %rax
	movq %rax, 24(%rsp)
	movq 0(%rsp), %rax
	movq 16(%rsp), %rbx
	cmpq %rbx, %rax
	jnz label412
	movq 8(%rsp), %rax
	movq 24(%rsp), %rbx
	cmpq %rbx, %rax
	jnz label412
	addq $32, %rsp
	movq $1, %rax
	jmp label413
label412:
	movq $0, %rax
label413:
	movq %rax, %rdi
	call assertion
	subq $32, %rsp
	movq -16(%rbp), %rax
	movq %rax, 0(%rsp)
	movq -8(%rbp), %rax
	movq %rax, 8(%rsp)
	movq -32(%rbp), %rax
	movq %rax, 16(%rsp)
	movq -24(%rbp), %rax
	movq %rax, 24(%rsp)
	movq 0(%rsp), %rax
	movq 16(%rsp), %rbx
	cmpq %rbx, %rax
	jnz label414
	movq 8(%rsp), %rax
	movq 24(%rsp), %rbx
	cmpq %rbx, %rax
	jnz label414
	addq $32, %rsp
	movq $1, %rax
	jmp label415
label414:
	movq $0, %rax
label415:
	movq %rax, %rdi
	call assertion
label404:
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
