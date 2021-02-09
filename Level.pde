public class Level {

  private int missed; //drops missed
  private int caught; // drops caught
  private int levelNumber; //game level number

  //level constructor
  public Level (int levelNumber) {
    this.levelNumber = levelNumber;
  }

  //methods
  public void incrementMissed() {
    missed++;
  }

  public void incrementCaught() {
    caught++;
  }

  //getters
  public int getMissed() {
    return missed;
  }

  public int getCaught() {
    return caught;
  }

  public int getLevelNumber() {
    return levelNumber;
  }
}