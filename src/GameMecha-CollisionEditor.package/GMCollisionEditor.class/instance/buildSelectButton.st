creation
buildSelectButton

	^ self buildThemeButton: 'Open' Target: [
		GMEditorClassSearchTool new
			target: self;
			actionSelector: #classSelected:;
			open]