initialize
initializeTreeView

	| model |
	model := GMMorphTreeModel new
		canvasMorph: self canvasMorph;
		editor: self.
	self treeView: (ToolBuilder default buildPluggableTree: (ToolBuilder default pluggableTreeSpec new
		model: model;
		name: #morphTree;
		roots: #morphTreeRoots;
		label: #morphTreeLabel:;
		getChildren: #morphTreeChildren:;
		hasChildren: #morphTreeHasChildren:;
		getSelected: #selectedCollider;
		setSelected: #selectedCollider:;
		yourself)).
	^ self treeView