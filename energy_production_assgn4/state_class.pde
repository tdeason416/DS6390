class State{
//Defines Parameters needes to define the energy generation of a state
    //HashMap colormap;
    String name;
    float total;
    //ArrayList<String> sourcenames = new ArrayList<String>();
    //ArrayList<String> colors = new ArrayList<String>();

    StringList sourcenames = new StringList();
    StringList colors = new StringList();
    FloatList sources = new FloatList();
    FloatList angles = new FloatList();
    float center_x;
    float center_y;
    float diameter;
    
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
        //this.sourcenames.shuffle();
        for (int i = 0; i < this.sourcenames.size(); i+=1){
            this.sources.append(sqrt(row.getFloat(this.sourcenames.get(i)) * scaleFactor));
            this.angles.append(0.0);
            this.colors.append(colorMap.get(this.sourcenames.get(i)).toString());
            }
        //this.colormap = colormap;
        this.center_x = 0;
        this.center_y = 0;
        this.setAngles();
    }
       
   void setAngles(){
       this.diameter = sqrt(this.total * scaleFactor) * 2;
       float anglei = 0;
       for (int i= 0; i < this.sources.size(); i++){
           anglei += this.sources.get(i) / this.sources.sum() * 2 * PI;
           this.angles.set(i, anglei);
           }
       }
   
   void drawPie(){
        //this.center_x = center_x;
        //this.center_y = center_y;
        float lastAngle = 0;
        for (int i = 0; i < this.angles.size(); i++){
            noStroke();
            //fill(unhex(this.colors.get(i)));
            fill(120);
            arc(this.center_x, this.center_y, this.diameter / 2, this.diameter /2, lastAngle, lastAngle + (this.angles.get(i)));
            lastAngle += this.angles.get(i);
            }
        noStroke();
        ellipse(center_x, center_y, this.diameter / 2, this.diameter / 2);
        fill(0, 0, 0);
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
