command processing
redo
	"Reapplies the next command in the list, if there is one"
	
	(self currentCommand < self commands size) 
		ifTrue: [
			self
				savedSinceModified: false;
				currentCommand: self currentCommand + 1.
			(self commands at: self currentCommand) do.
			self savedSinceModified: false]