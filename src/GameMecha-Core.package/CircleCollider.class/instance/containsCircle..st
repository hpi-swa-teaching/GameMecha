containing
containsCircle: aCircle 
	^ self radius >= aCircle radius
		and: [(self bounds center squaredDistanceTo: aCircle bounds center)
				<= (self radius - aCircle radius) squared]