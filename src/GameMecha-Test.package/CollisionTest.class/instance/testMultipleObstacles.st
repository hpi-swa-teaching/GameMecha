obstacle
testMultipleObstacles
	|obstacle1 obstacle2 player world|
	
	world := CollisionWorld new.
	world extent: 800 @ 600.
	
	obstacle1 := RectangleCollider wrap: RectangleMorph new.
	obstacle2 := RectangleCollider wrap: RectangleMorph new.
	player := RectangleCollider wrap: RectangleMorph new.
	
	obstacle1 markAsObstacle.	
	obstacle1 bounds: (300@200 extent: 100@100).	
		
	obstacle2 markAsObstacle.	
	obstacle2 bounds: (200@300 extent: 100@100).	
		
	player bounds: (200@200 extent: 80@80).
			
	world addCollider: player.
	world addCollider: obstacle1.
	world addCollider: obstacle2.
	"
	world openInWorld.
	Debugger halt.
	"
	world step.
	self deny: (player touches: obstacle1).
	self deny: (player touches: obstacle2).
	
	player position: player position 	+ (50@0).
	world step.	
	self deny: (player intersects: obstacle1).
	self assert: (player touches: obstacle1).
		
	player position: player position 	+ 50.
	world step.
	self deny: (player intersects: obstacle1).
	self assert: (player touches: obstacle1).
	self deny: (player intersects: obstacle2).
	self assert: (player touches: obstacle2).
	world delete.