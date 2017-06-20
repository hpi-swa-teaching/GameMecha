subanimations
splitAndStart: amount
	"break an animation into amount many sub-animations, and start all of them."
	^ (self split: amount) collect: [:anim | anim start].