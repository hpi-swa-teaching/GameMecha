as yet unclassified
createWalls
	"creates 4 walls, so that the colliders repel from the border of the world"
	self
		addCollider:
			(BadPerfDemoObstacle new
				position: self position;
				extent: self width @ 10;
				yourself);
		addCollider:
			 (BadPerfDemoObstacle new
				position: self position x @ (self position y + self height - 10);
				extent: self width @ 10;
				yourself);
		addCollider:
			(BadPerfDemoObstacle new
				position: self position x @ 0;
				extent: 10 @ self height;
				yourself);
		addCollider:
			(BadPerfDemoObstacle new
				position: (self position x + self width - 10) @ 0;
				extent: 10 @ self height;
				yourself).