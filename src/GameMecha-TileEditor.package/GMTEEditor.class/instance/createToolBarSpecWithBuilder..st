building
createToolBarSpecWithBuilder: aBuilder
	"creates the spec for the tool bar"
	
	| radiusLabel |
	
	radiusLabel := 'radius:'.
	
	^ (aBuilder pluggablePanelSpec new)
		name: 'toolbar';
		model: self;
		frame: (LayoutFrame fractions: (0.2@0.7 corner: 0.8@0.8));
		minimumHeight: (35 * RealEstateAgent scaleFactor); "slightly magic number, in testing this was pretty. no time to fix until deadline"
		children: {
			self createAttributeSpecWithBuilder: aBuilder 
				descriptor: radiusLabel
				getter: #getBrushRadiusAsString
				setter: #setBrushRadius: 
				model: self 
				frame: ((GMTEEditor hLayoutFrame: 1 ofN: 10 vSymmetric: GMTEEditor toolBarVSpace)).
				
			(aBuilder pluggablePanelSpec new)
				model: self;
				frame: (LayoutFrame fractions: (0.05 @ 0 corner: 1@ 1) offsets: ((self calculateAttributeContainerWidth: radiusLabel) @ 0 corner: 0 @ 0));
				children:  {
					(aBuilder pluggableImageButtonSpec new)
						groupName: 'radiusBrush';
						description: 'Brush';
						model: self;
						frame: (GMTEEditor hLayoutFrame: 1 ofN: 6 vSymmetric: GMTEEditor toolBarVSpace);
						action: #selectRadiusBrush;
						project: 'GameMecha';
						buttonGroup: self brushButtons;
						iconName: #brush.
					
					(aBuilder pluggableImageButtonSpec new)
						groupName: 'lineBrush';
						description: 'Line Tool';
						model: self;
						frame: (GMTEEditor hLayoutFrame: 2 ofN: 6 vSymmetric: GMTEEditor toolBarVSpace);
						action: #selectLineBrush;
						project: 'GameMecha';
						buttonGroup: self brushButtons;
						iconName: #line.
						
					(aBuilder pluggableImageButtonSpec new)
						groupName: 'fillBrush';
						description: 'Fill Tool';
						model: self;
						frame: (GMTEEditor hLayoutFrame: 3 ofN: 6 vSymmetric: GMTEEditor toolBarVSpace);
						action: #selectFillBrush;
						project: 'GameMecha';
						buttonGroup: self brushButtons;
						iconName: #fill.
						
					(aBuilder pluggableImageButtonSpec new)
						groupName: 'rectangleBrush';
						description: 'Rectangle Tool';
						model: self;
						frame: (GMTEEditor hLayoutFrame: 4 ofN: 6 vSymmetric: GMTEEditor toolBarVSpace);
						action: #selectRectangleBrush;
						project: 'GameMecha';
						buttonGroup: self brushButtons;
						iconName: #rectangle.
						
						(aBuilder pluggableImageButtonSpec new)
						name: 'undo';
						description: 'Undo';
						model: self;
						frame: (GMTEEditor hLayoutFrame: 5 ofN: 6 vSymmetric: GMTEEditor toolBarVSpace);
						action: #undo;
						project: 'GameMecha';
						iconName: #undo.
						
					(aBuilder pluggableImageButtonSpec new)
						name: 'redo';
						description: 'Redo';
						model: self;
						frame: (GMTEEditor hLayoutFrame: 6 ofN: 6 vSymmetric: GMTEEditor toolBarVSpace);
						action: #redo;
						project: 'GameMecha';
						iconName: #redo}};
			
		verticalResizing: #shrinkWrap;
		yourself