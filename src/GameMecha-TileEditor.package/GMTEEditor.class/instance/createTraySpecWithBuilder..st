building
createTraySpecWithBuilder: aBuilder
	"creates the spec for the tile tray"
	
	^ (aBuilder pluggableScrollPaneSpec new)
		name: 'tray';
		frame: (LayoutFrame fractions: (0.2 @ 0.8 corner:  0.8 @ 1));
		minimumHeight:75;
		yourself