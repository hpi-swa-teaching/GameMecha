accessing
layers: aNumberCollection

	| bitmask |
	bitmask := 0.
	aNumberCollection do: [:aNumber | bitmask := bitmask bitAt: aNumber put: 1].
	layers := bitmask