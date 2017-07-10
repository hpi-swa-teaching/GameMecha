as yet unclassified
save: file from: path
	self cachedElements add: (path -> (Form fromBinaryStream: file)).