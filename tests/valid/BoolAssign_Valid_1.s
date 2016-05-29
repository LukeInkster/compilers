
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
	jnz label101
	movq $1, %rax
	jmp label102
label101:
	movq $0, %rax
label102:
	movq %rax, %rdi
	call assertion
	movq $0, %rax
	movq %rax, -8(%rbp)
	movq -8(%rbp), %rax
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label103
	movq $1, %rax
	jmp label104
label103:
	movq $0, %rax
label104:
	movq %rax, %rdi
	call assertion
label100:
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
