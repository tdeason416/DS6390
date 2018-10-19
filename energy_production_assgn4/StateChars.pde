class StateChars{
  //
  HashMap<String, Integer> dropLoc = new HashMap<String, Integer>();
  HashMap<String, Integer> order = new HashMap<String, Integer>();
  HashMap<String, State> states = new HashMap<String, State>();
  HashMap<String, Integer> colorMap = new HashMap<String, Integer>();
  HashMap<Integer, String> stateNames = new HashMap<Integer, String>();
  String currentState;
  
  //
  StateChars(){
    this.currentState = "HI";
    
    //Map StateNames
    this.stateNames.put(0, "HI");
    this.stateNames.put(1, "AZ");
    this.stateNames.put(2, "NM");
    this.stateNames.put(3, "TX");
    this.stateNames.put(4, "LA");
    this.stateNames.put(5, "MS");
    this.stateNames.put(6, "AL");
    this.stateNames.put(7, "FL");
    this.stateNames.put(8, "GA");
    this.stateNames.put(9, "CA");
    this.stateNames.put(10, "NV");
    this.stateNames.put(11, "UT");
    this.stateNames.put(12, "CO");
    this.stateNames.put(13, "KS");
    this.stateNames.put(14, "OK");
    this.stateNames.put(15, "AR");
    this.stateNames.put(16, "MO");
    this.stateNames.put(17, "TN");
    this.stateNames.put(18, "SC");
    this.stateNames.put(19, "NC");
    this.stateNames.put(20, "NE");
    this.stateNames.put(21, "KY");
    this.stateNames.put(22, "VA");
    this.stateNames.put(23, "WV");
    this.stateNames.put(24, "OR");
    this.stateNames.put(25, "ID");
    this.stateNames.put(26, "WY");
    this.stateNames.put(27, "SD");
    this.stateNames.put(28, "IA");
    this.stateNames.put(29, "IL");
    this.stateNames.put(30, "IN");
    this.stateNames.put(31, "OH");
    this.stateNames.put(32, "DC");
    this.stateNames.put(33, "MD");
    this.stateNames.put(34, "DE");
    this.stateNames.put(35, "PA");
    this.stateNames.put(36, "WA");
    this.stateNames.put(37, "MT");
    this.stateNames.put(38, "ND");
    this.stateNames.put(39, "MN");
    this.stateNames.put(40, "WI");
    this.stateNames.put(41, "NJ");
    this.stateNames.put(42, "NY");
    this.stateNames.put(43, "MI");
    this.stateNames.put(44, "CT");
    this.stateNames.put(45, "RI");
    this.stateNames.put(46, "AK");
    this.stateNames.put(47, "MA");
    this.stateNames.put(48, "VT");
    this.stateNames.put(49, "NH");
    this.stateNames.put(50, "ME"); 

    
    //DEFINE WEDGE COLORS
    this.colorMap.put("coal", #000000);
    this.colorMap.put("geothermal", #996633);
    this.colorMap.put("hydroelectric", #0000ff);
    this.colorMap.put("natural_gas", #ff80ff);
    this.colorMap.put("nuclear", #ff6600);
    this.colorMap.put("biomass", #006600);
    this.colorMap.put("solar", #ffff4d);
    this.colorMap.put("wind", #4dffff);
  
    //LOAD STATE CHARACTERISTICS
    this.order.put("HI", 0);
    this.dropLoc.put("HI", int(width * .3));
    this.order.put("AZ", 1);
    this.dropLoc.put("AZ", int(width * .15));
    this.order.put("NM", 2);
    this.dropLoc.put("NM", int(width * .20));
    this.order.put("TX", 3);
    this.dropLoc.put("TX", int(width * .35));
    this.order.put("LA", 4);
    this.dropLoc.put("LA", int(width * .50));
    this.order.put("MS", 5);
    this.dropLoc.put("MS", int(width * .55));
    this.order.put("AL", 6);
    this.dropLoc.put("AL", int(width * .60));
    this.order.put("FL", 7);
    this.dropLoc.put("FL", int(width * .80));
    this.order.put("GA", 8);
    this.dropLoc.put("GA", int(width * .77));
    this.order.put("CA", 9);
    //ROW 2
    this.dropLoc.put("CA", int(width * .10));
    this.order.put("NV", 10);
    this.dropLoc.put("NV", int(width * .13));
    this.order.put("UT", 11);
    this.dropLoc.put("UT", int(width * .17));
    this.order.put("CO", 12);
    this.dropLoc.put("CO",  int(width * .206));
    this.order.put("KS", 13);
    this.dropLoc.put("KS", int(width * .31));
    this.order.put("OK", 14);
    this.dropLoc.put("OK", int(width * .37));
    this.order.put("AR", 15);
    this.dropLoc.put("AR", int(width * .421));
    this.order.put("MO", 16);
    this.dropLoc.put("MO", int(width * .40));
    this.order.put("TN", 17);
    this.dropLoc.put("TN", int(width * .56));
    this.order.put("SC", 18);
    this.dropLoc.put("SC", int(width * .83));
    this.order.put("NC", 19);
    this.dropLoc.put("NC", int(width * .86));
    //ROW 3 -- east only
    this.order.put("NE", 20);
    this.dropLoc.put("NE", int(width * .252));
    this.order.put("KY", 21);
    this.dropLoc.put("KY", int(width * .59));
    this.order.put("VA", 22);
    this.dropLoc.put("VA", int(width * .84));
    this.order.put("WV", 23);
    this.dropLoc.put("WV", int(width * .79));
    //ROW 4 -- Includes West
    this.order.put("OR", 24);
    this.dropLoc.put("OR", int(width * .10));
    this.order.put("ID", 25);
    this.dropLoc.put("ID", int(width * .15));
    this.order.put("WY", 26);
    this.dropLoc.put("WY", int(width * .19));
    this.order.put("SD", 27);
    this.dropLoc.put("SD", int(width * .233));
    this.order.put("IA", 28);
    this.dropLoc.put("IA", int(width * .38));
    this.order.put("IL", 29);
    this.dropLoc.put("IL", int(width * .44));
    this.order.put("IN", 30);
    this.dropLoc.put("IN", int(width * .52));
    this.order.put("OH", 31);
    this.dropLoc.put("OH", int(width * .65));
    this.order.put("DC", 32);
    this.dropLoc.put("DC", int(width * .80));
    this.order.put("MD", 33);
    this.dropLoc.put("MD", int(width * .75));
    this.order.put("DE", 34);
    this.dropLoc.put("DE", int(width * .85));
    //Row 4.5 Just NE
    this.order.put("PA", 35);
    this.dropLoc.put("PA", int(width * .71));
    //Row 5 ALL states
    this.order.put("WA", 36);
    this.dropLoc.put("WA", int(width * .093));
    this.order.put("MT", 37);
    this.dropLoc.put("MT", int(width * .168));
    this.order.put("ND", 38);
    this.dropLoc.put("ND", int(width * .243));
    this.order.put("MN", 39);
    this.dropLoc.put("MN", int(width * .37));
    this.order.put("WI", 40);
    this.dropLoc.put("WI", int(width * .42));
    this.order.put("NJ", 41);
    this.dropLoc.put("NJ", int(width * .72));
    this.order.put("NY", 42);
    this.dropLoc.put("NY", int(width * .75));
    //ROW 6 Midwest to East Coast
    this.order.put("MI", 43);
    this.dropLoc.put("MI", int(width *.54));
    this.order.put("CT", 44);
    this.dropLoc.put("CT", int(width * .78));
    this.order.put("RI", 45);
    this.dropLoc.put("RI", int(width * .80));
    // ROW 7 -- ALL Regions
    this.order.put("AK", 46);
    this.dropLoc.put("AK", int(width * .075));
    this.order.put("MA", 47);
    this.dropLoc.put("MA", int(width * .79));
    this.order.put("VT", 48);
    this.dropLoc.put("VT", int(width * .765));
    this.order.put("NH", 49);
    this.dropLoc.put("NH", int(width * .825));
    this.order.put("ME", 50); 
    this.dropLoc.put("ME", int(width * .91));
  }
  
  //Get Methods
  int getOrder(int n){
    return this.order.get(n);
  }
  
  int getDropLoc(int n){
    return this.dropLoc.get(n);
  }
  
  State getState(String name){
    return this.states.get(name);
  }
  
  String getNextState(){
    this.currentState = this.stateNames.get(this.order.get(currentState) + 1);
    return this.currentState;
  }
  
  String getCurrentState(){
    return this.currentState;
  }
  
  //Other Methods
  void loadYear(int year){
    for(int i = 0; i < this.stateNames.size() ; i += 1){
      TableRow rowi = loadTable(str(year) + "_" + this.stateNames.get(i) + ".csv", "header").getRow(0);
      State ST = new State(rowi, colorMap, scaleFactor);
      this.states.put(this.stateNames.get(i), ST);
    }
  }
  

}
