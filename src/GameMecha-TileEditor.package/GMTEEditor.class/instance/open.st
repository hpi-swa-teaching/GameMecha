initialization
open
  	"Builds the window"
	
	| newMorph |
	newMorph := ToolBuilder default build: self.
      newMorph openInWorld.
	self mapViewer submorphs first updateMap.
      ^ newMorph