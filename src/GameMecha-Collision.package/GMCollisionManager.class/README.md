GMCollisionManager maintains a list of morphs and checks all pairs efficiently for collisions whenever update is called. The morph MUST implement collider and the method MUST NOT return nil. To be notified, a registered morph must implement onCollision: aCollisionEvent. The event passed in is a GMMorphCollisionEvent.

Instance Variables
	morphs:		<Set>

morphs
	- is a Set that contains all morphs that collision checks are performed on. Morphs can be added via addMorph and removed via removeMorph. 
