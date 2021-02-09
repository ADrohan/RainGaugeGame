//CODE WITH ALL SOUND FX COMMENTED OUT
//import processing.sound.*; 

//SoundFile []soundFx = new SoundFile[2];
Drop[] drops = new Drop [4];
Catcher catcher = new Catcher();
Gauge gauge = new Gauge();
Level[] levels = new Level[2];

int gameLevel = 0;  //current level in game
boolean gameOver = false;
int textSize = 18;

void setup() {
  size(600, 600);
  noCursor();
 // soundFx[0] = new SoundFile(this, "sound01.mp3");
  //soundFx[1] = new SoundFile(this, "sound02.mp3");
  for (int i = 0; i < levels.length; i++) {
    levels[i] = new Level (i+1);
  }
  for (int i = 0; i <drops.length; i++) {
    drops [i] = new Drop();
  }
}

void draw() {
  // if the game is in play and in the first level 
  // display and update the gauge and catcher & run the game
  if (gameLevel == 0) {
    if (!gameOver) {
      background(255, 220, 41);
      gauge.display(30); // field to control gauge water choppy effect
      gauge.update(.5); // field to control speed 
      catcher.display(150, 50, 20); // fields (width, height, base offset)
      catcher.update(); 
      runGame();
      if (gauge.reachBottom() == true) {
        gameOver = true;
      }
    } else {
      // move to the next level
      //println("LEVEL OVER>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
      levelUp();
    }
  }
  if (gameLevel == 1) {
    if (!gameOver) {
      background(255, 148, 41);
      gauge.display(100);
      gauge.update(0.7);
      catcher.display(60, 80, 20);
      catcher.update(); 
      runGame();
      if (gauge.reachBottom() == true) {
        gameOver = true;
      }
    } else {
      //println("GAME OVER >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>!");
      endGame();
    }
  }
}

//COLLISION DETECTION ALGORITHM
boolean hitCatcher (Catcher catcher, Drop drop) {

  float dropDistanceX = abs(drop.getXCoord() - catcher.getXCoord() - catcher.getCatcherWidth()/2);
  float dropDistanceY = abs(drop.getYCoord() - catcher.getYCoord() - catcher.getCatcherHeight()/2);

  if (dropDistanceX > (catcher.getCatcherWidth()/2+ drop.getDiameter()/2) ) {
    return false;
  }
  if (dropDistanceY > (catcher.getCatcherHeight()/2 + drop.getDiameter()/2)) {
    return false;
  }
  if (dropDistanceX <=catcher.getCatcherWidth()/2) {
    return true;
  }
  if (dropDistanceY <=catcher.getCatcherHeight()/2) {
    return true;
  } else {
    return false;
  }
}

void runGame() 
{
  for (int i=0; i<drops.length; i++) {
    drops[i].display(2);
    if (drops[i].update() == true) {
      levels[gameLevel].incrementMissed(); //dropsMissed++;
      // println("Drops missed: " + levels[gameLevel].getMissed());
    }
    boolean collision = hitCatcher(catcher, drops[i]);
    if (collision == true) {
      levels[gameLevel].incrementCaught();  //score++;
      // println("Score: " + levels[gameLevel].getCaught());   
      //int selectSound = (int)random(2); //must cast to int - or error message returned 'cannot convert from float to int'
     // soundFx[selectSound].play();
      drops[i].resetDrop();
    }
  }    
 
  // display the score and drops missed to the upper left corner of the display
  fill(0);
  textSize(textSize);
  text("Drops caught: " + levels[gameLevel].getCaught(), width/textSize, textSize);
  text("Drops missed: " + levels[gameLevel].getMissed(), width/textSize, textSize*2);
}

void levelUp() { //prepare for the next level
  println("Level Over>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
  println("Starting a new level...");
  gameOver = false;
  gauge.gaugeReset();
  gameLevel++;
}

void endGame() { //println("GAME OVER>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
  fill(255, 148, 41);
  rect(0, 0, width, height);
  fill(0);
  textSize(textSize*3);
  textAlign(CENTER);
  text ("Game Over!", width/2, height/5);
  textSize(textSize);
  textAlign(LEFT);
  text( "LEVEL 1", width/3, height/4 + textSize); 
  text ("Drops caught: " + levels[0].getCaught(), width/3, height/4 + textSize*2);
  text ("Drops missed: "  + levels[0].getMissed(), width/3, height/4 +textSize*3);
  text( "LEVEL 2", width/3, height/4 + textSize* 5); 
  text ("Drops caught: " + levels[1].getCaught(), width/3, height/4 + textSize* 6);
  text ("Drops missed: "  + levels[1].getMissed(), width/3, height/4 + textSize* 7);
  int level1 = (levels[0].getCaught() - levels[0].getMissed())*3;
  int level2 = (levels[1].getCaught() - levels[1].getMissed())*5;
  int average = (level1+level2)/2;
  text ( "OVERALL SCORE: " + average, width/3, height/4 + textSize*9);
  //println(level1);
  //println(level2);
  //println(average);

  /*
  println( "Level 1 results: " + "\n" 
   + "Drops caught: " + levels[0].getCaught() +"\n" 
   + "Drops missed: "  + levels[0].getMissed() );
   println( "Level 2 results: " + "\n"
   + "Drops caught: " + levels[1].getCaught() +"\n" 
   + "Drops missed: "  + levels[1].getMissed() );
   */
}