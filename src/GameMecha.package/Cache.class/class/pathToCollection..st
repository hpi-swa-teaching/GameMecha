as yet unclassified
pathToCollection: aPath
	"split a path at common directory split characters and return the results in a collection"
	1 to: aPath size
		do: [:i | (((aPath at: i) = $/) or: [(aPath at: i) = $\])
			ifTrue:[aPath at: i put: Character space]].

	^ aPath substrings.