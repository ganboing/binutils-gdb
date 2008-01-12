	.text
# All the following should be illegal for x86-64
        aaa		# illegal
        aad		# illegal
        aam		# illegal
        aas		# illegal
        arpl %ax,%ax	# illegal
        bound %eax,(%rax) # illegal
	calll *%eax	# 32-bit data size not allowed
        calll *(%ax)	# 32-bit data size not allowed
        calll *(%eax)	# 32-bit data size not allowed
        calll *(%r8)	# 32-bit data size not allowed
        calll *(%rax)	# 32-bit data size not allowed
        callq *(%ax)	# 32-bit data size not allowed
        callw *(%ax)	# no 16-bit addressing
        daa		# illegal
        das		# illegal
        enterl $0,$0	# can't have 32-bit stack operands
        into		# illegal
foo:	jcxz foo	# No prefix exists to select CX as a counter
	jmpl *%eax	# 32-bit data size not allowed
        jmpl *(%rax)	# 32-bit data size not allowed
        lcalll $0,$0	# illegal
        lcallq $0,$0	# illegal
        ldsl %eax,(%rax) # illegal
        ldsq %rax,(%rax) # illegal
        lesl %eax,(%rax) # illegal
        lesq %rax,(%rax) # illegal
        ljmpl $0,$0	# illegal
        ljmpq $0,$0	# illegal
        ljmpq *(%rax)	# 64-bit data size not allowed
	loopw foo	# No prefix exists to select CX as a counter
	loopew foo	# No prefix exists to select CX as a counter
	loopnew foo	# No prefix exists to select CX as a counter
	loopnzw foo	# No prefix exists to select CX as a counter
	loopzw foo	# No prefix exists to select CX as a counter
        leavel		# can't have 32-bit stack operands
        pop %ds		# illegal
        pop %es		# illegal
        pop %ss		# illegal
        popa		# illegal
        popl %eax	# can't have 32-bit stack operands
        push %cs	# illegal
        push %ds	# illegal
        push %es	# illegal
        push %ss	# illegal
        pusha		# illegal
        pushl %eax	# can't have 32-bit stack operands
        pushfl		# can't have 32-bit stack operands
	popfl		# can't have 32-bit stack operands
	retl		# can't have 32-bit stack operands
	insertq $4,$2,%xmm2,%ebx # The last operand must be XMM register.
	fnstsw %eax
	fnstsw %al
	fstsw %eax
	fstsw %al
	in $8,%rax
	out %rax,$8

	.intel_syntax noprefix
	cmpxchg16b dword ptr [rax] # Must be oword
	movq xmm1, XMMWORD PTR [rsp]
	movq xmm1, DWORD PTR [rsp]
	movq xmm1, WORD PTR [rsp]
	movq xmm1, BYTE PTR [rsp]
	movq XMMWORD PTR [rsp],xmm1
	movq DWORD PTR [rsp],xmm1
	movq WORD PTR [rsp],xmm1
	movq BYTE PTR [rsp],xmm1
	fnstsw eax
	fnstsw al
	fstsw eax
	fstsw al
	in rax,8
	out 8,rax
