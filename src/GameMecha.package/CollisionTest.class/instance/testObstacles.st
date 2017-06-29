obstacle
testObstacles
	|obstacle player world collisionCounter|
	
	world := CollisionWorld new.
		
	collisionCounter := 0.
	world registerCollisionHandler: [:collisionEvent |  collisionEvent collidersIntersect ifTrue: [collisionCounter := collisionCounter + 1]].
	
	obstacle := RectangleCollider wrap: RectangleMorph new.
	player := RectangleCollider wrap: RectangleMorph new.
	
	obstacle markAsObstacle.	
	obstacle bounds: (547@88 corner: 683@229).	
	player bounds: (302@112 corner: 387@180).
	"
	world openInWorld.
	Debugger halt.
	"
	world step.	
	world step.	
	world addCollider: obstacle.
	world step.	
	world step.	
	world addCollider: player.
	world step.	
	world step.	
		
	self assert: collisionCounter equals: 0.	
			
	player bounds: (487@118 corner: 572@186).
	world step.	
	world step.	
	world step.	
	world step.	
	world step.	
	self assert: collisionCounter equals: 1.
	self assert: (player touches: obstacle).

	obstacle unmarkAsObstacle.
	
			
	player bounds: (487@118 corner: 572@186).
	world step.	
	self assert: collisionCounter equals: 2.
	world step.	
	self assert: collisionCounter equals: 3.