collision
currentCollisionCheck
 	^ GMCollisionCheck new
		collisionScenario: (String streamContents: [:str | | container |
	 		container := self.
			str nextPutAll: '^ Morph new extent: '. container extent storeOn: str. str nextPut: $;.
	 		container submorphs do: [:morph |
		  		str nextPutAll: 'addMorph: (Morph new '.
				str nextPutAll: 'collisionDetectionStrategy: '. morph collisionDetectionStrategy class storeOn: str. str nextPutAll: ' new;'. 
		 		str nextPutAll: 'position: '. morph position - container position storeOn: str. str nextPut: $;.
			  	str nextPutAll: 'extent:'. morph extent storeOn: str. str nextPutAll: ')'] separatedBy: [str nextPut: $;]]);
		strategies: {self submorphs first collisionDetectionStrategy class.
			self submorphs last collisionDetectionStrategy class}