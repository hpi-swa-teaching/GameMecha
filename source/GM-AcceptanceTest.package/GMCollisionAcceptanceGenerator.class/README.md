A small tool for integrated testing of our collision. Similar too for example FIT (framework for integrated testing) it allows the user to test and create various collision scenarios and save them as executable acceptance tests which later are automated tested. Also helpful for developers to integrate, test and debug new or existing kinds of collisions.

Because this test uses pheno you have to open it using "GMCollisionAcceptanceGenerator open." 
Usage:
First of all select a type of collision (e.g. collision between rotated rectangles) using the collisio selector at the top right of the tool.
Now you can move the morphs using their halo (hold shift and click on the morph using the middle mouse botton or hold shift and alt and click with the left mouse botton).
The color of the morphs tells you wether a collision is detected (red) or not (green)
If you want to store this scenario as a test (maybe because you found a bug and the collision is not detected) you can use the buttons "store 'collision'" or "store 'no collision'". This stores the scenario temporarily and you can create more scenarios repeating the steps described before.
If you want to permanently store the scenarios you created click "save tests" and the scenarios will be stored in form of a test asserting that their should be a collision (when you had chosen "store 'collision'") or their should be no collision. This tests afterwards can be executed as every other test in the image (you find it in the class GMCollisionAutomatedAcceptanceTest). The click on "save test" also deletes all previously with the tool created tests.

The button "reset scenarios" deletes all temporarly stored scenarios.