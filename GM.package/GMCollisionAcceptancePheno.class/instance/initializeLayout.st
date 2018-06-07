pheno
initializeLayout
	self
		withLayout;
		addStyleClass: #withPadding;
		vertical: true;
		extent: self initialExtent.
	self 
		initializeButtons;
		initializeLabels.
		