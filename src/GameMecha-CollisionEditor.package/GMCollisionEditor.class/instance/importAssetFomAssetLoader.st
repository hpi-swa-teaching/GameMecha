import-export
importAssetFomAssetLoader

	| loader collider asset |
	self validateGitAssetLoaderValues.
	loader := GitAssetLoader for: self gitAssetProjectName basePath: self gitAssetProjectBasePath.
	asset := loader loadAsset: (UIManager default request: 'Please enter the fileName pls'), '.ston'.
	asset ifNil: [
		UIManager inform: 'The entered file does not exists'.
		^ self].
	collider := GMCollider newFromAsset: asset.
	self colliderTree initializefromCollider: collider inRelationTo: self selectedMorph withParent: nil.
	self updateSidebarColliderList