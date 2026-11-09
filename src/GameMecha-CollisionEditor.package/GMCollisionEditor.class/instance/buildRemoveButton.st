creation
buildRemoveButton

	^ self buildThemeButton: 'Remove' Target: [
		self canvasMorph activeMorph isNil
			ifTrue: [UIManager default inform: 'You need to select a Morph from the list first!.']
			ifFalse: [
				self removeMorphFromCanvas: self canvasMorph activeMorph.
				self canvasMorph activeMorph: nil]]