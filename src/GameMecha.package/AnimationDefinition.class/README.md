An AnimationDefinition describes a generic Frame-based Image animation.

Instance Variables
	cache:		ImageCache
	endIndex:		SmallInteger
	frameTime:		SmallInteger
	looping:		boolean
	spritePath:		String
	startIndex:		SmallInteger

cache
	- the ImageCache to load the sprite from

startIndex
	- the end of the interval of images from the sprite that this AnimationDefinition uses

endIndex
	- the end of the interval of images from the sprite that this AnimationDefinition uses

frameTime
	- how many milliseconds pass between two frames

looping
	- true to start this animation again after it finished, false to stay at the last frame

spritePath
	- the name of the Sprite file to use


The workflow with animations is roughly the following:


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
	self isAttacking
		ifTrue: [self attackingAnimation displayOn: self]
		ifFalse: [self idleAnimation displayOn: self]