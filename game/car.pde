public class Car
{
  private int myId;
  private int length;
  private boolean hasDrawn;
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
    
    carColor = color(random(50, 150), random(50, 150), random(50, 150));
  }

  public void toggleDrawn(boolean state)
  {
    hasDrawn = state;
  }

  public void addBlock(int x, int y)
  {
    myXBlocks.add(x);
    myYBlocks.add(y);
    
    length++;
  }
  
  public boolean selectCar(int x, int y, int columnSize)
  {
    if(x > getFirstX()*columnSize  && x < getLastX()*columnSize)// && y < getFirstY()*columnSize && y > getLastY()*columnSize)
    {
      return true;
    }
    return false;
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