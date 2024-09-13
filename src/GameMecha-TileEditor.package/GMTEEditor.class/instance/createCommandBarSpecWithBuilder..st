building
createCommandBarSpecWithBuilder: aBuilder
	"creates the spec for the command bar"
	
	^ aBuilder pluggablePanelSpec new
		name: 'command bar';
		model: self;
		children: {(aBuilder pluggableButtonSpec new)
			name: 'import';
			label: 'Import ...';
			model: self;
			frame: (LayoutFrame fractions: (0 @ 0 corner: 0.3 @ 1) offsets: nil);
			action: #importMenu.
			
			(aBuilder pluggableButtonSpec new)
			name: 'export';
			label: 'Export as ...';
			model: self;
			action: #exportMenu;
			frame: (LayoutFrame fractions: (0.3 @ 0 corner: 0.6 @ 1) offsets: nil).

			(aBuilder pluggableButtonSpec new)
			frame: (LayoutFrame fractions: (0.6 @ 0 corner: 0.9 @ 1) offsets: nil);
			name: 'openInWorld';
			label: 'Open in World';
			model: self;
			action: #openTileMapInWorld.
			
			(aBuilder pluggableButtonSpec new)
			frame: (LayoutFrame fractions: (0.9 @ 0 corner: 1 @ 1) offsets: nil);
			name: 'settings';
			label: '...';
			model: self;
			action: #settingsMenu};

		verticalResizing: #shrinkWrap;
		
		frame: (LayoutFrame
			fractions: (0 @ 0 corner: 1 @ 0) offsets:(0 @ 0 corner: 0 @ 30));
		yourself