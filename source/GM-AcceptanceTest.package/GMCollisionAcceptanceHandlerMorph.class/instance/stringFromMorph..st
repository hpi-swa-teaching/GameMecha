printing
stringFromMorph: aMorph
	^ String streamContents: [:str | str nextPutAll: '('. aMorph class storeOn: str. str nextPutAll: ' new '.
		str nextPutAll: self newlineWithIndentation, 'collisionDetectionStrategy: '. aMorph collisionDetectionStrategy class storeOn: str. str nextPutAll: ' new;'.
 		str nextPutAll: self newlineWithIndentation, 'position: '. aMorph position storeOn: str. str nextPut: $;.
	  	str nextPutAll: self newlineWithIndentation, 'extent:'. aMorph extent storeOn: str. str nextPutAll: ')']