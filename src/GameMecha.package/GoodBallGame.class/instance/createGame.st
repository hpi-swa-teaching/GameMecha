initializing
createGame
	|cache waterMorph|
	WebResources ensureFile: 'http://colpa.infine.casa:81/default-resources/other/smile.png' isAt: 'GMTest/smile.png'.
	cache := ImageCache newOn: 'GMTest'.
	super initialize.
	self bounds: (10 asPoint corner: 800@600).
	self keyboard: Keyboard new.
	self addCollider: ((GoodBallGameObstacle wrap: (LazyImageMorph newWithImage: 'smile.png' from: cache placeHolder: Color red bounds: (20@300 extent: 60@60)))).
	self addCollider: ((GoodBallGameObstacle wrap: RectangleMorph new)
		position: (200@70);
		yourself).
	
	"world registerCollisionHandler: [:anEvent | world delete]."
	ball := GoodBallGameBall wrap: (LazyImageMorph newWithImage: '/smile.png' from: cache placeHolder: Color red bounds: (20@20 extent: 60@60)).
	ball keyboard: self keyboard.
	self addCollider: ball.
	
	waterMorph := RepeatingImageMorph new.
	waterMorph image: (cache getTexture: 'smile.png').
	waterMorph extent: 120@130.
	waterMorph baseScale: 0.3@0.7.
	waterMorph offset: 10@20.
	water := GoodBallGameObstacle wrap: waterMorph.
	
	self addCollider: (water
		position: (20@100);
		yourself).
		
	self addCollider: ((GoodBallGameMovingObstacle wrap: RectangleMorph new)
		startPosition: (250@200);
		endPosition: (160@240);
		yourself).
	
	
	self openInWorld.
	
	ActiveHand newKeyboardFocus: self.