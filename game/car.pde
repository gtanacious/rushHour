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
}