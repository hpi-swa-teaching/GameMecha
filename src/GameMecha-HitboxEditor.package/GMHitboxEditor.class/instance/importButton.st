ui-components
importButton

	^ SimpleButtonMorph new
		label: 'import';
		color: self buttonColor;
		borderColor: Color transparent;
		target: [ | loader collider |
			self selectedMorph ifNil: [UIManager default inform: 'You have to select a Morph first'. 
			]ifNotNil: [
			loader := GitAssetLoader for: self gitAssetProjectName basePath: self gitAssetProjectBasePath.
			collider := GMCollider newFromAsset: (loader loadAsset: self currentColliderAssetPathName).
			self colliderTree initializeFromCollider: collider inRelationTo: self selectedMorph withParent: nil.
			self updateSidebarColliderList]];
		actionSelector: #value;
		borderWidth: 1