menu buttons
settingsMenu
	"Opens the extra menu"
	
	| aMenuSpec builder|
	builder := ToolBuilder default.
	aMenuSpec := builder pluggableMenuSpec new.

	aMenuSpec
		add: 'Toggle Grid'
		target: self
		selector: #toggleGrid
		argumentList: {};
		
		add: 'Toggle Background'
		target: self
		selector: #toggleBackgroundTiles
		argumentList: {};
		
		add: 'Reset View'
		target: self
		selector: #resetView
		argumentList: {};
		
		add: 'Please Help'
		target: self class
		selector: #displayHelp
		argumentList: {}.
		
	builder open: aMenuSpec