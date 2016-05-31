
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label610
label608:
	movq 24(%rbp), %rcx
	movq $10, %rdx
	addq %rdx, %rcx
	movq %rcx, 24(%rbp)
	jmp label609
label610:
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label612
label609:
	movq 24(%rbp), %rcx
	movq %rcx, 16(%rbp)
	jmp label606
	jmp label611
label612:
label611:
	movq $0, %rcx
	movq %rcx, 16(%rbp)
	jmp label606
label614:
label607:
label606:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	movq $10, %rax
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
	jnz label617
	movq $1, %rax
	jmp label618
label617:
	movq $0, %rax
label618:
	movq %rax, %rdi
	call assertion
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
	jnz label619
	movq $1, %rax
	jmp label620
label619:
	movq $0, %rax
label620:
	movq %rax, %rdi
	call assertion
	movq $0, %rax
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
	jnz label621
	movq $1, %rax
	jmp label622
label621:
	movq $0, %rax
label622:
	movq %rax, %rdi
	call assertion
label616:
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
