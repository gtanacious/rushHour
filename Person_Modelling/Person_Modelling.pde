
float LlegR;
float RlegR;
float LarmR;
float RarmR;
float LfarmR;
float RfarmR;
float tx;
float opac;

boolean scene1Done, scene2Start;
boolean waveF;
boolean scratch;
boolean pupilLeft;

void setup() {
  size(800, 800);
  LlegR = radians(10);
  RlegR = radians(-10);
  LarmR = radians(75);
  RarmR = radians(-135);
  LfarmR = radians(30);
  RfarmR = radians(-100);
  tx = 0;

  waveF = false;
  pupilLeft = false;
  scene1Done = false;
  scene2Start = false;
  opac = 0;
  
}

void drawPerson() {
  noStroke();

  pushMatrix();
  translate(400, 400);

  //Left leg
  pushMatrix();
  translate(-60, 72.5);
  translate(-22.5, 30);
  rotate(LlegR);
  translate(22.5, -30);
  fill(12, 34, 56);
  rect(0, 0, 60, 200);
  popMatrix();

  //Right leg
  pushMatrix();
  translate(0, 90);
  translate(-22, 30);
  rotate(RlegR);
  translate(22, -30);
  fill(12, 34, 56);
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

void draw() {
  drawPerson();
}