collision
currentCollisionCheck
 	^ (String streamContents: [:str | | container |
	 		container := self.
			str nextPutAll: 'self assertCollision: '.
			str nextPutAll: (self stringFromMorph: self submorphs first).
			str nextPutAll: ' with: '.
			str nextPutAll: (self stringFromMorph: self submorphs last).
			str nextPutAll: ' equals: '.
			self shouldCollide storeOn: str])