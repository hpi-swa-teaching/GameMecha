obstacle
testObstacles
	|obstacle player collisionCounter|
	
	collisionWorld := PasteUpMorph new.
	collisionWorld collisionWorldBehavior: (CollisionWorldBehavior newOn: collisionWorld).
	collisionWorld extent: 800 @ 600.
	
	collisionCounter := 0.
	collisionWorld registerCollisionWorldHandler: [:collisionEvent | collisionEvent collidersIntersect ifTrue: [collisionCounter := collisionCounter + 1]].
	obstacle := RectangleMorph new.
	obstacle collisionBehavior: (RectangleCollisionBehavior newOn: obstacle).
	player := RectangleMorph new.
	player collisionBehavior: (RectangleCollisionBehavior newOn: player).
	
	obstacle markAsObstacle.	
	obstacle bounds: (547@88 corner: 683@229).	
	player bounds: (302@112 corner: 387@180).
	"
	collisionWorld openInWorld.
	Debugger halt.
	"
	collisionWorld step.	
	collisionWorld step.	
	collisionWorld addCollider: obstacle.
	collisionWorld step.	
	collisionWorld step.	
	collisionWorld addCollider: player.
	collisionWorld step.	
	collisionWorld step.	
		
	self assert: collisionCounter equals: 0.	
			
	player bounds: (487@118 corner: 572@186).
	collisionWorld step.	
	collisionWorld step.	
	collisionWorld step.	
	collisionWorld step.	
	collisionWorld step.	
	self assert: collisionCounter equals: 1.
	self assert: (player touches: obstacle).

	obstacle unmarkAsObstacle.
	
			
	player bounds: (487@118 corner: 572@186).
	collisionWorld step.	
	self assert: collisionCounter equals: 2.
	collisionWorld step.	
	self assert: collisionCounter equals: 3.