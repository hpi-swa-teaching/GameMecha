obstacle
testMultipleObstacles
	|obstacle1 obstacle2 player|
	
	collisionWorld := PasteUpMorph new.
	collisionWorld collisionWorldBehavior: (CollisionWorldBehavior newOn: collisionWorld).
	collisionWorld extent: 800 @ 600.
	
	obstacle1 := RectangleMorph new.
	obstacle1 collisionBehavior: (RectangleCollisionBehavior newOn: obstacle1).
	obstacle2 := RectangleMorph new.
	obstacle2 collisionBehavior: (RectangleCollisionBehavior  newOn: obstacle2).
	player := RectangleMorph new.
	player collisionBehavior: (RectangleCollisionBehavior newOn: player).
	
	obstacle1 markAsObstacle.	
	obstacle1 bounds: (300@200 extent: 100@100).	
		
	obstacle2 markAsObstacle.	
	obstacle2 bounds: (200@300 extent: 100@100).	
		
	player bounds: (200@200 extent: 80@80).
			
	collisionWorld addCollider: player.
	collisionWorld addCollider: obstacle1.
	collisionWorld addCollider: obstacle2.
	"
	collisionWorld openInWorld.
	Debugger halt.
	"
	collisionWorld step.
	self deny: (player touches: obstacle1).
	self deny: (player touches: obstacle2).
	
	player position: player position 	+ (50@0).
	collisionWorld step.	
	self deny: (player intersectsWith: obstacle1).
	self assert: (player touches: obstacle1).
		
	player position: player position 	+ 50.
	collisionWorld step.
	self deny: (player intersectsWith: obstacle1).
	self assert: (player touches: obstacle1).
	self deny: (player intersectsWith: obstacle2).
	self assert: (player touches: obstacle2).