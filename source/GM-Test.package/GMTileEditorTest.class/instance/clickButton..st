as yet unclassified
clickButton: aButton
	"helper method that simulates the button press of aButton"
	
	|evt|
	evt := GMClickEvent atPosition: aButton position.
	
	aButton
		mouseDown: evt;
		mouseUp: evt