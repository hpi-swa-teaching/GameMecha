ui-components
removeButton

	^ SimpleButtonMorph new
		label: 'remove';
		color: self buttonColor;
		borderColor: Color transparent;
		target: [
			"check if the user ia about to remove the selected Morph. This needs to be commented out after the refactor, because it does not work at the moment. Do not forget the Brackets in Line 16! "
			"self selectedMorph == self activeMorph
				ifTrue: [UIManager default inform: 'You can not remove your selected Morph!']
				ifFalse: ["
					self selectedMorph isNil
						ifTrue: [UIManager default inform: 'You need to select a Morph from the list first!.']
						ifFalse: [self canvasMorph removeMorphFromCanvas: self selectedMorph].
					self updateSidebarColliderList]"]";
		actionSelector: #value;
		borderWidth: 1