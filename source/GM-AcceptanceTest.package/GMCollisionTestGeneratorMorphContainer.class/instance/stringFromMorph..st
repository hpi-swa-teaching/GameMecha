printing
stringFromMorph: aMorph
	^ String streamContents: [:str | str nextPutAll: '('. aMorph class storeOn: str. str nextPutAll: ' new '.
		str nextPutAll: self class newlineWithIndentation, 'gmCollisionDetectionStrategy: '. aMorph gmCollisionDetectionShape storeOn: str. str nextPut: $;.
 		str nextPutAll: self class newlineWithIndentation, 'position: '. aMorph position storeOn: str. str nextPut: $;.
	  	str nextPutAll: self class newlineWithIndentation, 'extent: '. aMorph extent storeOn: str. str nextPutAll: ')']