*GameMecha-Core
repatedToExtent: extent withOrigin: origin
	
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