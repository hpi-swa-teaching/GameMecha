initialize
initializeImportButton

	^ self initializeThemeButton: 'Import' Target: [
		self selectedMorph
			ifNil: [UIManager default inform: 'You have to select a Morph first']
			ifNotNil: [self importAssetFomAssetLoader]]