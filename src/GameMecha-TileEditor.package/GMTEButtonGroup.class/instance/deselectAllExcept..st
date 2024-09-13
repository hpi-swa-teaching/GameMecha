as yet unclassified
deselectAllExcept: aButton

	self do: [:a |
		 (a ~= aButton) 
			ifTrue: [
				a setImageMode: 'unpressed'.
				a selected: false]]