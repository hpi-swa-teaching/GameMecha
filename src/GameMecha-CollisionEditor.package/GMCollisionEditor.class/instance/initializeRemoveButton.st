initialize-release
initializeRemoveButton

	^ self initializeThemeButton: 'Remove' Target: [
		self canvasMorph activeMorph isNil
			ifTrue: [UIManager default inform: 'You need to select a Morph from the list first!.']
			ifFalse: [
				self removeEditorNode: self canvasMorph activeMorph editorNode.
				self canvasMorph activeMorph removeHitbox.
				self canvasMorph activeMorph: nil.
				self updateSidebarColliderList]]