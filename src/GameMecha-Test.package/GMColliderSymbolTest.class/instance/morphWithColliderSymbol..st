accessing
morphWithColliderSymbol: aSymbol

	^ GMCollisionTestMorph new
		collider: (GMPrimitiveRectangleCollider new
			width: 50;
			height: 50;
			center: 0 @ 0;
			layers: #(1);
			mask: #(1);
			symbol: aSymbol;
			yourself);
		center: 0 @ 0;
		yourself