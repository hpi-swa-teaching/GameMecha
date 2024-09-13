dev-api
fitBackgroundToMap
	"Forces the tile map morph to fit the map grid"
	
	self 
		mapPadding: 0.0;
		forceMapSizeRatio: true;
		extent: (self mapSizeWidth) @ (self mapSizeHeight);
		changed