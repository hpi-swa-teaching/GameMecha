as yet unclassified
initialize
	super initialize.
	self keyboard: Keyboard new.
	self anim: (((((AnimationDefinition
			fromSpriteSheet: 'cg_sprite_running.png'
			on: (ImageCache newOn: 'HOP')
			withDimensions: 45@15)
		looping: true;
		frameTime: 50) subAnimationFrom: 0 to: 639)
		split: 16)
		collect: [:a | a new]).
	ActiveHand newKeyboardFocus: self.