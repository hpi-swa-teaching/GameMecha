as yet unclassified
keyMap
	KeyMap ifNil: [KeyMap := Dictionary newFrom: {
		$! -> $1.
		$" -> $2.
		$§ -> $3.
		$$ -> $4.
		$% -> $5.
		$& -> $6.
		$/ -> $7.
		$( -> $8.
		$) -> $9.
		$= -> $0.
		$? -> $ß.
		}].
	^ KeyMap.