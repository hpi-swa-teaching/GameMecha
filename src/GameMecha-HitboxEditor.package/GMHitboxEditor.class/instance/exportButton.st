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
				ifFalse: [ | assetName |
					self validateGitAssetLoaderValues.
					assetName := UIManager default request: 'Please enter the prefered AssetName'.
					self uploadIntoAssetLoaderIntoProject: self gitAssetProjectName Asset: assetName.
					self validateUpload: assetName]];
		actionSelector: #value;
		borderWidth: 1