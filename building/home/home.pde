//homebuilding art
//In order to draw the home building simply call the function "homeBuilding(floatX, floatY)"
//insert the float number where the home building left bottom corner should be.

void setup() {
  background(200, 200, 255);
  size(800, 800);
}

void mouseMoved() {
  println(mouseX + " " + mouseY);
}

void draw() {
  homeBuilding(100, 800);
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
  //
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
  line(295, -195, 295, -40);//flag
  line(190, -100, 190, -40);
  line(187.5, -100, 192.5, -100);
  strokeWeight(3);
  line(190, -95, 295, -95);
  line(190, -47, 295, -47);
  strokeWeight(2);
  for (int i = 0; i < 10; i++) {
    line(200 + i*10, -95, 200 + i*10, -47);
  }
  strokeWeight(5);
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
  stroke(155, 155, 155);
  strokeWeight(4);
  line(291, -201, 447, -358);
  noStroke();
  rect(3, -197, 290, 4);
  fill(155, 155, 155);
  rect(3, -193, 290, 4);
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
  //
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
  //
  strokeWeight(7);
  rect(410, -180, 80, 120);
  strokeWeight(1);
  line(410, -120, 490, -120);
  line(410, -150, 490, -150);
  line(410, -90, 490, -90);
  line(450, -180, 450, -60);
  line(430, -180, 430, -60);
  line(470, -180, 470, -60);
  //
  strokeWeight(7);
  rect(360, -180, 40, 120);
  strokeWeight(4.5);
  line(360, -120, 400, -120);
  strokeWeight(1);
  line(360, -150, 400, -150);
  line(360, -90, 400, -90);
  line(380, -180, 380, -60);
  //
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