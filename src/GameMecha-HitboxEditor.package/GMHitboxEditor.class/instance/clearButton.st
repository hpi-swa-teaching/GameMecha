ui-components
clearButton

	^ SimpleButtonMorph new
		label: 'clear';
		color: self buttonColor;
		borderColor: Color transparent;
		target: [
			self canvasMorph removeAllMorphsFromCanvas.
			self updateSidebarColliderList];
		actionSelector: #value;
		borderWidth: 1