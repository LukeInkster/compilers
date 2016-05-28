
	.text
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq $1, %rax
	movq %rax, -8(%rbp)
	movq -8(%rbp), %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label695
label693:
	movq $1, %rbx
	subq $16, %rsp
	movq %rax, 0(%rsp)
	movq %rbx, %rdi
	call assertion
	movq 0(%rsp), %rax
	addq $16, %rsp
	jmp label691
	jmp label694
label695:
	movq $2, %rbx
	cmpq %rax, %rbx
	jnz label697
label694:
	movq $0, %rbx
	subq $16, %rsp
	movq %rax, 0(%rsp)
	movq %rbx, %rdi
	call assertion
	movq 0(%rsp), %rax
	addq $16, %rsp
	jmp label691
label697:
label692:
	movq $0, %rax
	movq %rax, %rdi
	call assertion
label691:
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
