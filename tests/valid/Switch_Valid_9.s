
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label638
	movq $0, %rbx
	movq %rbx, 16(%rbp)
	jmp label636
label638:
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label639
	movq $1, %rbx
	movq %rbx, 16(%rbp)
	jmp label636
label639:
label637:
	movq $3, %rax
	movq %rax, 16(%rbp)
	jmp label636
label636:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	movq $0, %rax
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
	jnz label641
	movq $1, %rax
	jmp label642
label641:
	movq $0, %rax
label642:
	movq %rax, %rdi
	call assertion
	movq $1, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	movq $0, %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label643
	movq $1, %rax
	jmp label644
label643:
	movq $0, %rax
label644:
	movq %rax, %rdi
	call assertion
label640:
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
