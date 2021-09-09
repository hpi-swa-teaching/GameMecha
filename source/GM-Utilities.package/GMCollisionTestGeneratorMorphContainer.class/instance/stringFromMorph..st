printing
stringFromMorph: aMorph
	^ String streamContents: [:str | 
		str nextPutAll: '('. aMorph class storeOn: str. str nextPutAll: ' new '.
		str nextPutAll: self class crWithIndent, 'gmCollisionDetectionStrategy: '. 
			aMorph gmCollisionDetectionShape storeOn: str. str nextPut: $;.
 		str nextPutAll: self class crWithIndent, 'position: '. aMorph position storeOn: str. str nextPut: $;.
	  	str nextPutAll: self class crWithIndent, 'extent: '. aMorph extent storeOn: str. str nextPut: $;.
		str nextPutAll: self class crWithIndent, 'yourself)']