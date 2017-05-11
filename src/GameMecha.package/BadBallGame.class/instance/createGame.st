as yet unclassified
createGame
	| world |
	world := CollisionWorld new.
	world bounds: (10 asPoint corner: 800@600).
	
	BadBallGameObstacle new initialize: world at: (100@60).
	BadBallGameObstacle new initialize: world at: (200@70).
	BadBallGameObstacle new initialize: world at: (20@100).
	
	world openInWorld.
	"world registerCollisionHandler: [:anEvent | world delete]."
	BadBallGameBall new initialize: world.