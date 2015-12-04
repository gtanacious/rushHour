//Scene1: wake up and find out late to work

import processing.sound.*;
SoundFile file;

PImage img1;
PFont fontBold;

float personRotate;
float LlegR;
float RlegR;
float LarmR;
float RarmR;
float LfarmR;
float RfarmR;
float LlegH;
float RlegH;
float tx;
float opac;

//soundCount
int soundCount = 0;

//movement variable
float personXEnd = 343;
float personYEnd = 673;

int numDialogue1 = 3;
int numDialogue2 = 2;
int i_diag = 0;
int k_diag = 0;
boolean[] dialogue1 = new boolean[numDialogue1];
boolean[] dialogue2 = new boolean[numDialogue2];

float stripeX, stripeY;

int stripeVel;
PVector stripePos;
float[] posY = new float[8];
float[] posX1 = new float[8];
float[] posX2 = new float[8];
int[] carVelocityX = new int[3];
int[] carVelocityY = new int[3];
int[] carFinalY = new int[3];

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


boolean scene1Done, scene2Start, trans1Done, scene2Done, scene3Start, trans2Done, scene3Done, scene4Start, trans3Done, scene4Done, scene5Start, trans4Done;
boolean waveF;
boolean scratch;
boolean pupilLeft;
boolean LlegFor;
boolean RlegFor;
boolean LlegUp;
boolean RlegUp;
boolean runR;
boolean runL;

void Car1(float car1X, float car1Y) {
  //begin tires
  pushMatrix();
  translate(car1X, car1Y);
  fill(0);
  rect(-5, 40, 20, 40, 5, 0, 0, 5);
  rect(135, 40, 20, 40, 0, 5, 5, 0);
  rect(-5, 220, 20, 40, 5, 0, 0, 5);
  rect(135, 220, 20, 40, 0, 5, 5, 0);
  //end tires
  fill(41, 37, 38);
  rect(0, 0, 150, 300, 75, 75, 10, 10); //body
  fill(201, 82, 16); //stripe color
  //quad(90, 53, 110,
  rect(40, 2, 20, 298, 25, 0, 0, 0); //left stripe
  rect(90, 2, 20, 298, 0, 25, 0, 0); // right stripe
  fill(54, 52, 53);
  pushMatrix();
  translate(0, 20);
  quad(5, 50, 145, 50, 130, 100, 20, 100); // windshield
  popMatrix();
  quad(10, 220, 140, 220, 130, 250, 20, 250);
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
}

