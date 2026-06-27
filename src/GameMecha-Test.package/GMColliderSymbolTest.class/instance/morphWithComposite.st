accessing
morphWithComposite

	^ GMCollisionTestMorph new
		collider: (GMCompositeCollider new
			layers: #(1);
			mask: #(1);
			symbol: #player;
			addChild: (GMPrimitiveRectangleCollider new
				width: 50;
				height: 50;
				center: 0 @ 0;
				symbol: #head;
				yourself);
			addChild: (GMPrimitiveRectangleCollider new
				width: 50;
				height: 50;
				center: 200 @ 0;
				symbol: #body;
				yourself);
			yourself);
		center: 0 @ 0;
		yourself