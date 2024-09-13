A GMCollisionHandler checks for collision partners of a specific morph on request. 
"morphsCollidingWith: aMorph" will return all registered morphs colliding with said morph. Morphs can be registered by "addMorph: aMorph" and thus will be considered in future collision checks. 
The CollisionHandler expects each morph to have a CollisionDetectionStrategy. 
The method "is: aMorph collidingWith: anotherMorph" provides a way to check whether two specific morphs are colliding with each other.