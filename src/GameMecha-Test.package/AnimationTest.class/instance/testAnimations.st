as yet unclassified
testAnimations
	|cache animDef anim testmorph|
	cache := ImageCache newOn: 'HOP'.
	animDef := AnimationDefinition
		fromSpriteSheet: 'sheet.png'
		on: cache
		withColumns: 4
		andRows: 4.
	animDef looping: false.
	animDef frameTime: 5.
	self assert: 16 equals: animDef frameCount.
	
	anim := animDef new.
	self assert: anim definition equals: animDef.
	self assert: anim currentFrameNumber equals: 0.
	(Delay forMilliseconds: 7) wait.
	self assert: anim currentFrameNumber equals: 1.
	
	testmorph := ImageMorph new.
	anim displayOn: testmorph.
	self assert: 154@200 equals: testmorph bounds extent.