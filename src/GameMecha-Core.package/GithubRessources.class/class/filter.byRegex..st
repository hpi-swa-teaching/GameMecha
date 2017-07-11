as yet unclassified
filter: fileList byRegex: regex
	^fileList select: [:file | file matchesRegex: regex].