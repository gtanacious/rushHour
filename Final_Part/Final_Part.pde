//Scene1: wake up and find out late to work

import processing.sound.*;
SoundFile file;

PImage img1;

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

int numDialogue = 3;
int i = 0;
boolean[] dialogue = new boolean[numDialogue];

boolean scene1Done, scene2Start, trans1Done;
boolean waveF;
boolean scratch;
boolean pupilLeft;
boolean LlegFor;
boolean RlegFor;
boolean LlegUp;
boolean RlegUp;
boolean runR;
boolean runL;

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

void setup() {
  size(800, 800);
  LlegR = radians(10);
  RlegR = radians(-10);
  LarmR = radians(75);
  RarmR = radians(-135);
  LfarmR = radians(30);
  RfarmR = radians(-100);
  LlegH = 80;
  RlegH = 80;
  tx = 0;

  for (int j=0; j<numDialogue; j++) {
    dialogue[j] = false;
  }

  waveF = false;
  pupilLeft = false;
  scene1Done = false;
  scene2Start = false;
  trans1Done = false;
  LlegFor = true;
  RlegFor = false;
  LlegUp = false;
  RlegUp = true;
  runR = false;
  runL = true;
  opac = 0;

  img1 = loadImage("Lab8.jpg");
  img1.loadPixels();
  img1.resize(200, 231);
  println(img1.height, img1.width);

  file = new SoundFile(this, "Scream.mp3");
  file.amp(.6);
  file.loop();
}


void mousePressed() {
  if (mouseX < width && mouseX > 0 && mouseY > 0 && mouseY < height*.2) {
    dialogue[i] = true;
    if (dialogue[2] == true) {
      scene1Done = true;
    }
    if (i < 2) {
      i++;
    }
  }
}



void drawPerson(float personX, float personY, float scaleF) {
  noStroke();

  pushMatrix();
  translate(personX, personY);
  scale(scaleF);
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

  if (scene2Start == true) {
    
    if (soundCount == 0) {
      file.play();
      soundCount++;
    }
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
    if(personYEnd == 750) {
      LfarmR = 80;
      RfarmR = 80;
    }
    //if (LfarmR > radians(90)) {
    //  waveF = true;
    //}
    //if (LfarmR < radians(10)) {
    //  waveF = false;
    //}

    //if (waveF == true) {
    //  LfarmR -= radians(2);
    //} else {
    //  LfarmR += radians(2);
    //}

    //if (RfarmR > radians(-100)) {
    //  scratch = true;
    //}
    //if (RfarmR < radians(-150)) {
    //  scratch = false;
    //}

    //if (scratch == true) {
    //  RfarmR -= radians(1);
    //} else {
    //  RfarmR += radians(1);
    //}

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
      personXEnd--;
    }

    if (personXEnd == 250 && personYEnd < 750) {
      personYEnd += 0.5;
    }

    if (personYEnd == 750) {
      personXEnd++;
    }
    popMatrix();
  }



  if (scene1Done == true) {
    fill(0, opac);
    rect(0, 0, width, height);
    if (scene2Start == false) {
      if (opac < 255) {
        opac += 2;
      } else {
        opac += 0;
        scene2Start = true;
      }
    }
    if (scene2Start == true && trans1Done == false) {
      if (opac > 0) {
        opac -= 2;
      } else {
        opac -=0;
        trans1Done = true;
      }
    }
  }
}