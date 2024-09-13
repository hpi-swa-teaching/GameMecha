brushHelper
fillDfsWithVisited: aVisitedMatrix andIndex: anIndex andOriginTile: anOriginTile

	| newIndex newTile |
	GMTEBrush borderingOffsets do: [:offset |
		newIndex := offset + anIndex.
		((self layer inBounds: newIndex) and: [(aVisitedMatrix at: newIndex y at: newIndex x) isNil]) ifTrue:[
			newTile := self layer at: newIndex y at: newIndex x.
			
			(self tile: anOriginTile equalsTile: newTile) ifTrue: [
					self outputSet add: newIndex.
					aVisitedMatrix at: newIndex y at: newIndex x put: true.
					self fillDfsWithVisited: aVisitedMatrix andIndex: newIndex andOriginTile: anOriginTile]]]