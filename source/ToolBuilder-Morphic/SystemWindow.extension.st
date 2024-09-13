Extension { #name : #SystemWindow }

{
	#category : #'*ToolBuilder-Morphic-opening',
	#'squeak_changestamp' : 'mt 10/5/2017 08:45'
}
SystemWindow >> openAsTool [
	"Open this window as a tool, that is, honor the preferences such as #reuseWindows and #openToolsAttachedToMouseCursor."
	
	| meOrSimilarWindow |
	meOrSimilarWindow := self openInWorldExtent: self extent.
	(Project uiManager openToolsAttachedToMouseCursor
		and: [ | event |
			event := self currentEvent.
			event isMouse and: [event isMouseUp]])
				ifTrue: [
					meOrSimilarWindow setProperty: #initialDrop toValue: true.
					meOrSimilarWindow hasDropShadow: false.
					self currentHand attachMorph: meOrSimilarWindow].
	^ meOrSimilarWindow

]
