copying
asRescaledToWidth: aWidth height: aHeight
	"Return copy with size (aWidth, aHeight)"

	| newLayer |
	newLayer := self class width: aWidth height: aHeight layerIndex: self layerIndex.
	
	"Copy over tiles & handle tile removal"
	
	1 to: (aHeight min: self rowCount) do: [:row |
    		1 to: (aWidth min: self columnCount) do: [:col |
       		 newLayer at: row at: col put: (self at: row at: col) veryDeepCopy]].

	newLayer
		visible: self visible;
		displayName: self displayName.

	^ newLayer
	 