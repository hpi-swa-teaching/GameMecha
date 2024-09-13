constants
getVisibilityIndicator: aBoolean
	
	aBoolean
		ifTrue: [^ ' (v)']
		ifFalse: [^ ' (h)']