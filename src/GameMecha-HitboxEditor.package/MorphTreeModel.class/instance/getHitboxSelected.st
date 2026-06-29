accessing
getHitboxSelected

	self canvasMorph activeHitbox ifNotNil: [^ self canvasMorph activeHitbox content].
	^ nil