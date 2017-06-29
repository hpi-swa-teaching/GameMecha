as yet unclassified
initialize
	super initialize.
	WebResources ensureFile: 'http://colpa.infine.casa:81/default-resources/bastion/bastion_running.png' isAt: 'GMTest/bastion_running.png'.
	self keyboard: Keyboard new.
	self anim: ((((AnimationDefinition
			fromSpriteSheet: 'bastion_running.png'
			on: (ImageCache newOn: 'GMTest')
			withColumns: 45
			andRows: 15)
		looping: true;
		frameTime: 50)
		subAnimationFrom: 1 to: 640)
		splitAndStart: 16).
	ActiveHand newKeyboardFocus: self.