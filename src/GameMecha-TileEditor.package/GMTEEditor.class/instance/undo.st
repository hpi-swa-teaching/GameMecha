command processing
undo

	(self currentCommand > 1) 
		ifTrue: [(self commands at: self currentCommand) undo.
			self
				savedSinceModified: false;
				currentCommand: self currentCommand - 1;
				savedSinceModified: false]