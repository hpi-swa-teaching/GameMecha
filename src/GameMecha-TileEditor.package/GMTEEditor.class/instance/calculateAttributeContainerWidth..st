helper
calculateAttributeContainerWidth: label
	"Calculates the minimum width of an attribute container"
	
	^ (self getSizeOfString: label) + GMTEEditor getInputFieldSize