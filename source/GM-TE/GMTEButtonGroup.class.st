Class {
	#name : #GMTEButtonGroup,
	#superclass : #Set,
	#category : #'GM-TE-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'TW 7/9/2024 19:04'
}
GMTEButtonGroup >> deselectAllExcept: aButton [

	self do: [:a |
		 (a ~= aButton) 
			ifTrue: [
				a setImageMode: 'unpressed'.
				a selected: false]]
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'TW 7/9/2024 18:17'
}
GMTEButtonGroup >> register: aButton [

	self add: aButton
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'TW 7/9/2024 19:04'
}
GMTEButtonGroup >> singleSelect: aButton [

	aButton selected: true.
	self deselectAllExcept: aButton
]
