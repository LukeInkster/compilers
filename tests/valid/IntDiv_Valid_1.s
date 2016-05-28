
	.text
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	movq $10, %rax
	movq $2, %rbx
	movq %rax, %rax
	cqto
	idivq %rbx
	movq %rax, %rax
	movq $5, %rbx
	cmpq %rax, %rbx
	jnz label344
	movq $1, %rax
	jmp label345
label344:
	movq $0, %rax
label345:
	movq %rax, %rdi
	call assertion
	movq $10, %rax
	movq $3, %rbx
	movq %rax, %rax
	cqto
	idivq %rbx
	movq %rax, %rax
	movq $3, %rbx
	cmpq %rax, %rbx
	jnz label346
	movq $1, %rax
	jmp label347
label346:
	movq $0, %rax
label347:
	movq %rax, %rdi
	call assertion
	movq $-10, %rax
	movq $3, %rbx
	movq %rax, %rax
	cqto
	idivq %rbx
	movq %rax, %rax
	movq $-3, %rbx
	cmpq %rax, %rbx
	jnz label348
	movq $1, %rax
	jmp label349
label348:
	movq $0, %rax
label349:
	movq %rax, %rdi
	call assertion
	movq $1, %rax
	movq $4, %rbx
	movq %rax, %rax
	cqto
	idivq %rbx
	movq %rax, %rax
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label350
	movq $1, %rax
	jmp label351
label350:
	movq $0, %rax
label351:
	movq %rax, %rdi
	call assertion
label343:
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
