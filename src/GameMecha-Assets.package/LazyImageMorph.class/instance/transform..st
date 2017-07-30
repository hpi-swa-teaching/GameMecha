transformation
transform: form
	"TODO find out, why magnifyBy: doesnt work or figure out its purpose"
	form magnify: form boundingBox by: (self bounds extent / form extent).
	self image: form.