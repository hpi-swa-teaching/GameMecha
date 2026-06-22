accessing
layersAsOrderedCollection

	| bitmask layersCollection |
	bitmask := layers ifNil: [self parent layers].
	layersCollection := OrderedCollection new.
	1 to: bitmask highBit do: [:bit | (bitmask bitAt: bit) = 1 ifTrue: [layersCollection add: bit]].
	^ layersCollection