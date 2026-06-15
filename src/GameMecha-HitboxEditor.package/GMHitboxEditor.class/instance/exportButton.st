ui-components
exportButton

	^ SimpleButtonMorph new
		label: 'export';
		color: self buttonColor;
		borderColor: Color transparent;
		target: [
			self colliderTree morph: selectedMorph.
			self uploadIntoAssetLoaderIntoProject: self gitAssetProjectName.
			UIManager default inform: 'Succecfully exported collider into the GitAssetLoader. Do not forget to commit and push '.];
		actionSelector: #value;
		borderWidth: 1