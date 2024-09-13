helper
getMaximalSizeOfStrings: setOfStrings

	^ (setOfStrings collect: [:aString | self getSizeOfString: aString]) max