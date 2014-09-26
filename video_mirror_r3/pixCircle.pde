class pixCircle {
  float screenWidth;
  float screenHeight;

  float x;
  float y;

  float xoff = random(100);
  float xincrement = 0.002; 

  float yoff = random(100);
  float yincrement = 0.002; 

  pixCircle(float tempW, float tempH) {
    screenWidth = tempW;
    screenHeight = tempH;

    //initialize positions and target positions for each droplet
    x = random(tempW);
    y = random(tempH);
  }
  void pixMove() {
    x = (noise(xoff)*(screenWidth));
    y = (noise(yoff)*(screenHeight));
  }

  void drawCircle(float getR, float getG, float getB) {
    float R = map(getR, 0, 255, 0, 1);
    float G = map(getG, 0, 255, 0, 1);
    float B = map(getB, 0, 255, 0, 1);


    pushMatrix();
    
    translate(x, y);
    
    fill(255, 0, 0);
    pushMatrix();
    scale(R);
    arc(0, 0, 18, 18, 0, THIRD_PI*2);
    popMatrix();
    
    fill(0, 255, 0);
    pushMatrix();
    scale(G);
    arc(0, 0, 18, 18, THIRD_PI*2, THIRD_PI*4);
    popMatrix();

    fill(0, 0, 255);
    pushMatrix();
    scale(B);
    arc(0, 0, 18, 18, THIRD_PI*4, THIRD_PI*6);
    popMatrix();
    
    fill(255);
    pushMatrix();
    scale((R+G+B)/6);
    //ellipse(0,0,15,15);
    popMatrix();
    
    popMatrix();
  }
  void pixUpdate(float tempProxX, float tempProxY) {
    float dist = dist(x,y,tempProxX,tempProxY);
    float mouseOffset = map((3/dist)*(tempProxX/500),1/1200,1,0,100);
    
    xoff += xincrement*mouseOffset;
    yoff += yincrement*mouseOffset;
  }
  
    //Check to see whether a circle is going to go off screen and make sure it doesn't
  void checkEdges() {
    if (x>screenWidth) {
      x = screenWidth;
    }
    if (x<0) {
      x=0;
    }
    if (y>screenHeight) {
      y=screenHeight;
    }
    if (y<0) {
      y=0;
    }
  }
}
