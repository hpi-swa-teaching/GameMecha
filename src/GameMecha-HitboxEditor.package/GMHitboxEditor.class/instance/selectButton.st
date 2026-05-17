as yet unclassified
selectButton

	| btn |
	btn := SimpleButtonMorph new.
	btn
		label: 'Select';
		color: Color gray;
		borderColor: Color lightBlue;
		target: GMEditorClassSearchTool new;
		actionSelector: #open;
		borderWidth: 1.
	^ btn