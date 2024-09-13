updating
blendLayer: anIndex1 with: anIndex2
	"Blend two layers (arg ordered must not be considered)"

	| topIndex bottomIndex bottomLayer topLayer bottomCell topCell newCellEntry |
	((self layer: anIndex1) belowLayer: (self layer: anIndex2))
		ifTrue: [
			bottomLayer := self layer: anIndex1.
			topLayer := self layer: anIndex2.
			topIndex := anIndex2.
			bottomIndex := anIndex1]
		ifFalse: [
			bottomLayer := self layer: anIndex2.
			topLayer := self layer: anIndex1.
			topIndex := anIndex1.
			bottomIndex := anIndex2].
		
	1 to: bottomLayer columnCount do: [:x |
		1 to: bottomLayer rowCount do: [:y |
			bottomCell := bottomLayer at: y at: x.
			topCell := topLayer at: y at: x.
			bottomCell 
				ifNil: [
					newCellEntry := topCell veryDeepCopy.
					topCell ifNotNil: [topCell owner addMorph: newCellEntry].
					bottomLayer addTile: newCellEntry at: y at: x]
				ifNotNil: [
					newCellEntry := bottomCell asBlendedWithImageMorph: topCell.
					bottomCell updateSprite: newCellEntry image]]].
	
	self removeLayerAt: topIndex.
	^ bottomIndex
	
		
	
	
	