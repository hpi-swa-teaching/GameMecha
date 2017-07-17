initialize
newOn: aTarget
	| behavior |
	behavior := self new.
	behavior target: aTarget.
	^behavior.