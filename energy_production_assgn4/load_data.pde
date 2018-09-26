HashMap hm = new HashMap();
colormap.put("coal", 363639);
colormap.put("coal", 363639);
colormap.put("hydroelectric", 815714);
colormap.put("natural_gas", 815714);
colormap.put("nuclear", 815714);
colormap.put("solar", 815714);
colormap.put("wind", 815714);

    
    
    class State{
      //Defines Parameters needes to define the energy generation of a state
        String name;
        float total;
        StringList sourcenames;
        StringList colors;
        IntList sources;
        float center_x;
        float center_y;
        float radius;
        
        State(TableRow row, HashMap colormap){
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
                this.sources.append(row.getInt(this.sourcenames.get(i)));
                }
        }
        
        //void place_center(float x, float y, float scale_factor){
        //    this.center_x = x * scale_factor;
        //    this.center_y = y * scale_factor;
        //    this.radius = 5.0 * scale_factor
        //    ellipse(this.center_x, this.center_y, raidus, radius);
        //}
        
        //void place_orbs(){
        //    for(int source in 
        
        //}
    }

void load_year(String year){

    Table this_year = loadTable(year + ".csv", "header");
    
    HashMap<String,State> states = new HashMap<String, State>();
  
    for (TableRow row : this_year.rows()){
        states.put(row.getString("state"), new State(row));
        }
  }
