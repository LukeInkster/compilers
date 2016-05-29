
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
	jnz label398
	movq $1, %rax
	jmp label399
label398:
	movq $0, %rax
label399:
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
	jnz label400
	movq $1, %rax
	jmp label401
label400:
	movq $0, %rax
label401:
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
	jnz label402
	movq $1, %rax
	jmp label403
label402:
	movq $0, %rax
label403:
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
	jnz label404
	movq $1, %rax
	jmp label405
label404:
	movq $0, %rax
label405:
	movq %rax, %rdi
	call assertion
label397:
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
