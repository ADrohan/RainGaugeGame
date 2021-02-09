
public class Drop 
{
  private float xCoord; //xCoord of ellipse
  private float yCoord; //yCoord of ellipse
  private float diameter; // diameter of ellipse
  private float speedY; // value of change in yCoord from frame to frame

  //drop constructor
  public Drop() {
    resetDrop();
  }

  //methods to check if the drop has fallen out of view, i.e. is > height 
  public boolean update() {
    boolean dropMissed = false;

    yCoord+= speedY;

    if (yCoord > height) {
      resetDrop();
      dropMissed = true;
    }
    return dropMissed;
  }
  
  //method to display drop
  public void display (float diameter)
  {
    setDiameter(diameter);
    fill(50, 100, 150);
    noStroke(); 
    //raindrop
    for (int i = 2; i < 8; i++ ) {
      ellipse(xCoord, yCoord + i*this.diameter, i*this.diameter, i*this.diameter);
    }
    raining();
  }
  
  // method to move drop 
  public void raining() {
    yCoord+=speedY;
  }
  
  // method to reset the drops y coord to re-enter from the top of the display
  private void resetDrop() {
    xCoord = random(width);
    yCoord = -200;
    speedY = random(3, 5);
  }

  //getters and setters
  public float getXCoord() {
    return xCoord;
  }
  public float getYCoord() {
    return yCoord;
  }  

  public float getDiameter() {
    return diameter;
  }
  //setter to restrict the size of the drops by diameter
  public void setDiameter(float diameter) {
    if ((diameter>=1) && (diameter<=3)) {
      this.diameter = diameter;
    } else {
      this.diameter = 2;
    }
  }
}