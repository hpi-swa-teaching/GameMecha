obstacle
testObstacles
	|obstacle player world collisionCounter|
	
	world := CollisionWorld new.
		
	collisionCounter := 0.
	world registerCollisionHandler: [:collisionEvent | collisionCounter := collisionCounter + 1].
	
	obstacle := RectangleCollisionDecorator wrap: RectangleMorph new.
	player := RectangleCollisionDecorator wrap: RectangleMorph new.
	
	obstacle markAsObstacle.	
	obstacle bounds: (547@88 corner: 683@229).	
	player bounds: (302@112 corner: 387@180).
	
	world addCollider: obstacle.
	world addCollider: player.
	
	world step.	
	obstacle step.
	player step.
	self assert: collisionCounter equals: 0.	
			
	player bounds: (487@118 corner: 572@186).
	
	world step.	
	obstacle step.
	player step.
	world step.	
	obstacle step.
	player step.
	world step.	
	obstacle step.
	player step.
	self assert: collisionCounter equals: 1.

	obstacle unmarkAsObstacle.
	
			
	player bounds: (487@118 corner: 572@186).
	world step.	
	self assert: collisionCounter equals: 2.
	world step.	
	self assert: collisionCounter equals: 3.
	
	