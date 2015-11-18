//this is an initial document to post to github
int[][] board =  {
  {0, 0, 5, 5, 3, 0}, 
  {0, 0, 9, 9, 3, 0}, 
  {1, 1, 0, 0, 2, 0}, 
  {6, 6, 6, 0, 2, 4}, 
  {0, 0, 8, 8, 8, 4}, 
  {0, 0, 0, 0, 0, 4}
};
int boardWidth, anim;
boolean hasWon;
ArrayList<Car> cars;
Car mySelectedCar;

void setup()
{
  size(800, 800);
  boardWidth = 800/board.length;

  hasWon = false;
  anim = 0;
  
  cars = new ArrayList<Car>();

  for (int y = 0; y < board.length; y++)
  {
    for (int x = 0; x < board[y].length; x++)
    {
      if (board[y][x] != 0)
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
}

void draw()
{
  background(150);
  noStroke();
  
  if(anim > 20)
  {
    fill(0);
    if(anim > 40) anim = 0;
  }
  else
    fill(255);
  anim++;
  rect(5*boardWidth+boardWidth/8, 2*boardWidth+boardWidth/2.5, 70, 25);
  triangle(5*boardWidth+75, 2*boardWidth+91, 5*boardWidth+116, 2*boardWidth+66, 5*boardWidth+75, 2*boardWidth+40);
  
  stroke(0);
  strokeWeight(5);
  for (int y = 0; y < board.length; y++)
  {
    for (int x = 0; x < board[y].length; x++)
    {
      line(x * boardWidth, 0, x*boardWidth, 800);
      line(0, y*boardWidth, 800, y*boardWidth);
    }
  }

  //draw game
  for (int y = 0; y < board.length; y++)
  {
    for (int x = 0; x < board[y].length; x++)
    {
      for (Car c : cars)
      {
        if (c.getId() == board[y][x] && !c.getDrawn())
        {
          fill(c.getColor());
          rect(c.getFirstX() * boardWidth, c.getFirstY() * boardWidth, (c.getLastX()+1 - c.getFirstX()) * boardWidth, (c.getLastY()+1 - c.getFirstY()) * boardWidth);
          c.toggleDrawn(true);
        }
      }
    }
  }

  //perform update tasks & checking of game
  for (Car c : cars)
  {
    if(c.isTargetCar() && c.getLastX() == 5)
    {
       hasWon = true;
       fill(230);
       rect(200, 300, 400, 130);
       fill(10);
       textAlign(CENTER);
       textFont(createFont("Times", 80, true), 80);
       text("YOU WIN!", 400, 400);
    }
    c.toggleDrawn(false);
  }
}

void mousePressed()
{

  for (Car c : cars)
  {
    if (c.selectCar(mouseX, mouseY, boardWidth))
    {
      if (!c.equals(mySelectedCar))
      {
        if(mySelectedCar != null) mySelectedCar.setColor(color(red(mySelectedCar.getColor())-50, blue(mySelectedCar.getColor())-50, green(mySelectedCar.getColor())-50));
        int col = color(red(c.getColor())+50, blue(c.getColor())+50, green(c.getColor())+50);
        c.setColor(col);
        mySelectedCar = c;
      }
    }
  }
}

void mouseDragged()
{
   mySelectedCar.moveCar(mouseX, mouseY, boardWidth, cars); 
}