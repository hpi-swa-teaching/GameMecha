initialize
initializeSelectButton

	^ self initializeThemeButton: 'Open' Target: [
		GMEditorClassSearchTool new
			target: self;
			actionSelector: #classSelected:;
			open]