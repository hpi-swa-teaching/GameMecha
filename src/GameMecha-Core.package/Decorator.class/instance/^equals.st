intercepting
= anotherObject
	"an object is only equal to a decorator, if it is the decorator himself (d ~= d wrappedObject)"

	^(self == anotherObject).