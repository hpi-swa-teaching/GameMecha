The idea of animations is roughly the following:


(AnimationDefinition
	fromSpriteSheet: 'sheet.png'
	on: myCache
	withDimensions: 3@4)
		frameTime: 100;
		looping: true;
		yourself

myAnimationDefinition subAnimationFrom: 3 to: 7

myAnimation := myAnimationDefinition new

MyImageMorph>>step
	self isRunning
		ifTrue: [self runningAnimation displayOn: self]
		ifFalse: [self standingAnimation displayOn: self]
	


		
	