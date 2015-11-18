public class Car
{
  private int myId;
  private int length;
  private boolean hasDrawn;
  private boolean canGoHorizontal;
  private boolean canGoVertical;
  private ArrayList<Integer> myXBlocks;
  private ArrayList<Integer> myYBlocks;
  private int carColor;

  public Car(int id, int x, int y)
  {
    myId = id;
    
    myXBlocks = new ArrayList<Integer>();
    myYBlocks = new ArrayList<Integer>();
    
    myXBlocks.add(x);
    myYBlocks.add(y);
    
    length = 1;
    hasDrawn = false;
    canGoHorizontal = false;
    canGoVertical = false;
    
    //carColor = color(random(50, 150), random(50, 150), random(50, 150));
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
    
    if(myXBlocks.get(0) == x)
    {
     canGoVertical = true;
     canGoHorizontal = false;
    }
    else
    {
     canGoVertical = false;
     canGoHorizontal = true;
    }
    
    length++;
  }
  
  public boolean selectCar(int x, int y, int columnSize)
  {
    if(x > getFirstX()*columnSize  && x < (getLastX()+1)*columnSize && y > getFirstY()*columnSize && y < (getLastY()+1)*columnSize)
    {
      return true;
    }
    return false;
  }
  
  public void moveCar(int x, int y, int columnSize)
  {
    if(!(x > getFirstX()*columnSize  && x < (getLastX()+1)*columnSize && y > getFirstY()*columnSize && y < (getLastY()+1)*columnSize))
    {
       if(canGoHorizontal){
         if(x < getFirstX()*columnSize)
         {
           println("mouse left"); 
         }
         if(x > (getLastX()+1)*columnSize)
         {
          println("mouse right"); 
         }
       }
       else if(canGoVertical)
       {
         if(y < getFirstY()*columnSize)
         {
          println("mouse up"); 
         }
         if(y > (getLastY()+1)*columnSize)
         {
           println("mouse down");
         }
       }
    }
    
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
}