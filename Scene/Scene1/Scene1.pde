//Scene1: wake up and find out late to work

PImage img1;

float LlegR;
float RlegR;
float LarmR;
float RarmR;
float LfarmR;
float RfarmR;
float tx;
float opac;

int numDialogue = 3;
int i = 0;
boolean[] dialogue = new boolean[numDialogue];

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

  for (int j=0; j<numDialogue; j++) {
    dialogue[j] = false;
  }

  waveF = false;
  pupilLeft = false;
  scene1Done = false;
  scene2Start = false;
  opac = 0;
  
  img1 = loadImage("Lab8.jpg");
  img1.loadPixels();
  img1.resize(200, 231);
  println(img1.height, img1.width);
}


void mousePressed() {
  if (mouseX < width && mouseX > 0 && mouseY > 0 && mouseY < height*.2) {
    dialogue[i] = true;
    if (dialogue[2] == true) {
      scene1Done = true;
    }
  }
  i ++;
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
  background(#8BD0FA);
  if (scene2Start == false) {
    fill(150);
    rect(0, height*.7, width, height*.3);
    fill(95, 53, 54);
    rect(500, 200, 220, 251);
    image(img1, 510, 210);
    
    drawCouch();
      
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
      if (dialogue[0] ==false) {
        text("This is Max. It is his first day of work.", width/2, height*.05);
        text("If he is late, he'll probably get fired.", width/2, height*.1);
      } else {
        if (dialogue[1] == false) {
          text(" 'OH NO! I'm going to be late for work!' ", width/2, height*.1);
        } else {
          text(" 'Will you help me get to work on time?' ", width/2, height*.1);
        }
      }
    }
  } 
  if(scene1Done == true) {
    fill(0, opac);
    rect(0, 0, width, height);
    if(opac < 255) {
      opac += 2;
    } else {
      opac += 0;
      scene2Start = true;
    }
  }
}