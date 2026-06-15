utility
isSeparatedFromRectangle: aRectangleCollider onAxis: axis

    | aMin aMax bMin bMax proj |
    aMin :=  Float infinity.
    aMax := Float infinity negated.
    bMin :=  Float infinity.
    bMax := Float infinity negated.

    self corners do: [:corner |
        proj := (axis x * corner x) + (axis y * corner y).
        aMin := aMin min: proj.
        aMax := aMax max: proj].

    aRectangleCollider corners do: [:corner |
        proj := (axis x * corner x) + (axis y * corner y).
        bMin := bMin min: proj.
        bMax := bMax max: proj].

    ^ (aMax < bMin) or: [bMax < aMin]