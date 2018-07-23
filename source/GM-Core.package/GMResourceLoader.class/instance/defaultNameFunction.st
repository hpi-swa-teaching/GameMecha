loading
defaultNameFunction
	^ [:foldername :filename | self convertToRelativePath: foldername, filename]