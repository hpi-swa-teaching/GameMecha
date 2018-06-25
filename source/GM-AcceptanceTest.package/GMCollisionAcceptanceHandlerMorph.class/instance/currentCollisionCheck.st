collision
currentCollisionCheck
 	^ (String streamContents: [:str |
			str nextPutAll: 'self assertCollision: '.
			str nextPutAll: (self stringFromObject: self submorphs first).
			str nextPutAll: ' with: '.
			str nextPutAll: (self stringFromObject: self submorphs last).
			str nextPutAll: ' equals: '.
			self shouldCollide storeOn: str])