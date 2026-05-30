ui-components
selectButton

	^ SimpleButtonMorph new
		label: 'Select';
		color: self buttonColor;
		borderColor: Color transparent;
		target: [
			| className targetClass newMorph |

		    className := self classTextInputField contents asString asSymbol.
		    
		    targetClass := Smalltalk at: className ifAbsent: [nil].
		    
		    "Validate: Existert und ist ein Morph"
		    (targetClass notNil and: [targetClass includesBehavior: Morph]) 
		        ifTrue: [
		            newMorph := targetClass new.
		           	(self canvasMorph) drawMorphOnCanvas: newMorph.
		        ] 
		        ifFalse: [
		            UIManager default inform: 'Du bist INVALIDE! Entweder existiert deine Klasse erst gar nicht oder Sie erbt nicht von Morph! Warum verschwendest du also meine Zeit?'.
		        ].
			self updateSidebarColliderList
			];
		actionSelector: #value;
		borderWidth: 1