import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Volcanos extends PApplet {

int  d=8;

float[][] val ;
float xSize, ySize;
float increment = 0.03f;
float zoff = 0.0f;  
float zincrement = 0.01f; 
Magma Magma;
//Land land;


public void setup(){
  //smooth();
  
  val = new float[width/d][height/d];
  xSize = width/d;
  ySize = height/d;
  Magma = new Magma(this, 5000, 50, 100);
  //land = new Land( 854/ 8, 480 /8);
}


public void draw(){
  background(0);
  lights();
  //fill(153, 34, 91);
  //noStroke();
  camera(mouseX*1.5f, mouseY*2.5f, (height/2.0f) / tan(PI*60.0f / 360.0f), 
         width/2.0f, height/2.0f, 0, // centerX, centerY, centerZ
         0.0f, 1.0f, 0.0f); // upX, upY, upZ
  translate(0, height/2, -300);
  rotateX(70); 
  Magma.flow();
  Magma.draw();

}
  public void settings() {  size(1280, 720, P3D); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Volcanos" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
