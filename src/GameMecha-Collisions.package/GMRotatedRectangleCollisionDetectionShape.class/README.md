A GMRotatedRectangleCollisionDetectionShape is a strategy for morphs which want to collide with their rotated rectangle collision shape.
It supplies methods for the double dispatch.
A Morph gets a TransformationMorph when rotating. It expects the TransformationMorph to be the owner of the morph with the shape (default).