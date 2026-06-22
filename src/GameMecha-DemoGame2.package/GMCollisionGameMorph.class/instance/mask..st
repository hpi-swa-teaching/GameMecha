accessing
mask: aNumberCollection

	| bitmask |
	bitmask := 0.
	aNumberCollection do: [:aNumber | bitmask := bitmask bitAt: aNumber put: 1].
	mask := bitmask