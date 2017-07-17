inspectorHandling
cleanWorldwithString: aLabel
	World submorphs select: [:elem| elem asString  matchesRegex: '.*',aLabel,'.*'] thenDo: [:elem| elem delete].