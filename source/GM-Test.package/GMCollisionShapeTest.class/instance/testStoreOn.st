testing
testStoreOn
	self assert: ((Compiler evaluate: 
			((WriteStream on: '')
				store: self strategy;
				contents))
			class)
		equals: self strategy class.
		