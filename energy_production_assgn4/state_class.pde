class State{
//Defines Parameters needes to define the energy generation of a state
    
    String name;
    float total;
    //ArrayList<String> sourcenames = new ArrayList<String>();
    //ArrayList<String> colors = new ArrayList<String>();
    HashMap<String, Integer> colorMap = new HashMap<String, Integer>();
    StringList sourcenames = new StringList();
    StringList colors = new StringList();
    FloatList sources = new FloatList();
    FloatList angles = new FloatList();
    float speed_x;
    float speed_y;
    float center_x;
    float center_y;
    float diameter;
    float anglen;
    
    State(TableRow row, HashMap colorMap, float scaleFactor){
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
        this.colorMap = colorMap;
        //this.sourcenames.shuffle();
        for (int i = 0; i < this.sourcenames.size(); i+=1){
            this.sources.append(sqrt(row.getFloat(this.sourcenames.get(i)) * scaleFactor));
            this.angles.append(0.0);
            this.colors.append(colorMap.get(this.sourcenames.get(i)).toString());
            }
        ////Checking if data was loaded in correctly
        //println(this.sources);
        //this.colormap = colormap;
        this.speed_x = 0;
        this.speed_y = 1;
        this.center_x = -500;
        this.center_y = 0;
//        this.setAngles();
    }
       
   void setAngles(){
       this.diameter = sqrt(this.total * scaleFactor) * 2;
       float anglei = 0;
       for (int i= 0; i < this.sources.size(); i++){
           anglen = (this.sources.get(i) / (this.sources.sum()));
           //println(this.sourcenames.get(i) + " : " + str(anglen / 2 / PI));
           anglei += anglen; 
           this.angles.set(i, anglei);
           }
       }
   
   void drawPie(){

     this.diameter = sqrt(this.total * scaleFactor) * 2;  
      
      //two angles for each segment
      float a1=0, a2=0;
          
      // how much of each degree of the pie chart should each unit of data get
      // in other words distributes our total data over 360 deg in proportion
      float t = 0;
      t= 360.0 / this.sources.sum();
       //println(this.sources.size()); 
      for (int i= 0; i < this.sources.size(); i++){
        // choose a fill
        fill(this.colorMap.get(this.sourcenames.get(i)));
        noStroke();
             
        //put the last leading angle into a2
        a2 = a1;
         
             //a1 addition not working properly
        //update the current leading angle
        
        a1 += this.sources.get(i)*t;
        //a1 += this.sources.append(row.getFloat(this.sourcenames.get(i)) * scaleFactor);

        ////print the angles for debuging purposes
        //println(this.name, this.sources.get(i),this.total);
        //println(a1+"  :  "+a2);
        
        //draw the arc
        arc(this.center_x, this.center_y, this.diameter / 2, this.diameter / 2, radians(a2), radians(a1));
      }
        noStroke();
        fill(#ff0000);        
        text(this.name, this.center_x, this.center_y);  
        }
}

   // void place_center(float x, float y, float scale_factor){
   //     this.center_x = x * scale_factor;
   //     this.center_y = y * scale_factor;
   //     this.radius = 5.0 * scale_factor;
   //     ellipse(this.center_x, this.center_y, 2* raidus, 2* radius);
   // }
   
   //float _checkArea(float alpha, float diameter){
   //    float r1 = diameter / 2;
   //    float r2;
   //    for (int i = 0; i < this.sources.size() - 1; i += 1){
   //        this.angles.set(i, alpha);
   //        r2 = max(this.sources.get(i), this.sources.get(i + 1)) / 2;
   //        alpha += 2 * atan(r2 / (r1 + r2));
   //        }
   //    r2 = this.sources.get(this.sources.size() - 1);
   //    alpha += atan(r2 / (r1 + r2));
   //    return alpha;
   //    }
       
   //boolean _angleBool(float theta, int idx){
   //    float r2 = this.angles.get(idx) / 2;
   //    float r1 = this.diameter;
   //    float angleDelta = atan(r2 / (r1 + r2));
   //    if(theta - angles.get(1) < angleDelta){
   //        return true;
   //        }
   //    else{
   //        return false;
   //        }
   //    }
   
   //void setDiameter(){
   //    if(this._checkArea(0, this.diameter) > 2 * PI){
   //      this.diameter += this.increment;
   //      this.setDiameter();
   //        }
   //    else if(this._checkArea(0, this.diameter) < 2 * PI * .75){
   //        this.increment /= 1.005;
   //        this.diameter -= this.increment;
   //        this.setDiameter();
   //        }
   //    }
    
    //float checkDistance(float theta){
    //    for(int i = 0; i < this.sources.size(); i++){
    //        if(this._angleBool(theta, i)){
    //            return this.diameter / 2 + this.sources.get(i);
    //            }
    //         }
    //     return this.diameter / 2 + this.sources.min();
    //    }
 
    //void placeResourceOrbs(){
    //    float angle_0 =  0;
    //    for (int i = 0; i < this.sources.size(); i++){
    //        float half_angle = atan( 0.5* sources.get(i);
    //        angle_1 = angle_0 + atan(this.sources.get(i);
    //        ellipse(center x
        //}
    //}
