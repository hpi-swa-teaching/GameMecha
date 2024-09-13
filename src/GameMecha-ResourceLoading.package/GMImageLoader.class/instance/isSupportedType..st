loading
isSupportedType: aFileExtension
	^ ImageReadWriter allTypicalFileExtensions includes: (aFileExtension asLowercase)