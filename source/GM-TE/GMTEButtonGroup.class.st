"
Buttons can join a GMTEButtonGroup, which then ensures that only one of them is active at a time.
"
Class {
	#name : #GMTEButtonGroup,
	#superclass : #Dictionary,
	#category : #'GM-TE-Core',
	#'squeak_changestamp' : 'mcjj 7/12/2024 23:26'
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
	#'squeak_changestamp' : 'tw 7/12/2024 17:18'
}
GMTEButtonGroup >> deselectAllExceptNamed: aName [

	self deselectAllExcept: (self at: aName)
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'tw 7/12/2024 16:57'
}
GMTEButtonGroup >> register: aButton as: aString [

	self at: aString put: aButton
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'tw 7/12/2024 17:18'
}
GMTEButtonGroup >> singleSelect: aButton [

	aButton select.
	self deselectAllExcept: aButton
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'tw 7/12/2024 17:18'
}
GMTEButtonGroup >> singleSelectNamed: aName [

	self singleSelect: (self at: aName)
]
