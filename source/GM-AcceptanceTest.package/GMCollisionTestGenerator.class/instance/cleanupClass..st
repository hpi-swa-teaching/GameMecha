storing
cleanupClass: aClass
	"meta-programming warning"
	aClass collisionSelectors do: [:selector | aClass removeSelector: selector].