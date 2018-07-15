as yet unclassified
isSupportedType: aFileExtension
	^ ImageReadWriter allTypicalFileExtensions includes: (aFileExtension asLowercase)