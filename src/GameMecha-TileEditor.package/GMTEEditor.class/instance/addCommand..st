command processing
addCommand: aCommand
	"Appends a new command to the list and overwrites all commands that were made in an undone future"
	
	[self commands size > self currentCommand] whileTrue: [self commands removeLast].

	(self commands size > self class maxNumberOfCommands) ifTrue: [self commands removeAt: 2.
		self currentCommand: self currentCommand - 1].
	
	self commands add: aCommand.
	self currentCommand: self currentCommand + 1