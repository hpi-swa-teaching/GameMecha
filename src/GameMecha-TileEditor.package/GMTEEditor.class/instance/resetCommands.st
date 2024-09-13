command processing
resetCommands

	self
		commands: (OrderedCollection newFrom: {GMTEPlaceHolderCommand new});
		currentCommand: 1