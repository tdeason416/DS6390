class Snake{
//Defines Parameters needes to define the energy generation of a state
    int numPts;
    int timer;
    Table movements;
    Table blemishes;
    int nextWaypoint_x;
    int nextWaypoint_y;
    int speed_x;
    int speed_y;
    int[] blemishes_x;
    int[] blemishes_y;
    int size;
    int snakeWidth;
    int current_x;
    int current_y;
    int numPasses;
    int rowNum;
    
    Snake(int size, int snakeWidth, int[] blemishes_x, int[] blemishes_y, int numPasses){
        this.size = size;
        this.timer = 0;
        this.snakeWidth = snakeWidth;
        this.numPts = blemishes_y.length;
        this.numPasses = numPasses;
        this.blemishes = new Table();
        this.blemishes.addColumn("x");
        this.blemishes.addColumn("y");
        this.blemishes.addColumn("dist");
        this.blemishes.addColumn("yGrp");
        for(int i = 0; i < blemishes_x.length; i++){
            TableRow newRow = blemishes.addRow();
            newRow.setInt("x", blemishes_x[i]);
            newRow.setInt("y", blemishes_y[i]);
            newRow.setInt("dist", int(sqrt(pow(width - blemishes_x[i], 2) + pow(height - blemishes_y[i], 2))));
            newRow.setInt("yGrp", int(blemishes_y[i] / max(blemishes_y) * numPasses));
        }
        this.blemishes.sort("dist");
        this.current_x = 0;
        this.current_y = 0;
        //this.current_y = blemishes.getRow(0).getInt("y"); 
        this.speed_x = 1;
        this.speed_y = 0;
        this.nextWaypoint_x = blemishes.getRow(0).getInt("x");
        this.nextWaypoint_y = blemishes.getRow(0).getInt("y");
        this.rowNum = 0;
        this.movements = new Table();
        this.movements.addColumn("x");
        this.movements.addColumn("y");
        for( int i = 0; i <= size * 4 * snakeWidth ; i += 1){
            TableRow newRow = this.movements.addRow();
            newRow.setInt("x", this.current_x);
            newRow.setInt("y", this.current_y);
        }
    }
    
    void _removeBlemish(){
      TableRow row = this.blemishes.getRow(this.rowNum);
      int x = row.getInt("x");
      int y = row.getInt("y");
      halfWormWidth = this.snakeWidth;
      for(int i = -halfWormWidth; i < halfWormWidth; i++){
              for( int j = -halfWormWidth ; j < halfWormWidth; j++){
                  if((x + i < pixelHeight) && (y + j < pixelWidth) && (i > 0) && (j > 0)){
                  int c_base = pixels[pixelWidth * (y + j) + ( x + i )];
                  float r = red(c_base);
                  float g = green(c_base);
                  float b = blue(c_base);
                  pixels[pixelWidth * (y + j) + ( x + i )] = color(255 - r, 255 - g, 255 -b);
                  //pixels[pixelWidth * (y + j) + ( x + i )] = originalPxls[pixelWidth * (y + j) + ( x + i )];
                  }
              }
      }
    }
    
    void _drawSegment(TableRow n){
          int cent_x = n.getInt("x");
          int cent_y = n.getInt("y");
          halfWormWidth = this.snakeWidth;
          for(int j = -halfWormWidth; j < halfWormWidth; j++){
              for( int k = -halfWormWidth ; k < halfWormWidth; k++){
                  if((cent_y + j < pixelHeight) && (cent_x + k < pixelWidth) && (k > 0) && (j > 0)){
                      //int c_base = pixels[pixelWidth * (cent_y + j) + ( cent_x + k)];
                      int c_base = basePixels[pixelWidth * (cent_y + j) + ( cent_x + k)];
                      float r = red(c_base);
                      float g = green(c_base);
                      float b = blue(c_base);
                      pixels[pixelWidth * (cent_y + j) + ( cent_x + k)] = color(255 - r, 255 - g, 255 -b);
                  }
              }
          }
    }
    
    void moveWorm(){
        //println(this.blemishes.getRow(this.rowNum).getInt("x"));
        //println(this.blemishes.getRow(this.rowNum).getInt("y"));
        //println("\n");
        //print(this.current_x);
        //print(" ");
        //print(this.current_y);
        //print("\t");
        //print(this.nextWaypoint_x);
        //print(" ");
        //print(this.nextWaypoint_y);
        if(timer == 0){
            this.size += 1;
        }
        if(this.speed_x != 0){
            this.current_x += this.speed_x;
            if(this.current_x == this.nextWaypoint_x){
                this.speed_x = 0;
                if(this.current_y < this.nextWaypoint_y){
                    this.speed_y = 1;
                }
                else{
                    this.speed_y = -1;
                }  
            }
        }
        else if(this.speed_y != 0){
            this.current_y += this.speed_y;
            if(this.current_y == this.nextWaypoint_y){
                this._removeBlemish();
                this.timer = this.snakeWidth * 2;
                this.rowNum += 1;
                this.nextWaypoint_x = this.blemishes.getRow(this.rowNum).getInt("x");
                this.nextWaypoint_y = this.blemishes.getRow(this.rowNum).getInt("y");
                this.speed_y = 0;
                if(this.current_x < this.nextWaypoint_x){
                    this.speed_x = 1;
                }
                else{
                    this.speed_x = -1;
                }
            }
        }
        TableRow newRow = this.movements.addRow();
        newRow.setInt("x", this.current_x);
        newRow.setInt("y", this.current_y);
        for(int i = 1 ; i <= int(this.size / 2) * 2 * this.snakeWidth * 2 ; i += snakeWidth){
          println(movements.getRowCount() - i);
          this._drawSegment(movements.getRow(movements.getRowCount() - i));
        }
        this.timer -= 1;
  
    }
}
