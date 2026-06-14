running
buildCompositeCollider
	
	| composite circleChild rectChild |
	composite := GMCompositeCollider new.
	composite layers: #(1).
	composite mask: #(1).

	circleChild := GMPrimitiveCircleCollider new
		radius: 20;
		center: -30 @ -30;
		layers: #(1);
		mask: #(1);
		yourself.

	rectChild := GMPrimitiveRectangleCollider new
		width: 40;
		height: 40;
		center: 30 @ 30;
		layers: #(1);
		mask: #(1);
		yourself.

	composite addChild: circleChild.
	composite addChild: rectChild.
	^ composite