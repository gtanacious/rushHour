//workplace building art
//please call workplaceBuilding(float workplacePositionX, float workplacePositionY)
//And also includes others neccessary functions

PFont fontBold;

void setup() {
  background(0, 131, 204);
  size(800, 800);
  fontBold = createFont("Arial Bold", 9);
}

void draw() {
  workplaceBuilding(280, 800);
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
  for(int i = 0; i < 2; i++) {
    for(int j = 0; j < 10; j++) {
      if (i == 0) {
        windowRect(8+7.5*(j+1) + 15*j, -55+5*(i+1) + 20*i);
      }
      if(i == 1) {
        windowRect(8+7.5*(j+1) + 15*j, -55+8*(i+1) + 20*i);
      }
    }
  }
  //main part
  fill(255, 221, 120);
  stroke(255, 221, 120);
  rect(8, -480, 238, 400);
    //window
  for(int i = 0; i < 11; i++) {
    if (i == 0) {
        windowCircle(30, -175);      
      }
      if(i >= 1) {
        windowCircle(30+8*i+10*i, -175);   
      }
  }
  for(int i = 0; i < 10; i++) {
    for(int j = 0; j < 9; j++) {
      if (i == 0) {
        windowRect(20+7.5*(j+1) + 15*j, -460+10*(i+1) + 20*i);
      }
      if(i >= 1) {
        windowRect(20+7.5*(j+1) + 15*j, -460+10*(i+1) + 20*i);
      }
    }
  }
   for(int i = 0; i < 37; i++) {
    if (i == 0) {
        windowBlue(20, -478);      
      }
      if(i >= 1) {
        windowBlue(20+2*i+4*i, -478);   
      }
  }
  //Trapzoid part
  fill(255, 221, 120);
  stroke(255, 221, 120);
  triangle(104, -700, 109, -720, 150, -700);//3rd
  triangle(112, -720, 145, -720, 150, -700);
    //3rd trapezoid window
  for(int i = 0; i < 2; i++) {
    if (i == 0) {
        windowCircle(115, -750);      
      }
      if(i >= 1) {
        windowCircle(115+8*i+9.5*i, -750);   
      }
  }
  fill(255, 221, 120);
  stroke(255, 221, 120);
  triangle(84, -680, 89, -700, 170, -680);//2nd
  triangle(95, -700, 165, -700, 170, -680);
    //2nd trapezoid window
  for(int i = 0; i < 4; i++) {
    if (i == 0) {
        windowCircle(96, -730);      
      }
      if(i >= 1) {
        windowCircle(96+8*i+9.5*i, -730);   
      }
  }
  fill(255, 221, 120);
  stroke(255, 221, 120);
  triangle(64, -650, 69, -680, 190, -650);//1st
  triangle(76, -680, 185, -680, 190, -650);
    //1st trapezoid window
  for(int i = 0; i < 6; i++) {
    if (i == 0) {
        windowCircle(80, -706);      
      }
      if(i >= 1) {
        windowCircle(80+8*i+9.5*i, -706);   
      }
  }
  //top part
  fill(255, 221, 120);
  stroke(255, 221, 120);
  rect(24, -650, 206, 170);
    //window
  for(int i = 0; i < 11; i++) {
    if (i == 0) {
        windowCircle(38, -676);      
      }
      if(i >= 1) {
        windowCircle(38+8*i+9*i, -676);   
      }
  }
  for(int i = 0; i < 3; i++) {
    for(int j = 0; j < 8; j++) {
      if (i == 0) {
        windowRect(30+8*(j+1) + 15*j, -590+11.5*(i+1) + 20*i);
      }
      if(i >= 1) {
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
  //textFont(fontBold);
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