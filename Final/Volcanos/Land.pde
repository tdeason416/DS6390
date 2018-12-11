class Land{
  int def;
  int sizeX;
  int sizeY;
  int[][] elev;
  
  Land(){
  }
  
  Land(int sizeX, int sizeY){
    this.sizeX = sizeX;
    this.sizeY = sizeY;
    this.def = 8;
    this.elev = new int[sizeX][sizeY];
    for(int x= 0; x < sizeX; x++){
      for(int y= 0; y < sizeY; y++){
        this.elev[x][y] = 0;
      }
    }
  }
  
  //common Methods
  void draw(){
    noStroke();
    fill(153, 34, 91);
    int d = this.def;
    for(int x= 0; x < this.sizeX - 1; x++){
      for(int y= 0; y< this.sizeY - 1; y++){
        fill(153, 34, 91);
        beginShape();
        vertex(x*d, y*d, this.elev[x][y]);
        vertex(x*d+d, y*d, this.elev[x+1][y]);
        vertex(x*d+d, y*d+d, this.elev[x+1][y+1]);
        vertex(x*d, y*d+d, this.elev[x][y+1]);
        endShape(CLOSE);
      }
    }
  }
  
  void raiseLand(Volcano vulc){
    int centX = vulc.getLocX();
    int centY = vulc.getLocY();
    this.elev[centX][vulc.getLocY()] = int(vulc.getHeight());
    for(int x = centX -4; x <= centX + 4; x++){
      if(x > 0 && x < this.sizeX){
        for(int y = centY - 4; y <= centY + 4; y++){
          if(y > 0 && y < this.sizeY){
            //if(this.elev[x][y] < int((1+1)/(1 + tan(vulc.getAngle()) * sqrt((centX - x) * (centX - x) + ((centY - y) * (centY - y)))))){
            //  this.elev[x][y] = int((1+1)/(1 + tan(vulc.getAngle()) * sqrt((centX - x) * (centX - x) + ((centY - y) * (centY - y)))));
            if(this.elev[x][y] < int(tan(vulc.getAngle()) * sqrt((centX - x) * (centX - x) + ((centY - y) * (centY - y))))){
              this.elev[x][y] = int(tan(vulc.getAngle()) * sqrt((centX - x) * (centX - x) + ((centY - y) * (centY - y))));
            }
          }
        }
      }
    }
  }
  
  //getters and setters
  int getHeight(int x, int y){
    return this.elev[x][y];
  }
  
  int randX(){
    return int(random(0, this.sizeX));
  }
  
  int randY(){
    return int(random(0, this.sizeY));
  }
  
  int getSizeX(){
    return this.sizeX;
  }
  
  int getSizeY(){
    return this.sizeY;
  }
  
}
