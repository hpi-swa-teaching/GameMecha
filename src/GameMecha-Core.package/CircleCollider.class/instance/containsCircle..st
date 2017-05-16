containing
containsCircle: aCircle
	^ (self bounds center squaredDistanceTo: aCircle bounds center) <= ((self radius - aCircle radius) squared).