void Car2(float car2X, float car2Y) {
  //begin tires
  pushMatrix();
  translate(car2X, car2Y);
  fill(0);
  rect(-5, 40, 20, 40, 5, 0, 0, 5);
  rect(135, 40, 20, 40, 0, 5, 5, 0);
  rect(-5, 220, 20, 40, 5, 0, 0, 5);
  rect(135, 220, 20, 40, 0, 5, 5, 0);
  //end tires
  fill(204, 0, 0);
  rect(0, 0, 150, 300, 45, 45, 10, 10); //body
  fill(54, 52, 53);
  pushMatrix();
  translate(0, 20);
  quad(5, 50, 145, 50, 130, 100, 20, 100); // windshield
  popMatrix();
  quad(10, 220, 140, 220, 130, 250, 20, 250);
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

void Bus(float busX, float busY) {
  fill(0);
  pushMatrix();
  translate(busX, busY);
  rect(45, 90, 20, 40, 5, 0, 0, 5);
  rect(185, 90, 20, 40, 0, 5, 5, 0);
  rect(45, 420, 20, 40, 5, 0, 0, 5);
  rect(185, 420, 20, 40, 0, 5, 5, 0);
  fill(255, 216, 0);
  rect(50, 50, 150, 450, 20, 20, 10, 10);
  fill(233, 232, 230);
  //begin lights
  pushMatrix();
  translate(70, 51);
  rect(0, 0, 20, 8, 2, 2, 2, 2);
  popMatrix();
  pushMatrix();
  translate(160, 51);
  rect(0, 0, 20, 8, 2, 2, 2, 2);
  popMatrix();
  //end lights
  fill(54, 52, 53);
  //rect(65, 85, 120, 40);
  quad(65, 85, 185, 85, 180, 110, 70, 110);
  quad(70, 480, 180, 480, 185, 490, 65, 490);
  fill(255, 0, 0);
  rect(70, 498, 10, 3);
  rect(170, 498, 10, 3);
  //stroke(246, 239, 119);
  line(70, 140, 70, 440);
  line(180, 140, 180, 440);
  line(125, 140, 125, 440);
  popMatrix();
}



void updateS() {
  for (int i = 0; i < 8; i++) {
    posY[i] += stripeVel;
  }
}

void runS() {
  for (int i = 0; i < 8; i++) {
    pushMatrix();
    fill(255); 
    translate(posX1[i], posY[i]);
    rect(0, 0, 20, 100);
    translate(posX2[i]-posX1[i], posY[i]-posY[i]);
    rect(0, 0, 20, 100);
    popMatrix();
  }
}


void rightFence() {
  //right fence
  pushMatrix();
  translate(100, 800);//same as the homeBuilding
  strokeWeight(5);
  stroke(255);
  line(190, -100, 190, -43);
  line(187.5, -100, 192.5, -100);
  strokeWeight(3);
  line(190, -95, 295, -95);
  line(190, -47, 295, -47);
  strokeWeight(2);
  for (int i = 0; i < 10; i++) {
    line(200 + i*10, -95, 200 + i*10, -47);
  }
  popMatrix();
}

void homeBuilding(float homePositionX, float homePositionY) {
  pushMatrix();
  //moving the whole building
  translate(homePositionX, homePositionY);

  //start sketching
  fill(74, 28, 33);
  stroke(255);
  strokeWeight(5);
  rect(0, -200, 600, 200);
  fill(104, 58, 63);
  triangle(0, -200, 600, -200, 300, -500);
  strokeWeight(10);
  triangle(300, -202, 600, -202, 450, -352);
  noStroke();
  rect(313, -210, 278, 207);
  rect(590, -196, 8, 193);
  rect(309, -196, 8, 193);
  //window
  strokeWeight(7);
  stroke(180, 180, 180);
  fill(0);
  rect(80, -170, 80, 70);
  strokeWeight(4.5);
  line(80, -135, 160, -135);
  strokeWeight(1);
  line(80, -152.5, 160, -152.5);
  line(80, -117.5, 160, -117.5);
  line(120, -170, 120, -100);
  line(100, -170, 100, -100);
  line(140, -170, 140, -100);
  //
  strokeWeight(5);
  stroke(255);
  line(305, -202, 305, 0);
  stroke(74, 28, 33);
  line(300, -195, 300, 0);
  stroke(210, 210, 210);
  fill(210, 210, 210);
  line(295, -195, 295, -40);
  //right fence
  /*strokeWeight(5);
   stroke(255);
   line(190, -100, 190, -43);
   line(187.5, -100, 192.5, -100);
   strokeWeight(3);
   line(190, -95, 295, -95);
   line(190, -47, 295, -47);
   strokeWeight(2);
   for (int i = 0; i < 10; i++) {
   line(200 + i*10, -95, 200 + i*10, -47);
   }*/
  //left fence
  strokeWeight(5);
  stroke(255);
  line(105, -100, 105, -40);
  line(102.5, -100, 107.5, -100);
  line(0, -195, 0, 0);
  strokeWeight(3);
  line(0, -95, 105, -95);
  line(0, -47, 105, -47);
  strokeWeight(2);
  for (int i = 0; i < 10; i++) {
    line(10 + i*10, -95, 10 + i*10, -47);
  }
  //
  fill(210, 210, 210);
  stroke(100, 100, 100);
  strokeWeight(4);
  line(291, -201, 447, -358);//roof shadow
  line(300, -494, 440, -353.5);
  stroke(155, 155, 155);
  line(298, -490, 435, -353.5);
  line(287, -201, 443, -359);
  noStroke();
  fill(0);//below shadow
  rect(3, -197, 290, 4);
  fill(25, 25, 25);
  rect(3, -193, 290, 4);
  fill(50, 50, 50);
  rect(3, -189, 290, 4);
  noStroke();
  fill(123, 109, 72);
  rect(0, -10, 305, 10);
  rect(0, -20, 302.5, 10);
  rect(0, -30, 300, 10);
  rect(0, -40, 297.5, 10);
  stroke(193, 178, 150);
  strokeWeight(2.5);
  line(0, -10, 305, -10);
  line(0, -20, 302.5, -20);
  line(0, -30, 300, -30);
  line(0, -40, 297.5, -40);
  //window
  stroke(255);
  fill(0);
  strokeWeight(7);
  rect(185, -355, 80, 110);
  strokeWeight(4.5);
  line(185, -300, 265, -300);
  strokeWeight(1);
  line(185, -327.5, 265, -327.5);
  line(185, -272.5, 265, -272.5);
  line(225, -355, 225, -245);
  line(205, -355, 205, -245);
  line(245, -355, 245, -245);
  pushMatrix();
  translate(0, 10);
  //window
  strokeWeight(7);
  rect(410, -180, 80, 120);
  strokeWeight(1);
  line(410, -120, 490, -120);
  line(410, -150, 490, -150);
  line(410, -90, 490, -90);
  line(450, -180, 450, -60);
  line(430, -180, 430, -60);
  line(470, -180, 470, -60);
  //window
  strokeWeight(7);
  rect(360, -180, 40, 120);
  strokeWeight(4.5);
  line(360, -120, 400, -120);
  strokeWeight(1);
  line(360, -150, 400, -150);
  line(360, -90, 400, -90);
  line(380, -180, 380, -60);
  //window
  strokeWeight(7);
  rect(500, -180, 40, 120);
  strokeWeight(4.5);
  line(500, -120, 540, -120);
  strokeWeight(1);
  line(500, -150, 540, -150);
  line(500, -90, 540, -90);
  line(520, -180, 520, -60);
  popMatrix();
  //
  noStroke();
  rect(410, -280, 80, 73);
  strokeWeight(4.5);
  stroke(255);
  arc(450, -280, 80, 80, PI, 2*PI);
  line(410, -280, 410, -210);
  line(490, -280, 490, -210);
  line(410, -210, 490, -210);
  strokeWeight(1);
  arc(450, -285, 27, 24, PI, 2*PI);
  line(436.5, -285, 436.5, -210);
  line(463.5, -285, 463.5, -210);
  line(410, -282.5, 490, -282.5);
  line(410, -245, 490, -245);
  line(450, -320, 450, -297);
  line(426, -308, 440, -293);
  line(474, -308, 460, -293);
  popMatrix();
}

void workplaceBuilding(float workplacePositionX, float workplacePositionY) {
  pushMatrix();
  translate(workplacePositionX, workplacePositionY);
  //bottom part
  fill(255, 221, 120);
  stroke(255, 221, 120);
  strokeWeight(2);
  //structure
  rect(0, -60, 250, 60);
  //fill(0);
  triangle(-20, -75.5, 0, -60, 250, -60);
  triangle(270, -75.5, 250, -59.5, -13, -75);
  rect(-20, -80, 290, 5);
  //window
  for (int i = 0; i < 2; i++) {
    for (int j = 0; j < 10; j++) {
      if (i == 0) {
        windowRect(8+7.5*(j+1) + 15*j, -55+5*(i+1) + 20*i);
      }
      if (i == 1) {
        windowRect(8+7.5*(j+1) + 15*j, -55+8*(i+1) + 20*i);
      }
    }
  }
  //main part
  fill(255, 221, 120);
  stroke(255, 221, 120);
  rect(8, -480, 238, 400);
  //window
  for (int i = 0; i < 11; i++) {
    if (i == 0) {
      windowCircle(30, -175);
    }
    if (i >= 1) {
      windowCircle(30+8*i+10*i, -175);
    }
  }
  for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 9; j++) {
      if (i == 0) {
        windowRect(20+7.5*(j+1) + 15*j, -460+10*(i+1) + 20*i);
      }
      if (i >= 1) {
        windowRect(20+7.5*(j+1) + 15*j, -460+10*(i+1) + 20*i);
      }
    }
  }
  for (int i = 0; i < 37; i++) {
    if (i == 0) {
      windowBlue(20, -478);
    }
    if (i >= 1) {
      windowBlue(20+2*i+4*i, -478);
    }
  }
  //Trapzoid part
  fill(255, 221, 120);
  stroke(255, 221, 120);
  triangle(104, -700, 109, -720, 150, -700);//3rd
  triangle(112, -720, 145, -720, 150, -700);
  //3rd trapezoid window
  for (int i = 0; i < 2; i++) {
    if (i == 0) {
      windowCircle(115, -750);
    }
    if (i >= 1) {
      windowCircle(115+8*i+9.5*i, -750);
    }
  }
  fill(255, 221, 120);
  stroke(255, 221, 120);
  triangle(84, -680, 89, -700, 170, -680);//2nd
  triangle(95, -700, 165, -700, 170, -680);
  //2nd trapezoid window
  for (int i = 0; i < 4; i++) {
    if (i == 0) {
      windowCircle(96, -730);
    }
    if (i >= 1) {
      windowCircle(96+8*i+9.5*i, -730);
    }
  }
  fill(255, 221, 120);
  stroke(255, 221, 120);
  triangle(64, -650, 69, -680, 190, -650);//1st
  triangle(76, -680, 185, -680, 190, -650);
  //1st trapezoid window
  for (int i = 0; i < 6; i++) {
    if (i == 0) {
      windowCircle(80, -706);
    }
    if (i >= 1) {
      windowCircle(80+8*i+9.5*i, -706);
    }
  }
  //top part
  fill(255, 221, 120);
  stroke(255, 221, 120);
  rect(24, -650, 206, 170);
  //window
  for (int i = 0; i < 11; i++) {
    if (i == 0) {
      windowCircle(38, -676);
    }
    if (i >= 1) {
      windowCircle(38+8*i+9*i, -676);
    }
  }
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 8; j++) {
      if (i == 0) {
        windowRect(30+8*(j+1) + 15*j, -590+11.5*(i+1) + 20*i);
      }
      if (i >= 1) {
        windowRect(30+8*(j+1) + 15*j, -590+11.5*(i+1) + 20*i);
      }
    }
  }
  //stick
  fill(252, 253, 253);
  stroke(252, 253, 253);
  rect(124.5, -784, 5, 64);
  ellipse(127, -792, 16, 16);

  //Shadow
  fill(199, 154, 32);
  stroke(199, 154, 32);
  strokeWeight(1.5);
  line(-18, -79, 268, -79);
  strokeWeight(2);
  line(-15, -73.5, 263, -73.5);
  textFont(fontBold);
  text("Rush Hour", 97, -63);
  line(1, -60, 249, -60);
  strokeWeight(8);
  line(250, 0, 250, -60);
  line(250, -60, 270, -75.5);
  line(270, -75.5, 270, -76);
  strokeWeight(7.5);
  line(246, -85, 246, -478);
  strokeWeight(7);
  line(230, -484.5, 230, -648);
  strokeWeight(3);
  line(18, -462, 238, -462);
  line(24, -646, 230, -646);
  line(69, -680, 185, -680);
  line(185, -680, 190, -652.5);
  line(89, -700, 165, -700);
  line(165, -700, 170, -682.5);
  line(109, -720, 145, -720);
  line(145, -720, 150, -700);
  //stick shadow
  fill(168, 154, 150);
  stroke(168, 154, 150);
  line(129.5, -782.5, 129.5, -722);
  arc(129.5, -791, 10, 10, radians(-35), radians(135));
  popMatrix();
}

