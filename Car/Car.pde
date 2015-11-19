void setup() {
  size(250, 400);
  background(128);
}

void draw() {
  mainCar();
}

void mainCar() {
  //begin tires
  fill(0);
  rect(45, 90, 20, 40, 5, 0, 0, 5);
  rect(185, 90, 20, 40, 0, 5, 5, 0);
  rect(45, 270, 20, 40, 5, 0, 0, 5);
  rect(185, 270, 20, 40, 0, 5, 5, 0);
  //end tires
  fill(41, 37, 38);
  rect(50, 50, 150, 300, 25, 25, 10, 10); //body
  fill(201, 82, 16);
  rect(90, 50, 20, 300); //left stripe
  rect(140, 50, 20, 300); // right stripe
  fill(54, 52, 53);
  quad(55, 100, 195, 100, 180, 150, 70, 150); // windshield
  fill(233, 232, 230);
  //begin lights
  pushMatrix();
  translate(55, 57);
  rotate(-PI/8);
  rect(0, 0, 20, 8, 2, 2, 2, 2);
  popMatrix();
  pushMatrix();
  translate(180, 54);
  rotate(PI/8);
  rect(0, 0, 20, 8, 2, 2, 2, 2);
  popMatrix();
  //end lights
  //fill()
}