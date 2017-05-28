initializing
createGame
	super initialize.
	self bounds: (10 asPoint corner: 800@600).
	
	self addCollider: ((GoodBallGameObstacle wrap: RectangleMorph new)
		position: (100@60);
		yourself).
	self addCollider: ((GoodBallGameObstacle wrap: RectangleMorph new)
		position: (200@70);
		yourself).
	
	"world registerCollisionHandler: [:anEvent | world delete]."
	ball := GoodBallGameBall wrap: CircleMorph new.
	self addCollider: ball.
	
	
	self addCollider: ((GoodBallGameObstacle wrap: RectangleMorph new)
		position: (20@100);
		yourself).
	
	
	self openInWorld.
	
	self keyboard: Keyboard new.
	ActiveHand newKeyboardFocus: self.