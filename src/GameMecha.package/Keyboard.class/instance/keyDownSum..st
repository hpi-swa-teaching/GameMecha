highlevel
keyDownSum: keyValueMap
	"sum up some values, if their keys are pressed"
	| sum |
	
	keyValueMap asDictionary keysAndValuesDo: [:key :value | 
		(self isKeyDown: key)
			ifTrue: [sum
				ifNil: [sum := value]
				ifNotNil: [sum := sum + value]]].
	
	^ sum
		ifNil: [0]
		ifNotNil: [sum].