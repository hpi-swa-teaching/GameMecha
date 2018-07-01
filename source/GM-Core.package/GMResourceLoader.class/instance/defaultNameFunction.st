as yet unclassified
defaultNameFunction
	^ [:foldername :filename | self convertToRelativePath: foldername, filename]