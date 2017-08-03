as yet unclassified
initialize
	|keyHandler|
	super initialize.
	WebResources ensureFile: 'http://colpa.infine.casa:81/default-resources/bastion/bastion_running.png' isAt: 'GMTest/bastion_running.png'.

	keyHandler := KeyHandler new.
	keyHandler addBinding: (
			KeyBinding new
				bindToKey: #keyEscape;
				onUpSend: #delete to: self) as: #exit.
	self registerKeyHandler: keyHandler.

	"this animation consists of 16 sub-animations that have 40 frames each"
	self anim: ((((AnimationDefinition
				fromSpriteSheet: (SpriteSheet fromFile: 'GMTest/bastion_running.png'
				rows: 15
				columns: 45
				))
			looping: true;
			frameTime: 50;
			yourself)
		subAnimationFrom: 1 to: 640)
		splitAndStart: 16).
	ActiveHand newKeyboardFocus: self.