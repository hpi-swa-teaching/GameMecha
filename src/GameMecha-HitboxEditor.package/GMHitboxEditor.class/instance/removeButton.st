ui-components
removeButton

	^ SimpleButtonMorph new
		label: 'remove';
		color: self buttonColor;
		borderColor: Color transparent;
		target: [
			self canvasMorph activeHitbox isNil
				ifTrue: [UIManager default inform: 'You need to select a Morph from the list first!.']
				ifFalse: [
					self canvasMorph activeHitbox removeHitbox.
					self canvasMorph activeHitbox: nil.
					self updateSidebarColliderList]];
		actionSelector: #value;
		borderWidth: 1