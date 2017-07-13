inspectorHandling
openInspectorIfNecessaryOn: anObject withLabel: aLabel
	self closeHelpWindowWithLabel: aLabel.
	anObject isEmpty 
		ifFalse: [anObject inspectWithLabel: aLabel. Error signal].