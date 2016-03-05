PImage open;
PImage close;

void setup(){
  size(957,375);
  noStroke();
  open = loadImage("DinosaurEvenMoreOpenMouth.png");
  close = loadImage("DinosaurOpenMouth.png");
}

void draw(){
  if(mousePressed == true){
    image(open,0,0);
  }
  else{
    image(close,0,0);
  }
}