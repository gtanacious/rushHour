//this is an initial document to post to github
int[][] board =  {
  {0, 0, 5, 5, 3, 0}, 
  {0, 0, 1, 1, 3, 0}, 
  {0, 0, 0, 2, 2, 4}, 
  {6, 6, 6, 0, 0, 4}, 
  {0, 0, 8, 8, 0, 4}, 
  {0, 0, 0, 0, 0, 4}
};
int boardWidth;
ArrayList<Car> cars;

void setup()
{
  size(800, 800);
  boardWidth = 800/board.length;

  cars = new ArrayList<Car>();
  
  for (int y = 0; y < board.length; y++)
  {
    for (int x = 0; x < board[y].length; x++)
    {
      if(board[y][x] != 0)
      {
        boolean willAdd = true;
        for (Car c : cars) {
          if (c.getId() == board[y][x] )
          {
            c.addBlock(x, y);
            willAdd = false;
          }
        }
        if (willAdd)
        {
          cars.add(new Car(board[y][x], x, y));
        }
      }
    }
  }

  noLoop();
}

void draw()
{
  background(150);

  strokeWeight(5);
  for (int y = 0; y < board.length; y++)
  {
    for (int x = 0; x < board[y].length; x++)
    {
      line(x * boardWidth, 0, x*boardWidth, 800);
      line(0, y*boardWidth, 800, y*boardWidth);
    }
  }

  for (int y = 0; y < board.length; y++)
  {
    for (int x = 0; x < board[y].length; x++)
    {
       for(Car c : cars)
       {
         if(c.getId() == board[y][x] && !c.getDrawn())
         {
           int length = c.getLength();
           
           println(c.getLastY() + "   " + c.getFirstY() + "   " + c.getId());
           fill(c.getColor());
           rect(c.getFirstX() * boardWidth, c.getFirstY() * boardWidth, (c.getLastX()+1 - c.getFirstX()) * boardWidth,(c.getLastY()+1 - c.getFirstY()) * boardWidth);
           //rect(c.getFirstX() * boardWidth, c.getFirstY() * boardWidth, boardWidth, boardWidth);
           c.toggleDrawn(true);
         }
       }
    }
  }
  
  for (int y = 0; y < board.length; y++)
  {
   for (int x = 0; x < board[y].length; x++)
   {
     for(Car c : cars)
     {
       if( c.selectCar(y, x, boardWidth))
       {
        rect(x, y, 1, 1); 
       }
     }
   }
  }

  for(Car c : cars)
   {
       c.toggleDrawn(false);
   }
  
}



void mousePressed()
{

  for(Car c : cars)
   {
      c.selectCar(mouseX, mouseY, boardWidth);
   }
  
  
}