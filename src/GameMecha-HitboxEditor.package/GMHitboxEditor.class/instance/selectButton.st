ui-components
selectButton

	^ SimpleButtonMorph new
		label: 'Select';
		color: self buttonColor;
		borderColor: Color transparent;
		target: [ | className targetClass newMorph |
			className := self classTextInputField contents asString asSymbol.
			
			targetClass := Smalltalk at: className ifAbsent: [nil].
			
			"Validates, that the Class exists and inherits the behaviour of Morph"
			(targetClass notNil and: [targetClass includesBehavior: Morph])
				ifTrue: [
					newMorph := targetClass new.
					self selectedMorph: newMorph.
					self canvasMorph drawSelectedMorphOnCanvas: self selectedMorph]
				ifFalse: [UIManager default inform: 'Something went wrong. Either the class does not exist or it does not inherit from morph.'].
			self updateSidebarColliderList];
		actionSelector: #value;
		borderWidth: 1