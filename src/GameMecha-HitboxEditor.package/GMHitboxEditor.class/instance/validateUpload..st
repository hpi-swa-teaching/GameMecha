import-export
validateUpload: anAssetName

	| asset |
	asset := (GitAssetLoader for: self gitAssetProjectName basePath: self gitAssetProjectBasePath) loadAsset: anAssetName.
	asset
		ifNil: [UIManager inform: 'An error occured while uploading the asset into the GitAssetLoader.']
		ifNotNil: [UIManager default inform: 'Succecfully exported collider into the GitAssetLoader. Do not forget to commit and push ']