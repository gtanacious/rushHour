void setup() {
  size(750, 600);
  background(128);
}

void draw() {
  car1();
  Car2();
  //Bus();
  //Truck();
}

/*void car1(int x, int y, boolean direction) {
 //begin tires
 pushMatrix();
 //translate(x,y);
 translate(x + boardWidth, y + 2*boardWidth);
 if (direction){
 rotate(-PI/2);
 }
 scale(0.8);
 rotate(PI);
 translate(8,0);
 fill(0);
 rect(-5, 40, 20, 40, 5, 0, 0, 5);
 rect(135, 40, 20, 40, 0, 5, 5, 0);
 rect(-5, 220, 20, 40, 5, 0, 0, 5);
 rect(135, 220, 20, 40, 0, 5, 5, 0);
 //end tires
 fill(41, 37, 38);
 //fill(random(0,255), random(0,255), random(0,255));
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
 //fill()
 }
 */

void car1() {
  strokeWeight(3);
  //begin tires
  pushMatrix();
  //translate(x,y);
  translate(50, 50);
  fill(0);
  rect(-5, 40, 20, 40, 5, 0, 0, 5);
  rect(135, 40, 20, 40, 0, 5, 5, 0);
  rect(-5, 220, 20, 40, 5, 0, 0, 5);
  rect(135, 220, 20, 40, 0, 5, 5, 0);
  //end tires
  fill(41, 37, 38);
  //fill(random(0,255), random(0,255), random(0,255));
  rect(0, 0, 150, 300, 75, 75, 10, 10); //body
  fill(201, 82, 16); //stripe color
  //quad(90, 53, 110,
  noStroke();
  rect(40, 2, 20, 298, 25, 0, 0, 0); //left stripe
  rect(90, 2, 20, 298, 0, 25, 0, 0); // right stripe
  fill(54, 52, 53);
  //pushMatrix();
  //translate(0, 20);
  quad(10, 70, 140, 70, 130, 120, 20, 120); // front windshield
  //popMatrix();
  quad(5, 70, 15, 125, 15, 225, 5, 260); // left window
  quad(145, 70, 135, 125, 135, 225, 145, 260); // right window
  quad(10, 260, 140, 260, 130, 230, 20, 230); // rear windshield
  strokeWeight(3);
  stroke(1);
  fill(41, 37, 38);
  line(5, 165, 15, 165); // left window divider
  line(145, 165, 135, 165); // right window divider
  noStroke();
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
  //fill()
  stroke(5);
  strokeWeight(1);
}

/*void Car2() {
 //begin tires
 fill(0);
 rect(45, 90, 20, 40, 5, 0, 0, 5);
 rect(185, 90, 20, 40, 0, 5, 5, 0);
 rect(45, 270, 20, 40, 5, 0, 0, 5);
 rect(185, 270, 20, 40, 0, 5, 5, 0);
 //end tires
 fill(204, 0, 0);
 rect(50, 50, 150, 300, 45, 45, 10, 10); //body
 fill(201, 82, 16); //stripe color
 fill(54, 52, 53);
 pushMatrix();
 translate(0, 20);
 quad(55, 100, 195, 100, 180, 150, 70, 150); // windshield
 popMatrix();
 quad(60, 270, 190, 270, 180, 300, 70, 300);
 fill(233, 232, 230);
 //begin lights
 pushMatrix();
 translate(70, 60);
 rect(0, 0, 20, 8, 2, 2, 2, 2);
 popMatrix();
 pushMatrix();
 translate(160, 60);
 rect(0, 0, 20, 8, 2, 2, 2, 2);
 popMatrix();
 //fill()
 }
 */

void Car2() {
  //begin tires
  pushMatrix();
  translate(550, 50);
  fill(0);
  rect(-5, 40, 20, 40, 5, 0, 0, 5);
  rect(135, 40, 20, 40, 0, 5, 5, 0);
  rect(-5, 220, 20, 40, 5, 0, 0, 5);
  rect(135, 220, 20, 40, 0, 5, 5, 0);
  //end tires
  fill(204, 0, 0);
  rect(0, 0, 150, 300, 45, 45, 10, 10); //body
  noStroke();
  fill(54, 52, 53);
  //pushMatrix();
  //translate(0, 20);
  quad(10, 70, 140, 70, 130, 120, 20, 120); // front windshield
  //popMatrix();
  quad(5, 70, 15, 125, 15, 225, 5, 260); // left window
  quad(145, 70, 135, 125, 135, 225, 145, 260); // right window
  quad(10, 280, 140, 280, 130, 250, 20, 250); // rear windshield
  strokeWeight(3);
  stroke(1);
  fill(41, 37, 38);
  line(5, 165, 15, 165); // left window divider
  line(145, 165, 135, 165); // right window divider
  noStroke();
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

void Bus() {
  pushMatrix();
  translate(50, 50);
  fill(0);
  rect(-5, 40, 20, 40, 5, 0, 0, 5);
  rect(135, 40, 20, 40, 0, 5, 5, 0);
  rect(-5, 370, 20, 40, 5, 0, 0, 5);
  rect(135, 370, 20, 40, 0, 5, 5, 0);
  fill(255, 216, 0);
  rect(0, 0, 150, 450, 20, 20, 10, 10);
  fill(233, 232, 230);
  //begin lights
  pushMatrix();
  translate(70, 51);
  rect(-50, -50, 20, 8, 2, 2, 2, 2);
  popMatrix();
  pushMatrix();
  translate(160, 51);
  rect(-50, -50, 20, 8, 2, 2, 2, 2);
  popMatrix();
  //end lights
  fill(54, 52, 53);
  //rect(65, 85, 120, 40);
  quad(15, 35, 135, 35, 130, 60, 20, 60);
  quad(20, 430, 130, 430, 135, 440, 15, 440);
  fill(255, 0, 0);
  rect(20, 448, 10, 3);
  rect(120, 448, 10, 3);
  //stroke(246, 239, 119);
  line(20, 90, 20, 390);
  line(130, 90, 130, 390);
  line(75, 90, 75, 390);
  popMatrix();
}

void Truck() {
  pushMatrix();
  translate(50, 50);
  fill(0);
  rect(-5, 40, 20, 40, 5, 0, 0, 5);
  rect(135, 40, 20, 40, 0, 5, 5, 0);
  rect(-5, 370, 20, 40, 5, 0, 0, 5);
  rect(135, 370, 20, 40, 0, 5, 5, 0);
  fill(63, 79, 232);
  rect(5, 0, 140, 150, 20, 20, 5, 5);
  fill(0, 75, 275);
  rect(0, 150, 150, 300, 10, 10, 10, 10);
  //begin lights
  fill(236, 253, 170);
  pushMatrix();
  translate(70, 51);
  rect(-50, -50, 20, 8, 2, 2, 2, 2);
  popMatrix();
  pushMatrix();
  translate(160, 51);
  rect(-50, -50, 20, 8, 2, 2, 2, 2);
  popMatrix();
  fill(54, 52, 53);
  quad(15, 35, 135, 35, 130, 50, 20, 50);
  //end lights
  popMatrix();
}