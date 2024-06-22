as yet unclassified
clickButton: aButton
	|evt|
	
	evt := GMClickEvent atPosition: aButton position.
	
	aButton
		mouseDown: evt;
		mouseUp: evt