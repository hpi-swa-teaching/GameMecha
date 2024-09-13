startup
startup
		"Opens the editor with a startup wizard"
		
		(DialogWindow new
		title: 'Wizard';
		message: 'Open Existing Project?';
		createButton: 'Yes' translated value: true;
		createCancelButton: 'No' translated  value: false;
		selectedButtonIndex: 2; "NO"
		registerKeyboardShortcuts;
		getUserResponseAtHand)
			ifTrue: [self new importFromMorph]
			ifFalse: [self new]