initialize
initializeExportButton

	^ self initializeThemeButton: 'Export' Target: [
		self colliderTree morph: self selectedMorph.
		(self colliderTree children isEmpty or: self selectedMorph == nil)
			ifTrue: [UIManager default inform: 'The Collider is Empty or you have not selected a Morph']
			ifFalse: [ | assetName |
				self validateGitAssetLoaderValues.
				assetName := UIManager default request: 'Please enter the prefered AssetName'.
				self uploadIntoAssetLoaderIntoProject: self gitAssetProjectName Asset: assetName.
				self validateUpload: assetName]]