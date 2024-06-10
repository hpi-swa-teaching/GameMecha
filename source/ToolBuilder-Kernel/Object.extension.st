Extension { #name : #Object }

{
	#category : #'*ToolBuilder-Kernel-error handling',
	#'squeak_changestamp' : 'rbb 3/1/2005 09:26'
}
Object >> confirm: queryString [
	"Put up a yes/no menu with caption queryString. Answer true if the 
	response is yes, false if no. This is a modal question--the user must 
	respond yes or no."

	"nil confirm: 'Are you hungry?'"

	^ UIManager default confirm: queryString
]

{
	#category : #'*ToolBuilder-Kernel-error handling',
	#'squeak_changestamp' : 'rbb 3/1/2005 09:27'
}
Object >> confirm: aString orCancel: cancelBlock [
	"Put up a yes/no/cancel menu with caption aString. Answer true if  
	the response is yes, false if no. If cancel is chosen, evaluate  
	cancelBlock. This is a modal question--the user must respond yes or no."

	^ UIManager default confirm: aString orCancel: cancelBlock
]

{
	#category : #'*ToolBuilder-Kernel-user interface',
	#'squeak_changestamp' : 'rbb 3/1/2005 09:28'
}
Object >> inform: aString [
	"Display a message for the user to read and then dismiss. 6/9/96 sw"

	aString isEmptyOrNil ifFalse: [UIManager default inform: aString]
]
