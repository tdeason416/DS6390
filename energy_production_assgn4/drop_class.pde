class Floor{
    //Vars
    HashMap<Integer, Integer> floorHeight = new HashMap<Integer, Integer>();
    
    //Constructor
    Floor(){
      for(int i=0; i < width; i++){
        this.floorHeight.put(i, 0); 
      }
    }
    
    //InternalMethods
    void addtoFloor(State Istate){
      for(int i= floor(Istate.center_x - .5 *Istate.diameter); i < ceil(Istate.center_x + .5 * Istate.diameter ); i -= 1){
        //Set Floor Height to top of orb at each location
        this.floorHeight.put(i, int(Istate.center_y - sqrt(sq(Istate.diameter / 2) - sq(Istate.center_x - i)))); 
      }
    }
    
    //External Methods
    boolean checkifFloor(State Istate){
      //Check if State is fully within frame
      if(floor(Istate.center_x - .5 * Istate.diameter) < 0){
         Istate.center_x += floor(Istate.center_x - .5 * Istate.diameter);
      }
      else if(ceil(Istate.center_x + .5 * Istate.diameter) > width){
        Istate.center_y -= width - ceil(Istate.center_x + .5 * Istate.diameter);
      }
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
      }      
      //Check For interferance in state
      if(idx == 0){
        Istate.speed_y = 1;
      }
      else if(idx == 1){
        if(int(Istate.center_x - contact_x[0]) == 0){
          Istate.speed_y = 0;
          Istate.speed_x = 0;
          return true;
        }
        else if(Istate.center_x - contact_x[0] < 0){
          Istate.speed_x = -2;
        }
        else{
          Istate.speed_y = 2;
        }
      }
      else{
        Istate.speed_y = 0;
        Istate.speed_x = 0;
        this.addtoFloor(Istate);
        return true;
      }
  return false;
  }
}
