as yet unclassified
setUp
	 (FileDirectory default / 'webtest') exists ifFalse: [FileDirectory default createDirectory: 'webtest'].
	 (FileDirectory default / 'webtest')
		deleteFileNamed: 'cbg.jpg';
		deleteFileNamed: 'fire.png'.