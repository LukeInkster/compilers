
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
	jnz label810
label808:
	movq $1, %rcx
	subq $16, %rsp
	movq %rax, 0(%rsp)
	movq %rcx, %rdi
	call assertion
	movq 0(%rsp), %rax
	addq $16, %rsp
	jmp label806
	jmp label809
label810:
	movq $2, %rbx
	cmpq %rax, %rbx
	jnz label812
label809:
	movq $0, %rcx
	subq $16, %rsp
	movq %rax, 0(%rsp)
	movq %rcx, %rdi
	call assertion
	movq 0(%rsp), %rax
	addq $16, %rsp
	jmp label806
label812:
label807:
	movq $0, %rax
	movq %rax, %rdi
	call assertion
label806:
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
