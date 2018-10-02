class Snake{
//Defines Parameters needes to define the energy generation of a state
    int numPts;
    int[] blemishes_x;
    int[] blemishes_y;
    int size;
    int snakeWidth;
    int current_x;
    int current_y;
    

    void Snake(int size, int snakeWidth, int[] blemishes_x, int[] blemishes_y){
        this.size = size;
        this.snakeWidth = snakeWidth;
        this.numPts = blemishes_y.length;
        this.blemishes_x= blemishes_x;
        this.blemishes_y= blemishes_y;
        this.current_y = min(blemishes_y);
        this.current_x = 0;
    }    
    
    void set_path(){
        HashMap<Integer, Integer> thisPath = new HashMap<Integer, Integer>();
        for(int i; i < blemishes_y.length; i++){
            if(abs(i - blemishes_y[i]) < halfWormWidth){
                thisPath.put(blemishes_x[i], i);
            }    
        }
    }
}
