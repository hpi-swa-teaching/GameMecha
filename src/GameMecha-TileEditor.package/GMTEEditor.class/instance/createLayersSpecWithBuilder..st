building
createLayersSpecWithBuilder: aBuilder
	"creates the spec for layer viewer"
	
	^ (aBuilder pluggablePanelSpec new)
		name: 'layer viewer';
		model: self;
		minimumExtent:150 @ 150;
		frame: (LayoutFrame
			fractions: (0.8 @ 0.25 corner: 1 @ 1));
		children: {
			(aBuilder pluggablePanelSpec new)
			frame: (LayoutFrame fractions: (0.85 @ 0 corner: 1 @ 1) offsets: (0 @ 30 corner: 0 @ 0));
			
			children: {
				(aBuilder pluggableImageButtonSpec new)
					model:self;
					action: #addLayer;
					name: 'buttonAddLayer';
					description: 'Add Layer';
					frame: (LayoutFrame fractions: (0 @ 0 corner: 1 @ 0.125));
					project: 'GameMecha';
					path: '/GMTEIcons/add.png'.
			
				(aBuilder pluggableImageButtonSpec new)
					model:self;
					action: #moveLayerDown;
					name: 'buttonMoveLayerDown';
					description: 'Move Layer Down';
					frame: (LayoutFrame fractions: (0 @ 0.125 corner: 1 @ 0.25));
					project: 'GameMecha';
					path: '/GMTEIcons/up.png'.
				
				(aBuilder pluggableImageButtonSpec new)
					model:self;
					action: #moveLayerUp;
					name: 'buttonMoveLayerUp';
					description: 'Move Layer Up';
					frame: (LayoutFrame fractions: (0 @ 0.25 corner: 1 @ 0.375));
					project: 'GameMecha';
					path: '/GMTEIcons/down.png'.
				
				(aBuilder pluggableImageButtonSpec new)
					model: self;
					action: #renameLayer;
					name: 'buttonRenameLayer';
					description: 'Rename Layer';
					frame: (LayoutFrame fractions: (0 @ 0.375 corner: 1 @ 0.5));
					project: 'GameMecha';
					path: '/GMTEIcons/rename.png'.
				
				(aBuilder pluggableImageButtonSpec new)
					model:self;
					action:#resetSelectedLayers;
					name: 'buttonResetLayers';
					description: 'Clear Layer(s)';
					frame: (LayoutFrame fractions: (0 @ 0.5 corner: 1 @ 0.625));
					project: 'GameMecha';
					path: '/GMTEIcons/broom.png'.
				
				(aBuilder pluggableImageButtonSpec new)
					model:self;
					action: #blendSelectedLayers;
					name: 'buttonBlendLayers';
					description: 'Blend Layers';
					frame: (LayoutFrame fractions: (0 @ 0.625 corner: 1 @ 0.75));
					project: 'GameMecha';
					path: '/GMTEIcons/merge.png'.
				
				(aBuilder pluggableImageButtonSpec new)
					model:self;
					action: #deleteSelectedLayers;
					name: 'buttonDeleteLayers';
					description: 'Delete Layer(s)';
					frame: (LayoutFrame fractions: (0 @ 0.75 corner: 1 @ 0.875));
					project: 'GameMecha';
					path: '/GMTEIcons/trash.png'.
				
				(aBuilder pluggableImageButtonSpec new)
					model:self;
					action: #toggleSelectedLayerVisibility;
					name: 'buttonToggleVisibilityLayers';
					description: 'Show/Hide Layer(s)';
					frame: (LayoutFrame fractions: (0 @ 0.875 corner: 1 @ 1));
					project: 'GameMecha';
					path: '/GMTEIcons/eye.png'}.
			
			(aBuilder pluggableMultiSelectionListSpec new)
			name: 'layers';
			model: self;
			list: #getLayerList;
			getSelectionList: #layerAt:;
			setSelectionList: #layerAt:put:;
			autoDeselect: false;
			frame: (LayoutFrame fractions: (0 @ 0 corner: 0.85 @ 1) offsets: (0 @ 30 corner: 0 @ 0))};
		verticalResizing: #shrinkWrap;
		yourself