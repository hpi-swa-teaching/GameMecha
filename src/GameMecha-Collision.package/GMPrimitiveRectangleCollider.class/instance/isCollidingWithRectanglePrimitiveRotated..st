collision
isCollidingWithRectanglePrimitiveRotated: aRectangleCollider
    | axes |
    (aRectangleCollider maskIncludes: self layers) ifFalse: [^ false].

    axes := Array new: 4.
    axes at: 1 put: (self localAxisX).
    axes at: 2 put: (self localAxisY).
    axes at: 3 put: (aRectangleCollider localAxisX).
    axes at: 4 put: (aRectangleCollider localAxisY).

    axes do: [:axis |
        (self isSeparatedFromRectangle: aRectangleCollider onAxis: axis)
            ifTrue: [^ false]].

    ^ true