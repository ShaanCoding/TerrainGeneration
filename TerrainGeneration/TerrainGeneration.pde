import g4p_controls.*;

int cols, rows;
int scl = 20;
int w = 2200;
int h = 2000;

float[][] terrain;
float flying = 0;

boolean startStop = true;
boolean filledWireFrame = true;

int R = 132;
int G = 94;
int B = 194;

void setup() {
  size(1920, 1080, P3D);  
  cols = w / scl;
  rows = h / scl;
  terrain = new float[cols][rows];  
  frameRate(60);
  createGUI();
  customGUI();
}

void draw() {
 
  if(startStop)
  {
    flying -= 0.1;
    
    float yoff = flying;
    for(int y = 0; y < rows; y++) {
      float xoff = 0;
        for(int x = 0; x < cols; x++) {
          terrain[x][y] = map(noise(xoff,yoff), 0, 1, -100, 100);
          xoff += 0.2;
        }
        yoff += 0.2;
      }
    
    background(0);
    stroke(255);
    noFill();
    
    translate(width/2, height/2);
    rotateX(PI/3);
    translate(-w/2, -h/2);
    
    for(int y= 0; y < rows - 1; y++) {
      beginShape(TRIANGLE_STRIP);
      for(int x = 0; x < rows; x++) {
         vertex(x*scl, y*scl, terrain[x][y]);
         vertex(x*scl, (y+1)*scl, terrain[x][y+1]);
  
        //rect(x*scl, y*scl, scl, scl);
      }
      
      if(filledWireFrame) {
        fill(R, G, B); 
      }
      endShape();
    }
  }
}

public void customGUI() {
  
}