void windowRect(float windowRectX, float windowRectY) {
  pushMatrix();
  translate(windowRectX, windowRectY);
  fill(0, 60, 243);
  stroke(0, 60, 243);
  rect(0, 0, 15, 20);
  fill(0, 207, 253);
  stroke(0, 207, 253);
  rect(3, 4, 12, 16);
  popMatrix();
}

void windowCircle(float windowCircleX, float windowCircleY) {
  pushMatrix();
  translate(windowCircleX, windowCircleY);
  fill(0, 60, 243);
  stroke(0, 60, 243);
  arc(4, 40, 8, 8, PI, 2*PI);
  rect(0, 40, 8, 45);
  fill(0, 207, 253);
  stroke(0, 207, 253);
  arc(5, 42, 6, 6, PI, 2*PI);
  rect(2, 42, 6, 43);
  popMatrix();
}

void windowBlue(float windowBlueX, float windowBlueY) {
  pushMatrix();
  translate(windowBlueX, windowBlueY);
  fill(0, 42, 243);
  stroke(0, 42, 243);
  rect(0, 0, 1, 12);
  popMatrix();
}

void setup() {
  size(1000, 800);

  fontBold = createFont("Arial Bold", 9);

  LlegR = radians(10);
  RlegR = radians(-10);
  LarmR = radians(75);
  RarmR = radians(-135);
  LfarmR = radians(30);
  RfarmR = radians(-100);
  LlegH = 80;
  RlegH = 80;
  tx = 0;
  personRotate = 0;
  for (int j=0; j<numDialogue1; j++) {
    dialogue1[j] = false;
  }

  waveF = false;
  pupilLeft = false;
  scene1Done = false;
  scene2Start = false;
  trans1Done = false;
  scene2Done = false;
  scene3Start = false;
  trans2Done = false;
  scene3Done = false;
  scene4Start = false;
  trans3Done = false;
  scene4Done = false;
  scene5Start = false;
  trans4Done = false;
  LlegFor = true;
  RlegFor = false;
  LlegUp = false;
  RlegUp = true;
  runR = false;
  runL = true;
  opac = 0;

  stripeX = 0;
  stripeY = 0;

  stripeVel = 4;
  for (int i = 0; i < 8; i++) {
    posY[i] = -800 + 200*i;
    posX1[i] = 325;
    posX2[i] = 650;
  }

  carFinalY[0] = 100;
  carFinalY[1] = 300;
  carFinalY[2] = 100;

  img1 = loadImage("Lab8.jpg");
  img1.loadPixels();
  img1.resize(200, 231);
  println(img1.height, img1.width);

  //file = new SoundFile(this, "Scream.mp3");
  //file.amp(.6);
  //file.loop();

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

  timer = 0;
}


