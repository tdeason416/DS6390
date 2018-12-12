import processing.core.*;

class Volcano{
  PApplet p;
  int locX;
  int locY;
  int ht;
  float angle;
  float magma;
  float pressure;
  float eruptionFactor;
  
  //Constructors  
  Volcano(){
  }
  
  Volcano(PApplet p, int locX, int locY){
    this.p = p;
    this.locX = locX;
    this.locY = locY;
    //this.size = size;
    this.ht = 0;
    this.magma = 0;
    this.angle = p.random(p.PI/10, p.PI/6);
    this.eruptionFactor = p.random(0,1);
    this.pressure = p.random(0f,.1f);
  }
  
  // Common methods
  void addMagma(float newMagma){
    this.magma += newMagma;
    this.ht = PApplet.parseInt(p.sqrt(this.magma * 3 * p.tan(this.angle)));    
    this.pressure += p.random(0f,.1f) * this.eruptionFactor;  
  }

  //void erupt(){
  //}

  //getters and setters
  float getPressure(){
    return this.pressure;
  }
  
  int getLocX(){
    return this.locX;
  }
  
  int getLocY(){
    return this.locY;
  }
  
  float getAngle(){
    return this.angle;
  }
  
  float getMagma(){
    return this.magma;
  }
    
  float getHeight(){
    return this.ht;
  }

}
