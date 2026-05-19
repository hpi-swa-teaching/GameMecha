collision
shouldCheckCollisionBetween: aMorph and: anotherMorph

    (((aMorph respondsTo: #collider) and: [aMorph collider notNil])
        and: [((anotherMorph respondsTo: #collider) and: [anotherMorph collider notNil])])
        ifFalse: [
            self error: 'A morph is unexpectedly missing a collider!'
        ].

    ^ aMorph ~~ anotherMorph