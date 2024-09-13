input handling
filterEvent: aKeyboardEvent for: anObject
	"Handles keyboard shortcuts"
	
	| key |
	aKeyboardEvent isKeystroke
		ifFalse: [^ aKeyboardEvent].
	
	key := aKeyboardEvent keyCharacter.

	aKeyboardEvent commandKeyPressed ifTrue: [
		key caseOf: {
			[$s] -> [self exportAsMorph].
			[$i] -> [self importFromMorph].
			[$o] -> [self importFromTileset].
			[$g] -> [self toggleGrid].
			[$h] -> [self toggleBackgroundTiles].
		
			[$a] -> [self addLayer].
			[$n] -> [self renameLayer].
			[$c] -> [self resetSelectedLayers].
			[$b] -> [self blendSelectedLayers].
			[$x] -> [self deleteSelectedLayers].
			[$v] -> [self toggleSelectedLayerVisibility].
			
			[$z] -> [self undo].
			[$y] -> [self redo].
			[$r] -> [self rotateSelectedTile].
			[$1] -> [self selectRadiusBrush].
			[$2] -> [self selectLineBrush].
			[$3] -> [self selectFillBrush].
			[$4] -> [self selectRectangleBrush].
		} otherwise: [^ aKeyboardEvent "no hit"].
		^ aKeyboardEvent ignore "hit"].
	
	^ aKeyboardEvent "no hit"