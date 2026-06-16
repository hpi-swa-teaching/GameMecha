ui-components
exportButton

	^ SimpleButtonMorph new
		label: 'export';
		color: self buttonColor;
		borderColor: Color transparent;
		target: [
			self colliderTree morph: self selectedMorph.
			self colliderTree children isEmpty
				ifTrue: [UIManager default inform: 'The Collider is Empty']
				ifFalse: [
					self uploadIntoAssetLoaderIntoProject: self gitAssetProjectName.
					UIManager default inform: 'Succecfully exported collider into the GitAssetLoader. Do not forget to commit and push ']];
		actionSelector: #value;
		borderWidth: 1