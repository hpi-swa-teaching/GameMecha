ui-components
selectButton

	^ SimpleButtonMorph new
		label: 'Select';
		color: self buttonColor;
		borderColor: Color transparent;
		target: GMEditorClassSearchTool new;
		actionSelector: #open;
		borderWidth: 1