ui-components
exportButton

	^ SimpleButtonMorph new
		label: 'export';
		color: self buttonColor;
		borderColor: Color transparent;
		target: [
			self colliderTree morph: selectedMorph.
			UIManager default inform: (self colliderTree exportColliderInRelationTo: self selectedMorph) toPrettyString];
		actionSelector: #value;
		borderWidth: 1