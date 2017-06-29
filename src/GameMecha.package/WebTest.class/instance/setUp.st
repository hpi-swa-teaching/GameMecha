as yet unclassified
setUp
	 (FileDirectory default / 'GMTest') exists ifFalse: [FileDirectory default createDirectory: 'GMTest'].
	 (FileDirectory default / 'GMTest')
		deleteFileNamed: 'cbg.jpg';
		deleteFileNamed: 'fire.png'.