as yet unclassified
rotatedRectangleShellWithAngle: anAngle andCollision: aCollision andExtent: anExtent atPosition: aPosition
		| rotatedRectangleShell |
		rotatedRectangleShell := ((self newMorphWithOwnerFromExtent: anExtent)
				center: aPosition;
				addFlexShell;
				owner).
		^ rotatedRectangleShell collisionDetectionStrategy: aCollision new;
			angle: anAngle;
			yourself.
			