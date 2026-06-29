accessing
containerFor: aMorph

	(aMorph isKindOf: GMResizeContainer) ifTrue: [^ aMorph].
	^ aMorph submorphs detect: [:m | m isKindOf: GMResizeContainer] ifNone: [nil]