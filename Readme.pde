/*
 Name: Aileen Drohan
 Student Number: 2008221
 
 BRIEF DESCRIPTION OF THE ANIMATION ACHIEVED
   
 How the game works:
 - The aim of the game is to catch as many raindrops as possible with a rain catcher
 before the water gauge runs dry. 
 - It is a one player game with two levels. The game starts with level 0.
 - In each level the player must use their mouse to move the raindrop catcher to 
   catch the raindrops. 
 - The raindrops are called from an array of objects of type Drop.
 - As the raindrops fall, a collision detection algorithm checks if a drop has 
 intersected the catcher.
 - Each time a collision is detected, a random integer calls a sound file with 
 matching index to play from an array of soundFx. 
 - Keeping track of the drops caught/ missed scores in each game level is done by calling 
 the incrementCaught()/incrementMissed() methods from the levels class.
 - When no collision is detected and a drops yCoord is > Height, a drop has been 
 missed and the drop is reset to a negative yCoord position (i.e. offscreen) to 'rain' 
 again at a random speed. The speed value is contiuously added to the drops 
 yCoordinate so if a drop has not been caught it will fall faster and faster with each iteration
 - Each level ends when a boolean condition in the Gauge class is returned as true
 (i.e when the gauge is empty).
 - When level 0 ends, the method levelUp()is called. This increments the level by 1,
  sets gameOver as false and resets the gauge values associated with the yCoord of 
  the lines drawn by calling the gaugeReset() method from the gauge class.
 - As gameover is now false and level 1 is now in play a new catcher and gauge object 
 with different parameters are displayed and updated and the game runs again calling 
 the runGame() method.
 - When the second level ends the endGame() method is called and the players results 
 are displayed on screen. The stats shown detail the drops caught and missed for each 
 level in addition to an overall score which has been calculated by adding together 
 level 0 and 1 ((drops caught - drops missed) * weighting for level) results and 
 deviding by 2.
 
 Sources used
 1. The animation is a retake on a simple rain catcher game as seen in 
 http://learningprocessing.com/examples/chp10/example-10-10-rain-catcher-game
 2. The game utilises Processing's Sound Library for sound fx.
 https://processing.org/reference/libraries/sound/SoundFile.html
 3. Processings noise function (perlin noise) https://processing.org/reference/noise_.html
 is also used to create a water effect which was inspired by 
 https://www.funprogramming.org/38-Animate-the-ocean-surface-using-noise.html
 
 JUSTIFICATION OF SPEC
 *   Usual Processing class with setup(), draw(), bespoke methods runGame(), levelUp() 
     and endGame() and use of a collision detection algorithm.
 *   4 user defined classes (Catcher, Drop, Gauge and Level) with fields, constructors, 
     getters, setters and methods.
 *   Use of selection(if) and iteration (loops)
     1. In the Main Processing Sketch:
       - 2 x for loops are used to initialise an array of drops and and array of levels
     2. In the Catcher Class:  
       - If statements are used in the setters and update () method 
       to restrict the size and location of any catcher object created.
     3. In the Drop Class:
       - A for loop is used to create the raindrop effect by 
       drawing a series of ellipses using the Loop control variable as a multiplier
       of the set diameter.
       - If statements are used to restrict the size of the drop diameter in a 
       setter for the drop diameter.
     4.In the Gauge Class:
       - The gaugeDisplay() method utilises a while loop to draw
       vertical lines. This method uses perlin noise to randomise and 
       decrement the yCoord values of the lines' points nearest the X axis.
*    Use of primitive/object arrays.  
     - Use of two bespoke object arrays - 
     an array of drops of type Drop 
     an array of levels of type Level
     - Use of processing Sound Library 
     an object array of soundfx of type SoundFile
       
        
 KNOWN BUGS/PROBLEMS
 There appears to a bug in Processings sound library that returns a 
 non fatal error, resembling the following but with varying node values:
 ERROR: /node/free: Node 83 not found
 
 */