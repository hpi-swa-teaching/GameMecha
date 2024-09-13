helper
getSizeOfString: aString
	"How much space does this string need to be displayed in a standard font/size"

	^ TextStyle defaultFont approxWidthOfText: aString asText