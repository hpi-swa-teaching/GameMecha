initialize
initializeClearButton

	^ self initializeThemeButton: 'Clear' Target: [
		(UIManager default confirm: 'You are about to clear your Canvas! Are you sure you want to do that?') ifTrue: [
			self canvasMorph removeAllMorphsFromCanvas.
			self selectedMorph: nil.
			self updateSidebarColliderList]]