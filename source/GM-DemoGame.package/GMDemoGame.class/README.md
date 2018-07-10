The GMDemoGame represents the level in which the game takes place. To play the game, open an instance of this class inWorld. The demoGame is responsible for setting everything up and for holding the collisionHandler.
Every morph which wants to be considered during collision detection has to be registered at the collisionHandler. Furthermore, a morph registering at the collisionHandler needs to have a collisionDetectionStrategy.
Furthermore, the demoGame is responsible for listening to keyboard inputs. Other entites may ask it wheter certain keys are pressed. Only one morph at a time can have the keyboard focus and consequently receive keyboard events.

To play use W,A,S,D and the arrow keys.