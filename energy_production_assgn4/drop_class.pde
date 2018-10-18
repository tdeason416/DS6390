class Floor{
    HashMap<Integer, Integer> floorHeight = new HashMap<Integer, Integer>();
    Floor(){
      for(int i=0; i < width; i++){
        this.floorHeight.put(i, 0); 
      }
    }
    
    void checkFloor(State Istate){
      for(int i= floor(.5 *Istate.diameter); i > ceil( .5 * Istate.diameter ); i -= 1){
        if( this.floorHeight.get(int(Istate.center_x - i)) >  Istate.center_y - sqrt(0.5 * Istate.diameter * Istate.diameter - i*i)){
          
        }
      }
    }
}
