ui-components
removeButton

	^ SimpleButtonMorph new
		label: 'remove';
		color: self buttonColor;
		borderColor: Color transparent;
		target: [
			self selectedMorph isNil
				ifTrue: [UIManager default inform: 'You need to select a Morph from the list first!.']
				ifFalse: [
					self selectedMorph == self activeMorph
						ifTrue: [UIManager default inform: 'You can not remove your importet Morph!']
						ifFalse: [
							self canvasMorph removeMorphFromCanvas: self selectedMorph.
							self selectedMorph: nil].
					self updateSidebarColliderList]];
		actionSelector: #value;
		borderWidth: 1