*GameMecha-Assets
repatedToExtent: extent withOrigin: origin
	"create an InfiniteForm and draw it onto ourself"
	|largeForm infForm|

	infForm := InfiniteForm with: self.

	largeForm := Form
		extent: extent
		depth: infForm asForm depth.

	infForm 
		displayOn: largeForm
		at: origin
		clippingBox: largeForm boundingBox
		rule: Form over
		fillColor: nil.

	^largeForm.