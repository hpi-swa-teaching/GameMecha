as yet unclassified
createWalls
	self
		addCollider:
			((BadPerfDemoOstacle wrap: RectangleMorph new)
				position: self position;
				extent: self width @ 10;
				yourself);
		addCollider:
			((BadPerfDemoOstacle wrap: RectangleMorph new)
				position: self position x @ (self position y + self height - 10);
				extent: self width @ 10;
				yourself);
		addCollider:
			((BadPerfDemoOstacle wrap: RectangleMorph new)
				position: self position x @ 0;
				extent: 10 @ self height;
				yourself);
		addCollider:
			((BadPerfDemoOstacle wrap: RectangleMorph new)
				position: (self position x + self width - 10) @ 0;
				extent: 10 @ self height;
				yourself).