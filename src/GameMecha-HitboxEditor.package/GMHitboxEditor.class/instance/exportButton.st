ui-components
exportButton

	^ SimpleButtonMorph new
		label: 'export';
		color: self buttonColor;
		borderColor: Color transparent;
		target: [ 
			self colliderTree morph: selectedMorph.
			UIManager default inform: (GMColliderExporter new initializeWithRoot: self colliderTree andTargetMorph: self selectedMorph) export toPrettyString.
			];
		actionSelector: #value;
		borderWidth: 1