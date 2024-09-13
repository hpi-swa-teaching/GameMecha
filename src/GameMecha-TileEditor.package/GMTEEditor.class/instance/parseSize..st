textual user input
parseSize: aText
	"Converts a string into a number"
	
	[^ aText asNumber] on: NumberParserError do: [^ nil]