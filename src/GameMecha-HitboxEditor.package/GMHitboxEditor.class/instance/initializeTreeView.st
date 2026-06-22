initialize
initializeTreeView

	| model |
	self propertyPanel: (GMPropertyPanel new editor: self).
	model := MorphTreeModel new.
	model
		canvasMorph: self canvasMorph viewport;
		editor: self.
	self treeView: ToolBuilder default pluggableTreeSpec new yourself.
	self treeView: (ToolBuilder default buildPluggableTree: (ToolBuilder default pluggableTreeSpec new
		model: model;
		name: #morphTree;
		roots: #morphTreeRoots;
		label: #morphTreeLabel:;
		getChildren: #morphTreeChildren:;
		hasChildren: #morphTreeHasChildren:;
		getSelected: #selectedMorph;
		setSelected: #selectedMorph:;
		yourself))