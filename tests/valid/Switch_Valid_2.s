
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
	jnz label732
label730:
	movq $1, %rbx
	subq $16, %rsp
	movq %rax, 0(%rsp)
	movq %rbx, %rdi
	call assertion
	movq 0(%rsp), %rax
	addq $16, %rsp
	jmp label728
	jmp label731
label732:
	movq $2, %rbx
	cmpq %rax, %rbx
	jnz label734
label731:
	movq $0, %rbx
	subq $16, %rsp
	movq %rax, 0(%rsp)
	movq %rbx, %rdi
	call assertion
	movq 0(%rsp), %rax
	addq $16, %rsp
	jmp label728
label734:
label729:
	movq $0, %rax
	movq %rax, %rdi
	call assertion
label728:
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
