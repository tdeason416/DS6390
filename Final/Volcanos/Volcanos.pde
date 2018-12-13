int  d=8;

float[][] val ;
float xSize, ySize;
float increment = 0.03;
float zoff = 0.0;  
float zincrement = 0.01; 
Magma Magma;

void setup(){
  //smooth();
  size(1280, 720, P3D);
  val = new float[width/d][height/d];
  xSize = width/d;
  ySize = height/d;
  Magma = new Magma(this, 2000, 1000, 500);
  //land = new Land( 854/ 8, 480 /8);
}


void draw(){
  background(0);
  lights();
  //fill(153, 34, 91);
  //noStroke();
  camera(mouseX*1.5, mouseY*2.5, (height/2.0) / tan(PI*60.0 / 360.0), 
         width/2.0, height/2.0, 0, // centerX, centerY, centerZ
         0.0, 1.0, 0.0); // upX, upY, upZ
  translate(0, height/2, -300);
  rotateX(70); 
  Magma.flow();
  Magma.draw();
}
