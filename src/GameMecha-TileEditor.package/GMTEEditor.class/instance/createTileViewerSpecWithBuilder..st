building
createTileViewerSpecWithBuilder: aBuilder
	"creates the spec for the tile viewer"
	"TODO: Maybe rename function to something more appropriate?"
	
	^ aBuilder pluggablePanelSpec new
		name: 'main panel';
		model:self;
		frame: (LayoutFrame fractions: (0.2 @ 0 corner: 0.8 @ 0.7)
		offsets: (0@ 30 corner: 0@0));
		children: {					
			(aBuilder pluggablePanelSpec new)
				name: 'tile viewer';
				layout: #horizontal;
				model:self;
				frame: (LayoutFrame
					fractions: (0 @ 0 corner: 1 @ 1))
		 };
		
		minimumExtent:150 @ 150;
		yourself