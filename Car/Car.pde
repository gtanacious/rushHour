void setup() {
  size(250, 400);
  background(128);
}

void draw() {
  Car1();
}

void Car1() {
  //begin tires
  fill(0);
  rect(45, 90, 20, 40, 5, 0, 0, 5);
  rect(185, 90, 20, 40, 0, 5, 5, 0);
  rect(45, 270, 20, 40, 5, 0, 0, 5);
  rect(185, 270, 20, 40, 0, 5, 5, 0);
  //end tires
  fill(41, 37, 38);
  rect(50, 50, 150, 300, 75, 75, 10, 10); //body
  fill(201, 82, 16); //stripe color
  //quad(90, 53, 110,
  rect(90, 52, 20, 298, 25, 0, 0, 0); //left stripe
  rect(140, 52, 20, 298, 0, 25, 0, 0); // right stripe
  fill(54, 52, 53);
  pushMatrix();
  translate(0, 20);
  quad(55, 100, 195, 100, 180, 150, 70, 150); // windshield
  popMatrix();
  quad(60, 270, 190, 270, 180, 300, 70, 300);
  fill(233, 232, 230);
  //begin lights
  pushMatrix();
  translate(61, 66);
  rotate(-PI/8);
  rect(0, 0, 20, 8, 2, 2, 2, 2);
  popMatrix();
  pushMatrix();
  translate(170, 60);
  rotate(PI/8);
  rect(0, 0, 20, 8, 2, 2, 2, 2);
  popMatrix();
  //end lights
  //fill()
}