An AnimationDefinition describes a generic Frame-based Image animation.

Instance Variables
	endIndex:		SmallInteger
	frameTime:		SmallInteger
	looping:		boolean
	spritePath:		String
	startIndex:		SmallInteger
	spriteSheet: 	ImageList

startIndex
	- the end of the interval of images from the sprite that this AnimationDefinition uses

endIndex
	- the end of the interval of images from the sprite that this AnimationDefinition uses

frameTime
	- how many milliseconds pass between two frames

looping
	- true to start this animation again after it finished, false to stay at the last frame

spriteSheet
	- the ImageList that is used for that Animation


The workflow with animations is roughly the following:


(AnimationDefinition
	fromSpriteSheet: 'sheet.png'
	withDimensions: 3@4)
		frameTime: 100;
		looping: true;
		yourself

myAnimation := myAnimationDefinition new

MyImageMorph>>step
	self isAttacking
		ifTrue: [self attackingAnimation displayOn: self]
		ifFalse: [self idleAnimation displayOn: self]