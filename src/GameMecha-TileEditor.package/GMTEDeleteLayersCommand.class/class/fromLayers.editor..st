as yet unclassified
fromLayers: aLayerList editor: anEditor

	^ (self new)
		layers: ((SortedCollection sortBlock: [:a :b | a < b]) addAll: aLayerList; yourself);
		editor: anEditor;
		newSize: 0 @ 0;
		saveTiles;
		yourself