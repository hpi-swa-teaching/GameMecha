building
createTilestoreSpecWithBuilder: aBuilder
	"creates the spec for the tile store"

	^ (aBuilder pluggableScrollPaneSpec new)
		frame: (LayoutFrame fractions: (0 @ 0 corner: 0.2 @ 1)
		offsets: (0@ 30 corner: 0@0));
		name: 'tile store';
		spacing: 10@10;
		children: {};
		spacing: 20;
		verticalResizing: #shrinkWrap;
		horizontalResizing: #shrinkWrap;
		minimumWidth:100;
		yourself
