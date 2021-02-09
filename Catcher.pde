public class Catcher 
{
  private int xCoord; // x pos of top left of catcher
  private int yCoord; //y pos at top left of catcher
  private int catcherWidth;// width of top of catcher
  private int catcherHeight; // height of catcher
  private int baseOffset; // base indent amount 

  //catcher constructor
  public Catcher() 
  {
    xCoord = width/2;
    yCoord = height-this.catcherHeight;
  }

  //method to update catcher position 
  public void update() {

    xCoord = mouseX;

    if (xCoord <=0 +catcherWidth/2) {
      xCoord = 0;
    }
    if (xCoord >= width- catcherWidth/2) {
      xCoord =width -catcherWidth;
    }
    yCoord = mouseY;
    if (yCoord<= height/2) {
      yCoord = height/2;
    }
    if (yCoord >= height - catcherHeight) {
      yCoord = height- catcherHeight;
    }
  }
  
  //method to display catcher
  public void display(int catcherWidth, int catcherHeight, int baseOffset) {
    setCatcherWidth(catcherWidth);
    setCatcherHeight(catcherHeight);
    setBaseOffset(baseOffset);
    fill(30);
    noStroke();
    //quad drawn from top left in clockwise direction
    quad(xCoord, yCoord, 
      xCoord + this.catcherWidth, yCoord, 
      xCoord + this.catcherWidth - this.baseOffset, yCoord + this.catcherHeight, 
      xCoord + this.baseOffset, yCoord +this.catcherHeight);
  }
  //getters (accessors)
  public int getXCoord() {
    return xCoord;
  }

  public int getYCoord() {
    return yCoord;
  }

  public int getCatcherWidth() {
    return catcherWidth;
  }

  public int getCatcherHeight() {
    return catcherHeight;
  }

  public int getBaseOffset() {
    return baseOffset;
  }

  //setter to restrict catcher width
  public void setCatcherWidth(int catcherWidth) {
    if ((catcherWidth >= 80) && (catcherWidth <= 200)) {
      this.catcherWidth = catcherWidth;
    } else {
      this.catcherWidth = 80;
    }
  }
  
  //setter to restrict catcher height
  public void setCatcherHeight(int Height) {

    if ((Height >= 50) && (Height <= 80)) {
      this.catcherHeight = Height;
    } else {
      this.catcherHeight = 50;
    }
  }
  
  //setter to restrict catcher base indent value
  public void setBaseOffset(int baseOffset) {
    if ((baseOffset >= 20) && (baseOffset <= 40)) {
      this.baseOffset = baseOffset;
    } else {
      this.baseOffset = 20;
    }
  }
}