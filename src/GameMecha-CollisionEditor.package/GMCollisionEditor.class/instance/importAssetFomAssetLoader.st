import-export
importAssetFomAssetLoader

	| loader collider colliderNode asset |
	self validateGitAssetLoaderValues.
	
	[loader := GitAssetLoader for: self gitAssetProjectName basePath: self gitAssetProjectBasePath
	]on: Error do: [
	(UIManager default confirm: 'There is no Project with the name ', self gitAssetProjectName , ' Do you want to retry?')
	ifTrue: [
	self refreshGitAssetLoaderValues.
	self importAssetFomAssetLoader].
	^self].
	asset := loader loadAsset: (UIManager default request: 'Please enter the fileName pls'), '.ston'.
	asset ifNil: [
		UIManager inform: 'The entered file does not exists'.
		^ self].
	collider := GMCollider newFromAsset: asset.
	colliderNode := collider editorNodeType new editor: self.
	self colliderTree addChild: (colliderNode createMorphFromCollider: collider inRelationTo: self selectedMorph withParent: nil).
	self updateSidebarColliderList