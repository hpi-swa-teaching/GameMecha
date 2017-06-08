initializing
createGame
	|cache|
	cache := ImageCache newOn: 'HOP'.
	super initialize.
	self bounds: (10 asPoint corner: 800@600).
	self keyboard: Keyboard new.
	
	self addCollider: ((GoodBallGameObstacle wrap: ImageMorph new)
		position: (100@60);
		image: (cache getTexture: 'res/img\wall.png');
		yourself).
	self addCollider: ((GoodBallGameObstacle wrap: RectangleMorph new)
		position: (200@70);
		yourself).
	
	"world registerCollisionHandler: [:anEvent | world delete]."
	ball := GoodBallGameBall wrap: (ImageMorph new
		image: (cache getTexture: 'smile.png');
		yourself).
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