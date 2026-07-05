collider-tree
removeEditorNode: aGMEditorNode from: aNode

	(aNode children includes: aGMEditorNode)
		ifTrue: [aNode removeChild: aGMEditorNode]
		ifFalse: [aNode children do: [:child | self removeEditorNode: aGMEditorNode from: child]]