containing
containsCircle: aCircleBehavior
	^ self radius >= aCircleBehavior radius
		and: [(self target bounds center squaredDistanceTo: aCircleBehavior target bounds center)
				<= (self radius - aCircleBehavior radius) squared].