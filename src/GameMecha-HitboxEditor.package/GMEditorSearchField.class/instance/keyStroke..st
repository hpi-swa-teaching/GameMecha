as yet unclassified
keyStroke: anEvent
    super keyStroke: anEvent.
    actionBlock ifNotNil: [actionBlock value: self contents]