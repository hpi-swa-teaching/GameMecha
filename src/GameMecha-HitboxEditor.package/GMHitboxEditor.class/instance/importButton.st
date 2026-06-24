ui-components
importButton

	^ SimpleButtonMorph new
		label: 'import';
		color: self buttonColor;
		borderColor: Color transparent;
		target: [
			self selectedMorph
				ifNil: [UIManager default inform: 'You have to select a Morph first']
				ifNotNil: [self importAssetFomAssetLoader]];
		actionSelector: #value;
		borderWidth: 1