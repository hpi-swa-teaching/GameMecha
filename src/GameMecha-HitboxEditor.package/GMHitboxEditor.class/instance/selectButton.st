as yet unclassified
selectButton

	| btn |
	btn := SimpleButtonMorph new.
	btn
		label: 'Select';
		color: self buttonColor;
		borderColor: Color transparent;
		target: GMEditorClassSearchTool new;
		actionSelector: #open;
		borderWidth: 1.
	^ btn