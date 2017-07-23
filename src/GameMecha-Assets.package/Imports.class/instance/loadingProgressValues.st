accessing
loadingProgressValues
	"an association: 'currently done'->'total todo' (in bytes)"
	loadingProgressValues ifNil: [self loadingProgressValues: 0->0].
	^ loadingProgressValues.