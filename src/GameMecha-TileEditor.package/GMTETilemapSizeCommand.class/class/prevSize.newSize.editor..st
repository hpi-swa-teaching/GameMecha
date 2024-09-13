as yet unclassified
prevSize: aPoint1 newSize: aPoint2 editor: anEditor

	^ (self new)
		
		prevSize: aPoint1;
		newSize: aPoint2;
		editor: anEditor;
		saveTiles;
		yourself