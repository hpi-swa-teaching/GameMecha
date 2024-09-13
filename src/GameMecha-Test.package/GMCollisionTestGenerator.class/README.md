This is a small tool for integrated testing of the GM collision. Similar to, for example, FIT (framework for integrated testing), it allows the user to test and create various collision scenarios and save them as executable acceptance tests, which later are automatically tested. It is also helpful for developers to integrate, test and debug new or existing kinds of collisions.

Open this tool with "GMCollisionAcceptanceGenerator open."
Usage:
First of all, select a type of collision (e.g. collision between rotated rectangles) using the collision selector at the top right of the tool.
Now you can move the morphs using their halo (hold shift and click on the morph using the middle mouse button or hold shift and alt and click with the left mouse button).
The color of the morphs tells you whether a collision is detected (red) or not (green)
If you want to store this scenario as a test (maybe because you found a bug and the collision is not detected) you can use the buttons "store 'collision'" or "store 'no collision'". This stores the scenario temporarily and you can create more scenarios repeating the steps described before.
If you want to permanently store the scenarios you created click "save tests" and the scenarios will be stored in form of a test, asserting that there should be a collision (when you had chosen "store 'collision'") or not. These tests can afterwards be executed as every other test in the image (you can find it in the class GMCollisionAutomatedAcceptanceTest). The click on "save test" also deletes all previously created tests of the tool.

The button "reset scenarios" deletes all temporarily stored scenarios.
