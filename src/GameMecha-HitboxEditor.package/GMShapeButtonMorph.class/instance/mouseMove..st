as yet unclassified
mouseMove: evt
    isPressed ifFalse: [^ self].
    "Morph direkt an die Hand hängen"
    self parachuteMorph: evt.