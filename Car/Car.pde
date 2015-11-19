void setup(){
  size(250,400);
  background(128);
}

void draw(){
  mainCar();
}

void mainCar(){
  fill(41,37,38);
  rect(50, 50, 150, 300, 25, 25, 10, 10);
  fill(201,82,16);
  rect(90, 50, 20, 300); 
  rect(140, 50, 20, 300);
  fill(54,52,53);
  quad(55, 100, 195, 100, 180, 150, 70, 150);
}