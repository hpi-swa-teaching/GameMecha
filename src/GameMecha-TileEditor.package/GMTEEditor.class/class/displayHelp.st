utility
displayHelp
		"Shows a window with the ReadMe"
		
		|temp dialog|

		temp := PluggableTextMorphPlus new.
		temp 
			setText: GMTEEditor helpMessage;
			extent: RealEstateAgent scaleFactor * (1000 @ 400);
			readOnly: true.

		dialog := DialogWindow new
			title: 'ReadMe';
			addPaneMorph: temp;
			createCancelButton: 'Close' translated  value: false;
			registerKeyboardShortcuts.

		dialog paneMorph extent: temp extent.
		dialog getUserResponse
	