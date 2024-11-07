menu buttons
exportMenu
	"Creates the menu for the export options"
	
	| aMenuSpec builder|
	builder := ToolBuilder default.
	aMenuSpec := builder pluggableMenuSpec new.

	aMenuSpec
		add: 'Tilemap File'
		target: self
		selector: #exportAsMorph
		argumentList: {};
		
		add: 'PNG'
		target: self
		selector: #exportAsImage
		argumentList: {}.
		
	builder open: aMenuSpec