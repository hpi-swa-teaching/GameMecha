as yet unclassified
previousTiles: aDictionary1 currentTiles: aDictionary2 tilemap: aTileMap

	^ (self new)
		tileMap: aTileMap;
		previousSprites: aDictionary1;
		currentSprites: aDictionary2;
		yourself