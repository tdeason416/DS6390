class Volcano{
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
  
  Volcano(int locX, int locY){
    this.locX = locX;
    this.locY = locY;
    //this.size = size;
    this.ht = 0;
    this.magma = 0;
    this.angle = random(PI/10, PI/6);
    this.eruptionFactor = random(0,1);
    this.pressure = random(0,.1);
  }
  
  // Common methods
  void addMagma(float newMagma){
    this.magma += newMagma;
    this.ht = int(sqrt(this.magma * 3 * tan(this.angle)));    
    this.pressure += random(0,.1) * this.eruptionFactor;  
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
