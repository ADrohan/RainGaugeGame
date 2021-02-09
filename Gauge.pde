/*GAUGE CLASS
 In effect the gauge works as a game level timer 
 The gauge is a water effect that has been created from a series of vertical lines.
 Each line is drawn from two points (xCoord,yCoord,xCoord,height) with a constantly 
 changing yCoord value which uses Processing's noise function to return a perlin noise 
 value creating a smoother random effect that mimics water.
 
 The inspiration for this idea was taken from here - 
 https://www.funprogramming.org/38-Animate-the-ocean-surface-using-noise.html
 */

public class Gauge
{
  private float xCoord; //xCoord of line
  private float yCoord; //yCoord of line

  //position of gauge on y axis - could be used as offset to change gauge start location.
  private float gaugeLevel; 

  private float gaugeSpeed; //speed gauge empties
  private float wavy; // variable for noise function - adds movement to the waves so to speak 
  private float gaugeChoppy; // variable to controls how choppy the water looks

  // gauge constructor
  public Gauge() {
    wavy = 0;
    gaugeLevel = 1;
  }

  //method to update the gauge 
  //float gaugeSpeed controls the rate the gauge empties. 
  public void update(float gaugeSpeed) {
    setGaugeSpeed(gaugeSpeed);
    wavy = wavy + 0.05; // add movement creating wave effect
    gaugeLevel = gaugeLevel + this.gaugeSpeed; // updates the yCoord of lines to empty gauge
  }

  //method to display the gauge
  //gaugeChoppy controls how choppy the water. 
  //The higher the value the more choppy the water effect
  public void display(float gaugeChoppy) {
    setGaugeChoppy(gaugeChoppy);
    xCoord = 0;
    yCoord = 0;
    stroke(170, 190, 200);
    while (xCoord<width) {
      yCoord = gaugeLevel+this.gaugeChoppy*noise(xCoord/100, wavy);
      line(xCoord, yCoord, xCoord, height);
      xCoord++;
    }
  }

  //method to reset the gauge 
  public void gaugeReset() {
    wavy = 0;
    gaugeLevel = 1;
  }
  
  //method to check if the gauge is empty checking the yCoordinate value 
  //of the upper points in the lines that make up the gauge.
  public boolean reachBottom() {
    boolean gaugeEmpty = false;

    if (getYCoord() > height) {
      gaugeEmpty = true;
    }
    return gaugeEmpty;
  }

  //getters 
  public float getYCoord() {
    return yCoord;
  }
  public float getWavy() {
    return wavy;
  }
  public float getGaugeLevel() {
    return gaugeLevel;
  }
  public float getGaugeChoppy() {
    return gaugeChoppy;
  }
  public float getGaugeSpeed() {
    return gaugeSpeed;
  }
  public void setGaugeChoppy(float gaugeChoppy) {
    if ((gaugeChoppy >= 10) && (gaugeChoppy <= 200) ) {
      this.gaugeChoppy = gaugeChoppy;
    } else {
      this.gaugeChoppy = 30;
    }

    //println(gaugeChoppy);
  }

  public void setGaugeSpeed(float Speed) {
    if ((Speed >= 0.1) && (Speed <= 1)) {
      this.gaugeSpeed = Speed;
    } else {
      this.gaugeSpeed = 0.5;
    }
  }
}