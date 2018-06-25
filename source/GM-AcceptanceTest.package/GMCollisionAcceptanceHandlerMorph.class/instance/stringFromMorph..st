printing
stringFromMorph: aMorph
	^ String streamContents: [:str | str nextPutAll: '('. aMorph class storeOn: str. str nextPutAll: ' new '.
		str nextPutAll: 'collisionDetectionStrategy: '. aMorph collisionDetectionStrategy class storeOn: str. str nextPutAll: ' new;'.
 		str nextPutAll: 'position: '. aMorph position storeOn: str. str nextPut: $;.
	  	str nextPutAll: 'extent:'. aMorph extent storeOn: str. str nextPutAll: ')']