accessing
maskAsOrderedCollection

	| bitmask maskCollection |
	bitmask := self mask.
	maskCollection := OrderedCollection new.
	1 to: bitmask highBit do: [:bit | (bitmask bitAt: bit) = 1 ifTrue: [maskCollection add: bit]].
	^ maskCollection