float LlegR;
float RlegR;
float LarmR;
float RarmR;
float LfarmR;
float RfarmR;
int numDialogue = 3;
int i = 0;
boolean[] dialogue = new boolean[numDialogue];

boolean waveF;
boolean scratch;

void setup() {
  size(800, 800);
  LlegR = radians(10);
  RlegR = radians(-10);
  LarmR = radians(75);
  RarmR = radians(-135);
  LfarmR = radians(30);
  RfarmR = radians(-100);

  for (int j=0; j<numDialogue; j++) {
    dialogue[j] = false;
  }

  waveF = false;
}


void mousePressed() {
  if (mouseX < width && mouseX > 0 && mouseY > 0 && mouseY < height*.2) {
    dialogue[i] = true;
  }
  i ++;
}



void drawPerson() {
  noStroke();

  pushMatrix();
  translate(400, 400);

  //Left leg
  pushMatrix();
  translate(-50, 80);
  translate(-22.5, 30);
  rotate(LlegR);
  translate(22.5, -30);
  fill(12, 34, 56);
  rect(0, 0, 45, 200);
  popMatrix();

  //Right leg
  pushMatrix();
  translate(10, 90);
  translate(-22.5, 30);
  rotate(RlegR);
  translate(22.5, -30);
  fill(12, 34, 56);
  rect(0, 0, 45, 200);
  popMatrix();


  //torso
  fill(#FAA338);
  quad(-80, -100, 80, -100, 50, 100, -50, 100);

  //Left Whole Arm
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

  popMatrix();
}

void draw() {
  background(#8BD0FA);
  fill(150);
  rect(0, height*.7, width, height*.3);
  drawPerson();

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

  fill(0, 150);
  rect(0, 0, width, height*.2);

  fill(255);
  textSize(25);
  textAlign(CENTER);
  if (dialogue[0] ==false) {
    text("OH NO! I'm going to be late for work!", width/2, height*.1);
  } else{
    text("Will you help me get to work on time?", width/2, height*.1);
  }
}