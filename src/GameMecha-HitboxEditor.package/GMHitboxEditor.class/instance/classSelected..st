initialize
classSelected: aClassName

	| targetClass newMorph |
	targetClass := Smalltalk at: aClassName ifAbsent: [nil].
	(targetClass notNil and: [targetClass includesBehavior: Morph])
		ifTrue: [
			self selectedMorph ifNotNil: [
				(UIManager default confirm: 'You are about to clear the Canvas! Are you sure you want to do that?')
					ifTrue: [
						self canvasMorph removeAllMorphsFromCanvas.
						self updateSidebarColliderList]
					ifFalse: [^ nil]].
			newMorph := targetClass new.
			
			self selectedMorph: newMorph.
			self canvasMorph addMorphToCanvas: newMorph.
			classNameLabel contents: aClassName asString]
		ifFalse: [UIManager default inform: 'Class does not exists or is not a moprh']