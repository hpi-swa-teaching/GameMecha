collision
currentCollisionCheck
 	^ (String streamContents: [:str |
		str nextPutAll: String cr, String tab, 'self assertCollision: '.
		str nextPutAll: (self stringFromObject: self submorphs first).
		str nextPutAll: String cr, String tab, ' with: '.
		str nextPutAll: (self stringFromObject: self submorphs last).
		str nextPutAll: String cr, String tab, ' equals: '.
		self shouldCollide storeOn: str])