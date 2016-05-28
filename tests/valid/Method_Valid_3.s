
	.text
wl_nop:
	pushq %rbp
	movq %rsp, %rbp
label393:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_id:
	pushq %rbp
	movq %rsp, %rbp
	call wl_nop
	movq 24(%rbp), %rax
	movq %rax, 16(%rbp)
	jmp label394
label394:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_test:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq $1, %rax
	movq %rax, 8(%rsp)
	call wl_id
	addq $16, %rsp
	movq -16(%rsp), %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label396
	movq $1, %rax
	jmp label397
label396:
	movq $0, %rax
label397:
	movq %rax, %rdi
	call assertion
	subq $16, %rsp
	movq $-1, %rax
	movq %rax, 8(%rsp)
	call wl_id
	addq $16, %rsp
	movq -16(%rsp), %rax
	movq $-1, %rbx
	cmpq %rax, %rbx
	jnz label398
	movq $1, %rax
	jmp label399
label398:
	movq $0, %rax
label399:
	movq %rax, %rdi
	call assertion
label395:
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
