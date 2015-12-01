void setup() {
  size(250, 600);
  background(128);
}

void draw() {
  //Car1();
  //Car2();
  Bus();
}

void Car1() {
  //begin tires
  pushMatrix();
  translate(50, 50);
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
  //fill()
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
  translate(50, 50);
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

void Bus() {
  fill(0);
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
  fill(255, 0, 0);
  rect(70, 498, 10, 3);
  rect(170, 498, 10, 3);
}