import processing.core.*;

public class Volcano{
  int locX;
  int locY;
  int ht;
  float angle;
  float magma;
  float pressure;
  float eruptionFactor;
  PApplet p;
  
  //Constructors  
  Volcano(){
  }
  
  Volcano(PApplet p, int locX, int locY, float angle){
    this.p = p;
    this.locX = locX;
    this.locY = locY;
    //this.size = size;
    this.ht = 0;
    this.magma = 0;
    this.angle = angle;
    //this.angle = p.random(p.PI/10, p.PI/6);
    this.eruptionFactor = p.random(0,1);
    //this.pressure = p.random(0,1) * (float) .1;
  }
  
  Volcano(PApplet p, int locX, int locY){
    this.p = p;
    this.locX = locX;
    this.locY = locY;
    //this.size = size;
    this.ht = 0;
    this.magma = 0;
    this.angle = p.random(p.PI * 5 , p.PI * 10) / 180;
    this.eruptionFactor = p.random(0,1);
    //this.pressure = p.random(0,1) * (float) .1;
  }
  
  // Common methods
  public void addMagma(float newMagma){
    this.magma += newMagma;
    this.ht = (int) this.p.sqrt(this.magma * 3 * this.p.tan(this.angle));    
    //this.pressure += (this.p.random(0,.1) (float) .1) * this.eruptionFactor;  
  }

  //void erupt(){
  //}

  //getters and setters
  //float getPressure(){
  //  return this.pressure;
  //}
  
  public int getLocX(){
    return this.locX;
  }
  
  public int getLocY(){
    return this.locY;
  }
  
  public float getAngle(){
    return this.angle;
  }
  
  public float getMagma(){
    return this.magma;
  }
    
  float getHeight(){
    return this.ht;
  }

}
