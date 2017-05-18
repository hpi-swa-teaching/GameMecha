initializing
createGame
	super initialize.
	self bounds: (10 asPoint corner: 800@600).
	
	GoodBallGameObstacle new initialize: self at: (100@60).
	GoodBallGameObstacle new initialize: self at: (200@70).
	GoodBallGameObstacle new initialize: self at: (20@100).
	
	self openInWorld.
	"world registerCollisionHandler: [:anEvent | world delete]."
	ball := GoodBallGameBall new.
	ball initialize: self.
	
	self keyBoardKeys: Dictionary new.
	ActiveHand newKeyboardFocus: self.