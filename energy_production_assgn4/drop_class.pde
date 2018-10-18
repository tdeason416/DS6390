class Floor{
    HashMap<Integer, Integer> floorHeight = new HashMap<Integer, Integer>();
    Floor(){
      for(int i=0; i < width; i++){
        this.floorHeight.put(i, 0); 
      }
    }
    
    void checkFloor(State Istate){
      float[] contact_x = new float[2];
      float[] contact_y = new float[2];
      int idx = 0;
      for(int i= floor(.5 *Istate.diameter); i > ceil( .5 * Istate.diameter ); i -= 1){
        if( this.floorHeight.get(int(Istate.center_x - i)) >  Istate.center_y + sqrt(0.5 * Istate.diameter * Istate.diameter - i*i)){
          contact_x[idx] = Istate.center_x - i;
          contact_y[idx] = this.floorHeight.get(int(Istate.center_x - i));
          idx += 1;
          if(idx == 2){
            break;
          }
        }
       if(idx == 0){
         Istate.speed_y = 1;
       }
       else if(idx == 1){
         2 * Istate.speed_x = int(contact_x / abs(contact_x)){
       }
       else{
         
       }
           
       }
      }
    }
}
