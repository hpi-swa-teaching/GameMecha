utility
isSeparatedFromCircle: aCircleCollider onAxis: axis

    | aMin aMax proj centerProj |
    aMin := Float infinity.
    aMax := Float infinity negated.

    self corners do: [:corner |
        proj := (axis x * corner x) + (axis y * corner y).
        aMin := aMin min: proj.
        aMax := aMax max: proj].

    centerProj := (axis x * aCircleCollider center x) + (axis y * aCircleCollider center y).

    ^ (aMax < (centerProj - aCircleCollider radius)) or: [(centerProj + aCircleCollider radius) < aMin]