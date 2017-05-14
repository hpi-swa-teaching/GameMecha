initializing
createGame
	| world |
	world := CollisionWorld new.
	world bounds: (10 asPoint corner: 800@600).
	
	GoodBallGameObstacle new initialize: world at: (100@60).
	GoodBallGameObstacle new initialize: world at: (200@70).
	GoodBallGameObstacle new initialize: world at: (20@100).
	
	world openInWorld.
	"world registerCollisionHandler: [:anEvent | world delete]."
	GoodBallGameBall new initialize: world.