as yet unclassified
testAnimations
	|cache animDef anim testmorph|
	cache := ImageCache newOn: 'GMTest'.
	animDef := AnimationDefinition
		fromSpriteSheet: 'sheet.png'
		on: cache
		withColumns: 4
		andRows: 4.
	animDef looping: false.
	animDef frameTime: 50.
	self assert: 16 equals: animDef frameCount.
	
	anim := animDef new.
	self assert: anim definition equals: animDef.
	self assert: anim currentFrameNumber equals: 0.
	(Delay forMilliseconds: 75) wait. "this should lead the animation to be exactly at position 2"
	self assert: anim currentFrameNumber equals: 1.
	
	testmorph := ImageMorph new.
	anim displayOn: testmorph.
	self assert: 154@200 equals: testmorph bounds extent.