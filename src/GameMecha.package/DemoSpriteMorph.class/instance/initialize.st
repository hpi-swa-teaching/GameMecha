as yet unclassified
initialize
	super initialize.
	self keyboard: Keyboard new.
	self anim: ((((AnimationDefinition
			fromSpriteSheet: 'cg_sprite_running.png'
			on: (ImageCache newOn: 'HOP')
			withColumns: 45
			andRows: 15)
		looping: true;
		frameTime: 42)
		subAnimationFrom: 1 to: 640)
		splitAndStart: 16).
	ActiveHand newKeyboardFocus: self.