initializing
createGame
	|cache|
	cache := ImageCache newOn: 'HOP'.
	super initialize.
	self bounds: (10 asPoint corner: 800@600).
	self keyboard: Keyboard new.
	self addCollider: ((GoodBallGameObstacle wrap: (LazyImageMorph newWithImage: 'res/img/wall.png' from: cache placeHolder: Color red bounds: (20@300 extent: 60@60)))).
	self addCollider: ((GoodBallGameObstacle wrap: RectangleMorph new)
		position: (200@70);
		yourself).
	
	"world registerCollisionHandler: [:anEvent | world delete]."
	ball := GoodBallGameBall wrap: (LazyImageMorph newWithImage: 'res/img/switch1.png' from: cache placeHolder: Color red bounds: (20@20 extent: 60@60)).
	ball keyboard: self keyboard.
	self addCollider: ball.
	
	
	self addCollider: ((GoodBallGameObstacle wrap: RectangleMorph new)
		position: (20@100);
		yourself).
		
	self addCollider: ((GoodBallGameMovingObstacle wrap: RectangleMorph new)
		startPosition: (250@200);
		endPosition: (160@240);
		yourself).
	
	
	self openInWorld.
	
	ActiveHand newKeyboardFocus: self.