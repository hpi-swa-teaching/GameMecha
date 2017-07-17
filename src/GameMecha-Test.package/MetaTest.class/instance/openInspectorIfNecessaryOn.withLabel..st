inspectorHandling
openInspectorIfNecessaryOn: anObject withLabel: aLabel
	self cleanWorldwithString: aLabel.
	anObject isEmpty 
		ifFalse: [anObject inspectWithLabel: aLabel. Error signal].