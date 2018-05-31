Im am an acceptance test for the GM collision mechanics. I can be opened like any other morph.
I am responsible for presenting the different types of supported collisions and how create a various morphs with these different collisions.

Once opened I display various morphs. All morphs colored red collide with another morph, the others are colored green.
All morphs can be shuffeled by pressing space bar and manually draged around for more precise tests(e.g. top right brown button on the halo).

The most important methods for collision detection are 'initializeSubmorphs' and 'createXXXCollisionMorph' which display how to prepare a morph for collision, and 'evaluateMorphs', which 

TODO: this is a debug-acceptance test and ugly and will be refactored once time has come.