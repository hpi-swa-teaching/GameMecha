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
					self canvasMorph drawMorphOnCanvas: newMorph]
				ifFalse: [UIManager default inform: 'YOU ARE INVALID!!! Either the class does not exist or it does not have the behaviour of Morph. So why are YOU waisitng my time. You useless squeaker!!!'].
			self updateSidebarColliderList];
		actionSelector: #value;
		borderWidth: 1