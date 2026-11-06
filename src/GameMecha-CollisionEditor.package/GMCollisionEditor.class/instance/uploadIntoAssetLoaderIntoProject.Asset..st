import-export
uploadIntoAssetLoaderIntoProject: aProjectName Asset: anAssetName

	| loader workingCopy path mapper assetFile content |
	[loader := GitAssetLoader for: aProjectName basePath: self gitAssetProjectBasePath.
	] on: Error do: [
	UIManager default inform: 'There is no Project with the name ', aProjectName.
	self refreshGitAssetLoaderValues.
	self uploadIntoAssetLoaderIntoProject: self gitAssetProjectName Asset: anAssetName. 
	^ aProjectName].
	workingCopy := loader workingCopy.
	path := loader nameToPath: anAssetName, '.ston'.
	
	content := (self colliderTree exportColliderInRelationTo: self selectedMorph) toPrettyString.
	
	mapper := GSPlaintextMapper new path: path.
	assetFile := GSPresentAssetFile withMapper: mapper asset: content.
	
	workingCopy addMapper: mapper.
	mapper materialize: assetFile in: workingCopy