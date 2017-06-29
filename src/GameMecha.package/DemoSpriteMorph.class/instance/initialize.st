as yet unclassified
initialize
	super initialize.
	self anim: ((AnimationDefinition fromSpriteSheet: 'sheet.png' on: (ImageCache newOn: 'HOP') withDimensions: 4@4)
		looping: true;
		frameTime: 200;
		new).