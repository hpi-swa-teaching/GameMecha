subanimations
split: amount
	"break an animation into amount many sub-animations"
	|split length|
	length := self frameCount / amount.
	split := OrderedCollection new.
	
	0 to: amount - 1 do: [:i | split add: (self subAnimationFrom: (i * length) to: ((i + 1) * length - 1))].
	
	^split.