filesystem
filenamesAtDir: aFoldername
	^ (FileDirectory uri: aFoldername) fileNames
		select: [:filename | self isSupportedType: (FileDirectory extensionFor: filename)]