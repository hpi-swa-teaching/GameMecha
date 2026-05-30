ui-components
textfieldFixedSize

	^ TextMorph new
		contents: '';
		vResizing: #rigid;
		height: 18 px;
		hResizing: #rigid;
		width: 60 px;
		borderWidth: 1;
		borderColor: Color transparent;
		color: self textColor;
		backgroundColor: self textFieldColor