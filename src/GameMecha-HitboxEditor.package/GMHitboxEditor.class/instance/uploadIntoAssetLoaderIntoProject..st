import-export
uploadIntoAssetLoaderIntoProject: aProjectName

	| loader workingCopy path mapper assetFile content |
	loader := GitAssetLoader for: aProjectName basePath: self gitAssetProjectBasePath.
	workingCopy := loader workingCopy.
	path := loader nameToPath: self currentColliderAssetPathName.
	
	content := (self colliderTree exportColliderInRelationTo: self selectedMorph) toPrettyString.
	
	mapper := GSPlaintextMapper new path: path.
	assetFile := GSAssetFile withMapper: mapper asset: content.
	
	workingCopy addMapper: mapper.
	mapper materialize: assetFile in: workingCopy