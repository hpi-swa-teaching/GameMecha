ui-components
selectButton

	^ SimpleButtonMorph new
		label: 'open';
		color: self buttonColor;
		borderColor: Color transparent;
		target: [
			GMEditorClassSearchTool new
				target: self selector: #classSelected:;
				open];
		actionSelector: #value;
		borderWidth: 1