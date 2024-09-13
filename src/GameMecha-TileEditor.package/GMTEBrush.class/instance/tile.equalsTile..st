brushHelper
tile: aTile equalsTile: anotherTile
	
	| tilesNil tilesSame |
	tilesNil := (aTile isNil) and: [anotherTile isNil].
	tilesSame := (aTile isNil not and: [anotherTile isNil not]) and: [aTile imageForm bits hash = anotherTile imageForm bits hash].
	
	^ (tilesNil or: [tilesSame])