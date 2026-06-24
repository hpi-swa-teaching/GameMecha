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
						ifTrue: [
							(UIManager default
								confirm: 'You are about to delete your imported Morph! Are you sure you want to do that?')
								ifTrue: [
									self canvasMorph removeMorphFromCanvas: self selectedMorph.
									self selectedMorph: nil];
								ifFalse: [nil]]
						ifFalse: [
							self canvasMorph removeMorphFromCanvas: self selectedMorph.
							self selectedMorph: nil].
					self updateSidebarColliderList]];
		actionSelector: #value;
		borderWidth: 1