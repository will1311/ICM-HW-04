import codeanticode.syphon.*;

PImage img;
SyphonClient client;

pixCircle[] p = new pixCircle[4000];

int R;
int G;
int B;

int locX;
int locY;
color c;

float red;
float green;
float blue;

boolean recState;

void setup() { 
  size(1056, 704, P2D);
  frameRate(24);
  
  client = new SyphonClient(this);

  noStroke();
  for (int i = 0; i<p.length; i++) {
    p[i] = new pixCircle(width, height);
  }
  
  R=0;
  G=0;
  B=0;
  
  recState = false;
}
void draw() {
  blendMode(NORMAL);
  //background(0);
  fill(0,0,0,128);
  rect(0,0,width,height);
  blendMode(ADD);
  if (client.available()) {
    img = client.getImage(img); // load the pixels array with the updated image info (slow)
    //image(img, 0, 0, width, height);
  }

  for (int i = 0; i<p.length; i++) {

    locX = int(p[i].x);
    locY = int(p[i].y);

    c = img.get(locX, locY);
    red = red(c);
    blue = blue(c);
    green = green(c);

    p[i].drawCircle(red, green, blue);
    p[i].pixMove();
    p[i].checkEdges();   
    p[i].pixUpdate(mouseX,mouseY);
  }
  
  if(recState){
    saveFrame("output1/output1-####.jpg");
  }
}

void mousePressed(){
  recState = !recState;
}
