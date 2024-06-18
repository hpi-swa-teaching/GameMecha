as yet unclassified
tearDown

	(FileDirectory default fileExists: 'map.morph')
		ifTrue: [FileDirectory default deleteFileNamed: 'map.morph'].
	self editor ifNotNil: [self editor changed: #close.
		self editor: nil.
		].

	self assert: ((FileDirectory default / 'map.morph') exists) not.
	self assert: (self editor isNil).