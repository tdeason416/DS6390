class State{
//Defines Parameters needes to define the energy generation of a state
    HashMap colormap;
    String name;
    float total;
    StringList sourcenames;
    StringList colors;
    FloatList sources;
    FloatList angles;
    float center_x;
    float center_y;
    float diameter;
    
    State(TableRow row, HashMap colormap, float scale_factor){
        this.name = row.getString("state");
        this.total = row.getFloat("total");
        this.sourcenames.append("coal");
        this.sourcenames.append("geothermal");
        this.sourcenames.append("hydroelectric");
        this.sourcenames.append("natural_gas");
        this.sourcenames.append("nuclear");
        this.sourcenames.append("biomass");
        this.sourcenames.append("solar");
        this.sourcenames.append("wind");
        this.sourcenames.shuffle();
        for (int i = 0; i < this.sourcenames.size(); i+=1){
            this.sources.append(row.getInt(this.sourcenames.get(i) * scale_factor));
            this.angles.append(0.0);
            }
        this.colormap = colormap;
        this.center_x = 0;
        this.center_y = 0;
        this.diameter = 3;
        this.increment = 1;
        this.diameter = 3;
        this.setDiameter();
    }
   
   // void place_center(float x, float y, float scale_factor){
   //     this.center_x = x * scale_factor;
   //     this.center_y = y * scale_factor;
   //     this.radius = 5.0 * scale_factor;
   //     ellipse(this.center_x, this.center_y, 2* raidus, 2* radius);
   // }
   
     float _checkArea(float alpha){
         d1 = this.radius
         for (int i = 0; i < this.sources.size() - 1; i += 1){
             d2 = max(this.sources.get(i), this.sources.get(i + 1))
             alpha += 2 * atan(.5 * d1 / (.5 * d1 + .5 * d1))
             }
         d2 = this.sources.get(this.sources.size() - 1)
         alpha += atan(.5 * d1 / (.5*this.radius + .5 * d1))
         return alpha
         }
   
   void setDiameter(){
       if(this._check_area(0) < 2 * PI * .92){
         this.diameter += this.increment;
         this.setDiameter();
           }
       else if(this._check_area(0) > 2 * PI){
           this.increment /= 1.25;
           this.diameter -= this.increment;
           this.setDiameter();
           }
       }
 
    void placeResourceOrbs(){
        float angle_0 =  0;
        for (int i = 0; i < this.sources.size(); i++){
            float half_angle = atan( 0.5* sources.get(i)
            angle_1 = angle_0 + atan(this.sources.get(i)
            ellipse(center x
        }
    }
}
   
    
    //void load_year(String year){
    
    //    Table this_year = loadTable(year + ".csv", "header");
        
    //    HashMap<String,State> states = new HashMap<String, State>();
      
    //    for (TableRow row : this_year.rows()){
    //        states.put(row.getString("state"), new State(row));
    //        }
    //  }
    //}