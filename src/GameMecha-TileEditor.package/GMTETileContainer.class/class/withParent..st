instance creation
withParent: aParent

	^ (GMTETileContainer new)
		parent: aParent;
		beTransparent;
		layoutPolicy: TableLayout new;
		listDirection: #leftToRight;
		wrapDirection: #leftToRight