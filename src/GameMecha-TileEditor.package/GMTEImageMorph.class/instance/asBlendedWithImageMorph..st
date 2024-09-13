copying
asBlendedWithImageMorph: anImageMorph
	"Answer the sender with a new image morph that is a blend from self and anImageMorph"

	anImageMorph ifNil: [^ self].
	
	^ (ImageMorph new) 
		image: ((FormCanvas on: self image)
			image: (anImageMorph image)
			at: 0@0
			sourceRect: (anImageMorph image boundingBox)
			rule: Form blend)
			form;
		yourself
			
			