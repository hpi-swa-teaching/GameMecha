pheno
initializeLabels
	self collisionDescriptions: (PHDescriptionList items: {}).
	self 
		add: (PHLabel subHeading: 'open the halos and move the morphs around');
		add: self collisionDescriptions.