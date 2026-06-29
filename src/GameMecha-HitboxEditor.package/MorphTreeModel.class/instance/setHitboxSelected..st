accessing
setHitboxSelected: aMorph

	| container |
	container := self canvasMorph viewport submorphs
		detect: [:m | (m isKindOf: GMResizeContainer) and: [m content == aMorph]]
		ifNone: [nil].
	container ifNotNil: [self canvasMorph activeHitbox: container].
	self changed: #morphTree.