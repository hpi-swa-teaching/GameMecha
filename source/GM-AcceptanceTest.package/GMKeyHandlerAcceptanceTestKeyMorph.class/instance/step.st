stepping and presenter
step
	(self isKeyPressed: self listenToKey) 
		ifTrue: [self color: Color gray]
		ifFalse: [self color: Color white].