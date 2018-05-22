stepping and presenter
step
	(self isKeyPressed: Character space) ifTrue: [self shuffleMorphs].
	self evaluateMorphs.