as yet unclassified
setUp
	 (FileDirectory default / 'GMTest') exists ifFalse: [FileDirectory default createDirectory: 'GMTest'].
	WebResources ensureFile: 'http://colpa.infine.casa:81/default-resources/other/sheet.png' isAt: 'GMTest/sheet.png'.
	WebResources ensureFile: 'http://colpa.infine.casa:81/default-resources/other/smile.png' isAt: 'GMTest/smile.png'.