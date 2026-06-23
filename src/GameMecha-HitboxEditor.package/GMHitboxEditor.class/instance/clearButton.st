ui-components
clearButton

	^ SimpleButtonMorph new
		label: 'clear';
		color: self buttonColor;
		borderColor: Color transparent;
		target: [
			(UIManager default confirm: 'You are about to your Canvas! Are you sure you want to do that?')
				ifTrue: [
					self canvasMorph removeAllMorphsFromCanvas.
					self updateSidebarColliderList];
				ifFalse: [nil]];
		actionSelector: #value;
		borderWidth: 1