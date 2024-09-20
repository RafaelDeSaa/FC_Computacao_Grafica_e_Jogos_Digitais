PImage hog;
void setup(){
  size(770,433);
  hog = loadImage("saturno.jpg");
}
void draw() {
  background(0);
  image(hog,0,0);
}
