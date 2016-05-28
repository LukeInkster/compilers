
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label652
label650:
	movq $0, %rbx
	movq %rbx, 16(%rbp)
	jmp label648
label652:
label649:
	movq 24(%rbp), %rax
	movq $1, %rbx
	addq %rbx, %rax
	movq %rax, 16(%rbp)
	jmp label648
label648:
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
	movq $0, %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label655
	movq $1, %rax
	jmp label656
label655:
	movq $0, %rax
label656:
	movq %rax, %rdi
	call assertion
	movq $2, %rax
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
	jnz label657
	movq $1, %rax
	jmp label658
label657:
	movq $0, %rax
label658:
	movq %rax, %rdi
	call assertion
	movq $3, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	movq $2, %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label659
	movq $1, %rax
	jmp label660
label659:
	movq $0, %rax
label660:
	movq %rax, %rdi
	call assertion
label654:
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
