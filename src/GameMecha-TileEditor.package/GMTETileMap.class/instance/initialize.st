initialization
initialize
	
	super initialize.
	self 
		color: Color lightGray;
		clipSubmorphs: true;
		forceMapSizeRatio: false;
		view: GMTEView new; 
		hasStaticView: true;
		backgroundTiles: GMTETile checkerBoardTile
	