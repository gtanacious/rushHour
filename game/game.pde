//this is an initial document to post to github

ArrayList<int[][]> level;
int boardWidth, anim;
boolean hasWon, hasLost;
ArrayList<Car> cars;
Car mySelectedCar;
int[][] board; 
int levelNumber;
int shift;
int timer;
float textAnim;
color[] carColor = new color[12];

void setup()
{
  // Random car colors
  for (int i = 0; i < carColor.length; i++) {
    carColor[i] = color(random(0, 255), random(0, 255), random(0, 255));
  }
  level = new ArrayList<int[][]>();

  int[][] board1 =  {
    {0, 0, 0, 2, 0, 0}, 
    {4, 4, 0, 2, 0, 0}, 
    {0, 1, 1, 2, 0, 0}, 
    {5, 3, 3, 3, 0, 0}, 
    {5, 0, 0, 0, 0, 0}, 
    {5, 0, 0, 0, 0, 0}
  };
  level.add(board1);
  int[][] board2 =  {
    {2, 0, 0, 11, 0, 0}, 
    {2, 3, 3, 11, 0, 10}, 
    {1, 1, 4, 0, 0, 10}, 
    {0, 5, 4, 8, 8, 10}, 
    {0, 5, 6, 7, 0, 0}, 
    {0, 0, 6, 7, 9, 9}
  };
  level.add(board2);
  int[][] board3 =  {
    {2, 3, 3, 3, 5, 0}, 
    {2, 4, 4, 4, 5, 0}, 
    {1, 1, 10, 11, 5, 0}, 
    {0, 0, 10, 11, 6, 6}, 
    {0, 0, 9, 9, 9, 7}, 
    {0, 0, 0, 8, 8, 7}
  };
  level.add(board3);
  int[][] board4 =  {
    {6, 6, 6, 4, 2, 3}, 
    {7, 5, 5, 4, 2, 3}, 
    {7, 0, 1, 1, 2, 3}, 
    {8, 8, 10, 0, 0, 0}, 
    {0, 9, 10, 0, 13, 13}, 
    {0, 9, 11, 11, 12, 12}
  };
  level.add(board4);
  levelNumber = 0;

  board = level.get(levelNumber);
  size(1000, 800);
  boardWidth = 800/board.length;

  hasLost = hasWon = false;
  anim = 0;
  shift = 0;
  textAnim = 0;

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

  timer = 60000;
}

