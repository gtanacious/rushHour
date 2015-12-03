public class Car
{
  private int myId;
  private int length;
  private boolean isTargetCar;
  private boolean hasDrawn;
  private boolean canGoHorizontal;
  private boolean canGoVertical;
  private ArrayList<Integer> myXBlocks;
  private ArrayList<Integer> myYBlocks;
  private int carColor;
  private int animShift;

  public Car(int id, int x, int y)
  {
    myId = id;
    if (myId == 1) isTargetCar = true;

    myXBlocks = new ArrayList<Integer>();
    myYBlocks = new ArrayList<Integer>();

    myXBlocks.add(x);
    myYBlocks.add(y);

    length = 1;


    hasDrawn = false;
    canGoHorizontal = false;
    canGoVertical = false;

    animShift = 0;

    //carColor = color(random(50, 150), random(50, 150), random(50, 150));
    if (isTargetCar)
      carColor = color(100, 170, 100);
    else
      carColor = color(150, 100, 100);
  }

  public void toggleDrawn(boolean state)
  {
    hasDrawn = state;
  }

  public void addBlock(int x, int y)
  {
    myXBlocks.add(x);
    myYBlocks.add(y);

    if (myXBlocks.get(0) == x)
    {
      canGoVertical = true;
      canGoHorizontal = false;
    } else
    {
      canGoVertical = false;
      canGoHorizontal = true;
    }

    length++;
  }

  public boolean selectCar(int x, int y, int columnSize)
  {
    if (x > getFirstX()*columnSize  && x < (getLastX()+1)*columnSize && y > getFirstY()*columnSize && y < (getLastY()+1)*columnSize)
    {
      return true;
    }
    return false;
  }

  public void moveCar(int x, int y, int columnSize, ArrayList<Car> carsToCheck)
  {
    if (!(x > getFirstX()*columnSize  && x < (getLastX()+1)*columnSize && y > getFirstY()*columnSize && y < (getLastY()+1)*columnSize) && x > 0 && x < 795 && y > 0 && y < 795)
    {


      if (canGoHorizontal) {
        if (x < getFirstX()*columnSize)
        {         
          for (Car c : carsToCheck)
          {
            if (c.getId() != myId && c.checkCollision(getFirstX()-1, getFirstY())) 
              return;
          }

          for (int i = 0; i < myXBlocks.size(); i++)
          {
            myXBlocks.set(i, myXBlocks.get(i)-1);
          }
        } else if (x > (getLastX()+1)*columnSize)
        {        
          for (Car c : carsToCheck)
          {
            if (c.getId() != myId && c.checkCollision(getLastX()+1, getFirstY())) 
              return;
          }

          for (int i = 0; i < myXBlocks.size(); i++)
          {
            myXBlocks.set(i, myXBlocks.get(i)+1);
          }
        }
      } else if (canGoVertical)
      {
        if (y < getFirstY()*columnSize)
        {         
          for (Car c : carsToCheck)
          {
            if (c.getId() != myId && c.checkCollision(getFirstX(), getFirstY()-1)) 
              return;
          }

          for (int i = 0; i < myYBlocks.size(); i++)
          {
            myYBlocks.set(i, myYBlocks.get(i)-1);
          }
        } else if (y > (getLastY()+1)*columnSize)
        {         
          for (Car c : carsToCheck)
          {
            if (c.getId() != myId && c.checkCollision(getFirstX(), getLastY()+1)) 
              return;
          }

          for (int i = 0; i < myYBlocks.size(); i++)
          {
            myYBlocks.set(i, myYBlocks.get(i)+1);
          }
        }
      }
    }
  }

  public void moveCarEndGame(int x, int y, int columnSize, ArrayList<Car> carsToCheck)
  {
    if (!(x > getFirstX()*columnSize  && x < (getLastX()+1)*columnSize && y > getFirstY()*columnSize && y < (getLastY()+1)*columnSize))
    {

      if (canGoHorizontal) {
        if (x < getFirstX()*columnSize)
        {         
          for (Car c : carsToCheck)
          {
            if (c.getId() != myId && c.checkCollision(getFirstX()-1, getFirstY())) 
              return;
          }

          for (int i = 0; i < myXBlocks.size(); i++)
          {
            myXBlocks.set(i, myXBlocks.get(i)-1);
          }
        } else if (x > (getLastX()+1)*columnSize)
        {        
          for (Car c : carsToCheck)
          {
            if (c.getId() != myId && c.checkCollision(getLastX()+1, getFirstY())) 
              return;
          }

          for (int i = 0; i < myXBlocks.size(); i++)
          {
            myXBlocks.set(i, myXBlocks.get(i)+1);
          }
        }
      } else if (canGoVertical)
      {
        if (y < getFirstY()*columnSize)
        {         
          for (Car c : carsToCheck)
          {
            if (c.getId() != myId && c.checkCollision(getFirstX(), getFirstY()-1)) 
              return;
          }

          for (int i = 0; i < myYBlocks.size(); i++)
          {
            myYBlocks.set(i, myYBlocks.get(i)-1);
          }
        } else if (y > (getLastY()+1)*columnSize)
        {         
          for (Car c : carsToCheck)
          {
            if (c.getId() != myId && c.checkCollision(getFirstX(), getLastY()+1)) 
              return;
          }

          for (int i = 0; i < myYBlocks.size(); i++)
          {
            myYBlocks.set(i, myYBlocks.get(i)+1);
          }
        }
      }
    }
  }

  public boolean checkCollision(int x, int y)
  {
    for (int i = 0; i < myXBlocks.size(); i++)
    {
      for (int j = 0; j < myYBlocks.size(); j++)
      {
        if (myXBlocks.get(i) == x && myYBlocks.get(j) == y) return true;
      }
    }
    return false;
  }

  public boolean checkCollisionWithShift(int x, int y, int blockSize, int shift)
  {
    for (int i = 0; i < myXBlocks.size(); i++)
    {
      for (int j = 0; j < myYBlocks.size(); j++)
      {
        if (myXBlocks.get(i)*blockSize + shift == x && myYBlocks.get(j)*blockSize + shift == y) return true;
      }
    }
    return false;
  }

  public boolean isTargetCar()
  {
    return isTargetCar;
  }

  public void setColor(int newColor)
  {
    this.carColor = newColor;
  }

  public int getId()
  {
    return myId;
  }

  public int getLength()
  {
    return length;
  }

  public boolean getDrawn()
  {
    return hasDrawn;
  }

  public int getFirstX()
  {
    return myXBlocks.get(0);
  }

  public int getFirstY()
  {
    return myYBlocks.get(0);
  }

  public int getLastX()
  {
    return myXBlocks.get(myXBlocks.size()-1);
  }

  public int getLastY()
  {
    return myYBlocks.get(myYBlocks.size()-1);
  }

  public int getColor()
  {
    return carColor;
  }

  public boolean canGoVertical()
  {
    return canGoVertical;
  }

  public boolean canGoHorizontal()
  {
    return canGoHorizontal;
  }

  public void setAnimShift(int setVal)
  {
    animShift = setVal;
  }

  public int getAnimShift()
  {
    return animShift;
  }
  void car1(int x, int y, boolean horizontal) {
    strokeWeight(3);
    //begin tires
    pushMatrix();
    translate(x, y);
    if (horizontal) {
      scale(0.8);
      translate(325, 8);
      rotate(PI/2);
    }
    fill(0);
    rect(-5, 40, 20, 40, 5, 0, 0, 5);
    rect(135, 40, 20, 40, 0, 5, 5, 0);
    rect(-5, 220, 20, 40, 5, 0, 0, 5);
    rect(135, 220, 20, 40, 0, 5, 5, 0);
    //end tires
    fill(41, 37, 38);
    //fill(random(0,255), random(0,255), random(0,255));
    rect(0, 0, 150, 300, 75, 75, 10, 10); //body
    fill(201, 82, 16); //stripe color
    //quad(90, 53, 110,
    noStroke();
    rect(40, 2, 20, 298, 25, 0, 0, 0); //left stripe
    rect(90, 2, 20, 298, 0, 25, 0, 0); // right stripe
    fill(54, 52, 53);
    //pushMatrix();
    //translate(0, 20);
    quad(10, 70, 140, 70, 130, 120, 20, 120); // front windshield
    //popMatrix();
    quad(5, 70, 15, 125, 15, 225, 5, 260); // left window
    quad(145, 70, 135, 125, 135, 225, 145, 260); // right window
    quad(10, 260, 140, 260, 130, 230, 20, 230); // rear windshield
    strokeWeight(3);
    stroke(1);
    fill(41, 37, 38);
    line(5, 165, 15, 165); // left window divider
    line(145, 165, 135, 165); // right window divider
    noStroke();
    fill(233, 232, 230);
    //begin lights
    pushMatrix();
    translate(16, 16);
    rotate(-PI/8);
    rect(0, 0, 20, 8, 2, 2, 2, 2);
    popMatrix();
    pushMatrix();
    translate(120, 10);
    rotate(PI/8);
    rect(0, 0, 20, 8, 2, 2, 2, 2);
    popMatrix();
    popMatrix();
    //end lights
    //fill()
    stroke(5);
    strokeWeight(1);
  }

  void car2() {
    //begin tires
    pushMatrix();
    translate(550, 50);
    fill(0);
    rect(-5, 40, 20, 40, 5, 0, 0, 5);
    rect(135, 40, 20, 40, 0, 5, 5, 0);
    rect(-5, 220, 20, 40, 5, 0, 0, 5);
    rect(135, 220, 20, 40, 0, 5, 5, 0);
    //end tires
    fill(204, 0, 0);
    rect(0, 0, 150, 300, 45, 45, 10, 10); //body
    noStroke();
    fill(54, 52, 53);
    //pushMatrix();
    //translate(0, 20);
    quad(10, 70, 140, 70, 130, 120, 20, 120); // front windshield
    //popMatrix();
    quad(5, 70, 15, 125, 15, 225, 5, 260); // left window
    quad(145, 70, 135, 125, 135, 225, 145, 260); // right window
    quad(10, 280, 140, 280, 130, 250, 20, 250); // rear windshield
    strokeWeight(3);
    stroke(1);
    fill(41, 37, 38);
    line(5, 165, 15, 165); // left window divider
    line(145, 165, 135, 165); // right window divider
    noStroke();
    fill(233, 232, 230);
    //begin lights
    pushMatrix();
    translate(20, 10);
    rect(0, 0, 20, 8, 2, 2, 2, 2);
    popMatrix();
    pushMatrix();
    translate(110, 10);
    rect(0, 0, 20, 8, 2, 2, 2, 2);
    popMatrix();
    popMatrix();
  }

  void Bus() {
    pushMatrix();
    translate(50, 50);
    fill(0);
    rect(-5, 40, 20, 40, 5, 0, 0, 5);
    rect(135, 40, 20, 40, 0, 5, 5, 0);
    rect(-5, 370, 20, 40, 5, 0, 0, 5);
    rect(135, 370, 20, 40, 0, 5, 5, 0);
    fill(255, 216, 0);
    rect(0, 0, 150, 450, 20, 20, 10, 10);
    fill(233, 232, 230);
    //begin lights
    pushMatrix();
    translate(70, 51);
    rect(-50, -50, 20, 8, 2, 2, 2, 2);
    popMatrix();
    pushMatrix();
    translate(160, 51);
    rect(-50, -50, 20, 8, 2, 2, 2, 2);
    popMatrix();
    //end lights
    fill(54, 52, 53);
    //rect(65, 85, 120, 40);
    quad(15, 35, 135, 35, 130, 60, 20, 60);
    quad(20, 430, 130, 430, 135, 440, 15, 440);
    fill(255, 0, 0);
    rect(20, 448, 10, 3);
    rect(120, 448, 10, 3);
    //stroke(246, 239, 119);
    line(20, 90, 20, 390);
    line(130, 90, 130, 390);
    line(75, 90, 75, 390);
    popMatrix();
  }

  void Truck() {
    pushMatrix();
    translate(50, 50);
    fill(0);
    rect(-5, 40, 20, 40, 5, 0, 0, 5);
    rect(135, 40, 20, 40, 0, 5, 5, 0);
    rect(-5, 370, 20, 40, 5, 0, 0, 5);
    rect(135, 370, 20, 40, 0, 5, 5, 0);
    fill(63, 79, 232);
    rect(5, 0, 140, 150, 20, 20, 5, 5);
    fill(0, 75, 275);
    rect(0, 150, 150, 300, 10, 10, 10, 10);
    //begin lights
    fill(236, 253, 170);
    pushMatrix();
    translate(70, 51);
    rect(-50, -50, 20, 8, 2, 2, 2, 2);
    popMatrix();
    pushMatrix();
    translate(160, 51);
    rect(-50, -50, 20, 8, 2, 2, 2, 2);
    popMatrix();
    fill(54, 52, 53);
    quad(15, 35, 135, 35, 130, 50, 20, 50);
    //end lights
    popMatrix();
  }
}