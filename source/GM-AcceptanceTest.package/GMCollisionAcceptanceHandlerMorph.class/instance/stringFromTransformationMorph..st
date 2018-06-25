printing
stringFromTransformationMorph: aTransformationMorph
	^ String streamContents: [:str | str nextPutAll: '(self rotatedRectangleShellWithAngle: '. aTransformationMorph angle storeOn: str.
		str nextPutAll: ' andCollision: '. aTransformationMorph collisionDetectionStrategy class storeOn: str.
 		str nextPutAll: ' andExtent: '. aTransformationMorph renderedMorph extent storeOn: str.
	  	str nextPutAll: ' atPosition: '. aTransformationMorph position storeOn: str. str nextPutAll: ')']