as yet unclassified
tearDown

	(self fileUUID) ifNotNil: [FileDirectory default deleteFileNamed: self fileUUID.
		self fileUUID: nil.
	].
	self assert: fileUUID isNil.
	
	self editor ifNotNil: [self editor changed: #close.
		self editor: nil.
	].

	self assert: (self editor isNil).