void mousePressed() {
  if (scene4Start)
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
      } else
      {
        //do something to switch to the last scene. WIN CONDITION
        scene4Done = true;
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

  if (mouseX < width && mouseX > 0 && mouseY > 0 && mouseY < height*.2) {
    dialogue1[i_diag] = true;
    if (dialogue1[2] == true) {
      scene1Done = true;
    }
    if (i_diag < 2) {
      i_diag++;
    }
  }

  if (scene3Start == true && mouseX < width && mouseX > 0 && mouseY > height*.8 && mouseY < height) {
    dialogue2[k_diag] = true;
    if (dialogue2[1] == true) {
      scene3Done = true;
    }
    if (k_diag < 1) {
      k_diag++;
    }
  }
}

void mouseDragged()
{
  if (!hasLost && scene4Start && mySelectedCar != null)
  {
    mySelectedCar.moveCar(mouseX, mouseY, boardWidth, cars);
  }
}

void drawPerson(float personX, float personY, float scaleF) {
  noStroke();

  pushMatrix();
  translate(personX, personY);
  scale(scaleF);
  rotate(personRotate);
  //Left leg
  pushMatrix();
  translate(-55, LlegH);
  translate(30, 0);
  rotate(LlegR);
  translate(-30, 0);
  fill(12, 34, 56);
  arc(30, 0, 60, 60, -1*PI, 0);
  rect(0, 0, 60, 200);
  popMatrix();

  //Right leg
  pushMatrix();
  translate(-5, RlegH);
  translate(30, 0);
  rotate(RlegR);
  translate(-30, 0);
  fill(12, 34, 56);
  arc(30, 0, 60, 60, -1*PI, 0);
  rect(0, 0, 60, 200);
  popMatrix();


  //torso
  fill(#FAA338);
  quad(-80, -100, 80, -100, 50, 100, -50, 100);

  //waist -- top of jeans
  fill(12, 34, 56);
  rect(-55, 60, 110, 40);

  //Left Whole Arm
  fill(#FAA338);
  pushMatrix();
  translate(-75, -80);
  translate(15, 0);
  rotate(LarmR);
  translate(-15, 0);
  fill(255, 223, 183);

  rect(0, 0, 30, 100);
  fill(#FAA338);
  rect(-10, 0, 50, 50);
  arc(15, 0, 50, 50, -1*PI, 0);

  //Left Forearm
  pushMatrix();
  translate(0, 95);
  translate(15, 0);
  rotate(LfarmR);
  translate(-15, 0);
  fill(255, 223, 183);
  arc(15, 0, 30, 30, -1*PI, 0);
  rect(0, 0, 30, 100);
  popMatrix();

  popMatrix();


  //Right Whole Arm
  pushMatrix();
  translate(55, -80);
  translate(15, 0);
  rotate(RarmR);
  translate(-15, 0);
  fill(255, 223, 183);

  rect(0, 0, 30, 100);
  fill(#FAA338);
  rect(-10, 0, 50, 50);
  arc(15, 0, 50, 50, -1*PI, 0);

  //Right Forearm
  pushMatrix();
  translate(0, 95);
  translate(15, 0);
  rotate(RfarmR);
  translate(-15, 0);
  fill(255, 223, 183);
  arc(15, 0, 30, 30, -1*PI, 0);
  rect(0, 0, 30, 100);
  popMatrix();

  popMatrix();


  //neck
  pushMatrix();
  translate(-20, -140);
  rect(0, 0, 50, 40);
  arc(25, 40, 50, 25, 0, PI);
  fill(0, 50);
  arc(25, 15, 50, 40, 0, PI);

  //head
  fill(255, 223, 183);

  pushMatrix();
  //stroke(0);
  //strokeWeight(.5);
  translate(25, -20);
  ellipse(0, 0, 70, 100);
  //noStroke();

  //mouth
  pushMatrix();
  translate(0, 25);
  fill(0);
  ellipse(0, 0, 30, 30);
  fill(255);
  arc(0, -7.5, 25, 15, -1*PI, 0);
  arc(0, 7.5, 25, 15, 0, PI);
  fill(211, 9, 9);
  arc(0, 8, 20, 8, -1*PI, 0);
  popMatrix();

  //eyes
  pushMatrix();
  fill(255);
  ellipse(-15, -5, 20, 20);
  ellipse(15, -5, 20, 20);

  //pupils (they move side to side)
  pushMatrix();
  fill(0);
  translate(tx, 0);
  ellipse(-15, -5, 5, 5);
  ellipse(15, -5, 5, 5);
  popMatrix();

  popMatrix();

  //hair
  pushMatrix();
  fill(0);
  arc(0, -10, 70, 80, -1*PI, 0);
  popMatrix();

  popMatrix();

  popMatrix();


  popMatrix();
}

void drawCouch() {
  fill(43, 137, 4);
  pushMatrix();
  translate(100, 400);
  rect(0, 0, 300, 200);
  arc(0, 75, 150, 150, -1*PI, -1*PI/2);
  arc(300, 75, 150, 150, -1*PI/2, 0);
  pushMatrix();
  stroke(0);
  strokeWeight(.5);
  rect(-75, 80, 75, 120);
  rect(0, 100, 300, 100);
  rect(300, 80, 75, 120);
  ellipse(-37.5, 80, 75, 75);
  ellipse(337.5, 80, 75, 75);
  ellipse(-37.5, 85, 75, 75);
  ellipse(337.5, 85, 75, 75);
  popMatrix();

  popMatrix();
}

void draw() {
  //THIS IS THE CODE FOR SCENE 1, REALIZATION
  if (scene2Start == false) {
    background(#8BD0FA);
    fill(150);
    rect(0, height*.7, width, height*.3);
    fill(95, 53, 54);
    rect(500, 200, 220, 251);
    image(img1, 510, 210);

    drawCouch();

    drawPerson(400, 400, 1);

    /////////////////

    if (LfarmR > radians(90)) {
      waveF = true;
    }
    if (LfarmR < radians(10)) {
      waveF = false;
    }

    if (waveF == true) {
      LfarmR -= radians(2);
    } else {
      LfarmR += radians(2);
    }

    /////////////////


    if (RfarmR > radians(-100)) {
      scratch = true;
    }
    if (RfarmR < radians(-150)) {
      scratch = false;
    }

    if (scratch == true) {
      RfarmR -= radians(1);
    } else {
      RfarmR += radians(1);
    }

    /////////////////

    if (tx < -6) {
      pupilLeft = true;
    }
    if (tx > 6) {
      pupilLeft = false;
    }
    if (pupilLeft) {
      tx += 1;
    } else {
      tx -= 1;
    }

    /////////////////



    fill(0, 150);
    rect(0, 0, width, height*.2);

    fill(255);
    textSize(25);
    textAlign(CENTER);
    if (scene1Done == false) {
      if (dialogue1[0] ==false) {
        text("This is Max. It is his first day of work.", width/2, height*.05);
        text("If he is late, he'll probably get fired.", width/2, height*.1);
      } else {
        if (dialogue1[1] == false) {
          text(" 'OH NO! I'm going to be late for work!' ", width/2, height*.1);
        } else {
          text(" 'Will you help me get to work on time?' ", width/2, height*.1);
        }
      }
    }
  } 


  //THIS IS THE CODE FOR SCENE 2, RUNNING OUT OF HOUSE
  if (scene2Start == true && scene3Start == false) {

    //if (soundCount == 0) {
    //  file.play();
    //  soundCount++;
    //}
    background(139, 211, 255);
    fill(100);
    rect(0, 700, width, 100);
    fill(246, 252, 84);
    ellipse(700, 100, 60, 60);
    pushMatrix();
    translate(-100, -100);
    homeBuilding(100, 800);

    if (personXEnd > 250 && personYEnd != 750) {
      drawPerson(personXEnd, personYEnd, 0.3);
      rightFence();
    } else {
      rightFence();
      drawPerson(personXEnd, personYEnd, 0.3);
    }

    //leg animation both directions

    if (personXEnd > 250 && personYEnd == 673) {
      if (LlegR > radians(10)) {
        LlegFor = true;
      }
      if (LlegR < radians(-10)) {
        LlegFor = false;
      }

      if (LlegFor == true) {
        LlegR -= radians(1);
      } else {
        LlegR += radians(1);
      }

      if (RlegR > radians(10)) {
        RlegFor = true;
      }
      if (RlegR < radians(-10)) {
        RlegFor = false;
      }

      if (RlegFor == true) {
        RlegR -= radians(1);
      } else {
        RlegR += radians(1);
      }
    }

    if (personXEnd == 250 && personYEnd > 673 && personYEnd < 750) {
      if (LlegH < 70) {
        LlegUp = true;
      }
      if (LlegH > 90) {
        LlegUp = false;
      }

      if (LlegUp) {
        LlegH += 2;
      } else {
        LlegH -= 2;
      }

      if (RlegH < 70) {
        RlegUp = true;
      }
      if (RlegH > 90) {
        RlegUp = false;
      }

      if (RlegUp) {
        RlegH += 2;
      } else {
        RlegH -= 2;
      }
    }

    if (personYEnd == 750) {
      if (LlegR > radians(10)) {
        LlegFor = true;
      }
      if (LlegR < radians(-10)) {
        LlegFor = false;
      }

      if (LlegFor == true) {
        LlegR -= radians(1);
      } else {
        LlegR += radians(1);
      }

      if (RlegR > radians(10)) {
        RlegFor = true;
      }
      if (RlegR < radians(-10)) {
        RlegFor = false;
      }

      if (RlegFor == true) {
        RlegR -= radians(1);
      } else {
        RlegR += radians(1);
      }
    }

    //arm animation
    RarmR = -LarmR;

    if (LarmR > radians(75)) {
      runL = true;
    }
    if (LarmR < radians(0) ) {
      runL = false;
    }

    if (runL) {
      LarmR -= radians(2);
    } else {
      LarmR += radians(2);
    }

    if (RarmR > radians(75)) {
      runR = true;
    }
    if (RarmR < radians(0) ) {
      runR = false;
    }

    if (runR) {
      RarmR -= radians(2);
    } else {
      RarmR += radians(2);
    }

    if (personYEnd == 673) {
      LfarmR = -80;
      RfarmR = -80;
    }
    if (personYEnd > 673 && personYEnd < 750 && personXEnd == 250) {
      LfarmR = radians(-150);
      RfarmR = radians(150);
    }
    if (personYEnd == 750) {
      LfarmR = 80;
      RfarmR = 80;
    }


    //eye animation
    if (tx < -6) {
      pupilLeft = true;
    }
    if (tx > 6) {
      pupilLeft = false;
    }
    if (pupilLeft) {
      tx += 1;
    } else {
      tx -= 1;
    }

    //whole person animation
    if (personXEnd > 250 && personYEnd != 750) {
      personXEnd-= 3;
    }

    if (personXEnd == 250 && personYEnd < 750) {
      personYEnd += 1;
    }

    if (personYEnd == 750) {
      personXEnd+=3;
    }

    if (personXEnd > 800) {
      scene2Done = true;
    }

    popMatrix();
  }



  if (scene1Done == true) {
    fill(0, opac);
    rect(0, 0, width, height);
    if (scene2Start == false) {
      if (opac < 255) {
        opac += 5;
      } else {
        opac += 0;
        scene2Start = true;
      }
    }
    if (scene2Start == true && trans1Done == false) {
      if (opac > 0) {
        opac -= 5;
      } else {
        opac -=0;
        trans1Done = true;
      }
    }
  }


  //THIS IS THE CODE FOR SCENE 3, DRIVING SCENE
  if (scene3Start == true && scene4Start == false) {
    background(100, 100, 20);
    fill(50);
    rect(50, 0, width-100, height);
    runS();
    updateS();
    for (int i = 0; i < 8; i++) {
      if (posY[i] > 800) {
        posY[i] = -800;
      }
    }
    for (int i = 0; i < 3; i++) {
      carVelocityX[i] = int(random(-2, 4));
      //carVelocityY[i] = int(random(-15, -30));
    }

    if (frameCount % 60 == 30) {
      for (int i = 0; i < 3; i++) {
        carVelocityY[i] = int(random(-2, 2));
      }
    }

    for (int i = 0; i < 3; i++) {
      carFinalY[i] += carVelocityY[i];
    }

    println(carVelocityY[0]);
    Car1(100+carVelocityX[0], carFinalY[0]);
    Car2(400-carVelocityX[1], carFinalY[1]);
    Bus(700+carVelocityX[2], carFinalY[2]);


    fill(0, 100);
    rect(0, height*.8, width, height*.2);

    fill(255);
    textSize(25);
    textAlign(CENTER);
    if (scene3Done == false) {
      if (dialogue2[0] ==false) {
        text(" 'I see a lot of traffic up ahead!' ", width/2, height*.9);
      } else {
        if (dialogue2[1] == false) {
          text(" 'Help me get through it on time!' ", width/2, height*.93);
        }
      }
    }
    //if(scene3Done == true) {
    //  println("scene 3 is done");
    //}
  }

  //THIS IS THE CODE FOR SCENE 4, ACTUAL GAME
  if (scene4Start == true && scene5Start == false) {
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
            if (c.canGoHorizontal)
              rect(c.getFirstX() * boardWidth + c.getAnimShift(), c.getFirstY() * boardWidth, (c.getLastX()+1 - c.getFirstX()) * boardWidth, (c.getLastY()+1 - c.getFirstY()) * boardWidth);
            else
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


  //THIS IS THE CODE FOR SCENE 5, WIN CONDITION
  if (scene5Start == true) {
    background(0, 131, 204);
    workplaceBuilding(380, 800);

    drawPerson(personXEnd, personYEnd, 0.3);

    //leg animation both directions
    if (LlegR > radians(10)) {
      LlegFor = true;
    }
    if (LlegR < radians(-10)) {
      LlegFor = false;
    }

    if (LlegFor == true) {
      LlegR -= radians(1);
    } else {
      LlegR += radians(1);
    }

    if (RlegR > radians(10)) {
      RlegFor = true;
    }
    if (RlegR < radians(-10)) {
      RlegFor = false;
    }

    if (RlegFor == true) {
      RlegR -= radians(1);
    } else {
      RlegR += radians(1);
    }


    //arm animation
    RarmR = -LarmR;

    if (LarmR > radians(75)) {
      runL = true;
    }
    if (LarmR < radians(0) ) {
      runL = false;
    }

    if (runL) {
      LarmR -= radians(2);
    } else {
      LarmR += radians(2);
    }

    if (RarmR > radians(75)) {
      runR = true;
    }
    if (RarmR < radians(0) ) {
      runR = false;
    }

    if (runR) {
      RarmR -= radians(2);
    } else {
      RarmR += radians(2);
    }

    //eye animation
    if (tx < -6) {
      pupilLeft = true;
    }
    if (tx > 6) {
      pupilLeft = false;
    }
    if (pupilLeft) {
      tx += 1;
    } else {
      tx -= 1;
    }

    //whole person animation
    if (personRotate == 0) {
      if (personXEnd < 1000) {
        personXEnd+=10;
      }

      if (personXEnd > 995) {
        personRotate = -PI/2;
      }
    }

    if (personRotate == -PI/2) {
      personXEnd = 920;
      personYEnd-=10;

      if (personYEnd < 5) {
        personRotate = -PI;
      }
    }

    if (personRotate == -PI) {
      personYEnd = 80;
      personXEnd -=10;

      if (personXEnd < 5) {
        personRotate = PI/2;
      }
    }

    if (personRotate == PI/2) {
      personXEnd = 80;
      personYEnd +=10;

      if (personYEnd > 795) {
        personRotate = 0;
        personYEnd = 720;
      }
    }
  }


  if (scene2Done == true) {
    fill(0, opac);
    rect(0, 0, width, height);
    if (scene3Start == false) {
      if (opac < 255) {
        opac += 5;
      } else {
        opac += 0;
        scene3Start = true;
        trans2Done = false;
      }
    }
    if (scene3Start == true && trans2Done == false) {
      if (opac > 0) {
        opac -= 5;
      } else {
        opac -=0;
        trans2Done = true;
      }
    }
  }

  if (scene3Done == true) {
    fill(0, opac);
    rect(0, 0, width, height);
    if (scene4Start == false) {
      if (opac < 255) {
        opac += 5;
      } else {
        opac += 0;
        scene4Start = true;
        timer = millis() + 60000;
        trans3Done = false;
      }
    }
    if (scene4Start == true && trans3Done == false) {
      if (opac > 0) {
        opac -= 5;
      } else {
        opac -=0;
        trans3Done = true;
      }
    }
  }

  if (scene4Done == true) {
    fill(0, opac);
    rect(0, 0, width, height);
    if (scene5Start == false) {
      if (opac < 255) {
        opac += 5;
      } else {
        opac += 0;
        scene5Start = true;
        trans4Done = false;
      }
    }
    if (scene5Start == true && trans4Done == false) {
      if (opac > 0) {
        opac -= 5;
      } else {
        opac -=0;
        trans4Done = true;
      }
    }
  }
}