void draw()
{
  background(150);
  noStroke();

  if (anim > 20)
  {
    fill(0);
    if (anim > 40) anim = 0;
  } else
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
  line(800, 0, 800, 800);


  if (hasLost)
  {
    Car nD = cars.get((int)random(0, cars.size())); 

    if (nD.canGoHorizontal)
    {

      boolean willUpdate = true;
      for (Car c : cars)
      {
        if (c.canGoHorizontal && !c.equals(nD))
        {
          if (c.getFirstX()*boardWidth+c.animShift <= nD.getLastX()*boardWidth+nD.animShift+boardWidth && c.getLastX()*boardWidth+c.animShift >= nD.getFirstX()*boardWidth+nD.animShift && c.getFirstY() == nD.getFirstY())
          {
            willUpdate  = false;
          }
        } else if (c.canGoVertical && !c.equals(nD))
        {
          if (c.getFirstX()*boardWidth <= nD.getLastX()*boardWidth+nD.animShift+boardWidth && c.getLastX()*boardWidth > nD.getLastX()*boardWidth+nD.animShift && 
            ((nD.getFirstY()*boardWidth <= c.getLastY()*boardWidth+c.animShift) && (nD.getFirstY()*boardWidth + boardWidth >= c.getFirstY()*boardWidth+c.animShift)))
          { 
            willUpdate = false;
          }
        }
      }

      if (willUpdate)
      {
        nD.setAnimShift(nD.getAnimShift()+5);
      }
      if (nD.getAnimShift() >= boardWidth)
      {
        nD.setAnimShift(0);
        for (int i = 0; i < nD.myXBlocks.size(); i++)
        {
          nD.myXBlocks.set(i, nD.myXBlocks.get(i)+1);
        }
      }
    } else
    {

      boolean willUpdate = true;
      for (Car c : cars)
      {
        if (c.canGoHorizontal && !c.equals(nD))
        {
          if (c.getFirstY()*boardWidth <= nD.getLastY()*boardWidth+nD.animShift+boardWidth && c.getLastY()*boardWidth > nD.getLastY()*boardWidth+nD.animShift && 
            ((nD.getFirstX()*boardWidth <= c.getLastX()*boardWidth+c.animShift) && (nD.getFirstX()*boardWidth + boardWidth >= c.getFirstX()*boardWidth+c.animShift)))
          {
            willUpdate = false;
          }
        } else if (c.canGoVertical && !c.equals(nD))
        {
          if (c.getFirstY()*boardWidth+c.animShift <= nD.getLastY()*boardWidth+nD.animShift+boardWidth && c.getLastY()*boardWidth+c.animShift >= nD.getFirstY()*boardWidth+nD.animShift && c.getFirstX() == nD.getFirstX())
          { 
            willUpdate = false;
          }
        }
      }

      if (willUpdate)
      {
        nD.setAnimShift(nD.getAnimShift()+5);
      }
      if (nD.getAnimShift() >= boardWidth)
      {
        nD.setAnimShift(0);
        for (int i = 0; i < nD.myYBlocks.size(); i++)
        {
          nD.myYBlocks.set(i, nD.myYBlocks.get(i)+1);
        }
      }
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
          if (c.canGoHorizontal && c.getId() != 1) {
            c.car2(c.getFirstX() * boardWidth + c.getAnimShift(), c.getFirstY() * boardWidth, true, color[c.getId()]);
            //rect(c.getFirstX() * boardWidth + c.getAnimShift(), c.getFirstY() * boardWidth, (c.getLastX()+1 - c.getFirstX()) * boardWidth, (c.getLastY()+1 - c.getFirstY()) * boardWidth);
          }
          if (c.getId() == 1) {
            c.car1(c.getFirstX() * boardWidth + c.getAnimShift(), c.getFirstY() * boardWidth, true);
          }
          } else
            rect(c.getFirstX() * boardWidth, c.getFirstY() * boardWidth + c.getAnimShift(), (c.getLastX()+1 - c.getFirstX()) * boardWidth, (c.getLastY()+1 - c.getFirstY()) * boardWidth);

          c.toggleDrawn(true);
        }
      }
    }
  }


  int timeLeft = 0;
  if ((timer - millis() <= 0))
  {
    timeLeft = 0;
    hasLost = true;
    shift++;
  } else if (!hasWon)
  {
    timeLeft =  timer - millis();
  }
  fill(200);
  rect(800, 0, 200, 800);

  fill(0);
  textAlign(CENTER);
  textFont(createFont("Times", 80, true), 30);
  text("Time Left:", 900, 100);
  if (((timeLeft/1000)%60) < 10)
  text(timeLeft/60000 + ":0" + (timeLeft/1000)%60+"", 900, 200);
  else
    text(timeLeft/60000 + ":" + (timeLeft/1000)%60+"", 900, 200);

  //perform update tasks & checking of game
  for (Car c : cars)
  {
    if (c.isTargetCar() && c.getLastX() == 5 && !hasLost)
    {
      textAnim+=1;
      hasWon = true;
      stroke(0, textAnim);
      fill(230, (int)textAnim);
      rect(200, 300, 400, 130);
      fill(10, (int)textAnim);
      textAlign(CENTER);
      textFont(createFont("Times", 80, true), 80);
      text("YOU WIN!", 400, 400);
    }
    if (hasLost)
    {
      textAnim+=0.1;
      stroke(0, textAnim);
      fill(230, (int)textAnim);
      rect(200, 300, 400, 130);
      fill(10, (int)textAnim);
      textAlign(CENTER);
      textFont(createFont("Times", 80, true), 80);
      text("YOU LOST", 400, 400);
    }
    c.toggleDrawn(false);
  }
}

void mousePressed()
{
  if (hasWon)
  {    
    levelNumber++;
    if (levelNumber < level.size())
    {
      board = level.get(levelNumber);  
      hasWon = false;
      anim = 0;
      textAnim = 0;

      timer = millis() + 60000 + (60000 * levelNumber);

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
    else
    {
      //do something to switch to the last scene. 
    }
  } else if (hasLost)
  {
    levelNumber = 0;
    board = level.get(levelNumber);  
    hasWon = false;
    hasLost = false;
    anim = 0;
    textAnim = 0;
    timer = millis() + 60000;

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
  } else if (!hasLost)
  {
    for (Car c : cars)
    {
      if (c.selectCar(mouseX, mouseY, boardWidth))
      {
        if (!c.equals(mySelectedCar))
        {
          if (mySelectedCar != null) mySelectedCar.setColor(color(red(mySelectedCar.getColor())-50, blue(mySelectedCar.getColor())-50, green(mySelectedCar.getColor())-50));
          int col = color(red(c.getColor())+50, blue(c.getColor())+50, green(c.getColor())+50);
          c.setColor(col);
          mySelectedCar = c;
        }
      }
    }
  }
}
}

void mouseDragged()
{
  if (!hasLost && mySelectedCar != null)
  {
    mySelectedCar.moveCar(mouseX, mouseY, boardWidth, cars);
  }
}