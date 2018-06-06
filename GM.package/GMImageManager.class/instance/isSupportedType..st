as yet unclassified
isSupportedType: aString
	^ ImageReadWriter allTypicalFileExtensions includes: (aString asLowercase)