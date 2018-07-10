printing
stringFromTransformationMorph: aTransformationMorph
	^ String streamContents: [:str | str nextPutAll: '(self rotatedRectangleShellWithAngle: '. aTransformationMorph angle storeOn: str.
		str nextPutAll: self newlineWithIndentation, 'withScale: '. aTransformationMorph scaleFactor storeOn: str.
	  	str nextPutAll: self newlineWithIndentation, ' atPosition: '. aTransformationMorph position storeOn: str. str nextPutAll: ')']