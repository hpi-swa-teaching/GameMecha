This acceptance test is a simple tutorial for basic mouse handling and does not use any of the GM library functions. It is supposed to be opened like any other morph.
When being clicked, the morph will change its color. When the mouse button is hold down, the morph will grow with the step rate specified in mouseStillDownStepRate. Once the mouse button is released the morph jumps to a random position on screen.
In addition, some passive drag and drop behavior is implemented. If the mouse enters the morph while dragging something (to be more precise if the mouse enters the morph while a mouse button is pressed), the morph gets a bold red border. This border disappears when something is dragged out of the morph.

To achieve this behavior some methods for mouse handling have to be overwritten. See all the overwritten methods of this class (all except initialize) for more detail.