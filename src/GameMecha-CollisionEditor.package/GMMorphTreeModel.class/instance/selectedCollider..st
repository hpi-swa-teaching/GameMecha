accessing
selectedCollider: aMorph

	| container |
	container := self canvasMorph viewport submorphs
		detect: [:m | (m isKindOf: GMResizeContainer) and: [m content == aMorph]]
		ifNone: [nil].
	container ifNotNil: [self canvasMorph activeMorph: container].
	self changed: #morphTree.
	self changed: #selectedItem