State ST;


HashMap load_year(int year, StringList stateNames, HashMap colorMap, float scaleFactor){
    String iyear = str(year);
    HashMap<String, State> stateObjs = new HashMap<String, State>();
    for(int i = 0; i < stateNames.size() ; i += 1){
        TableRow rowi = loadTable(iyear + "_" + stateNames.get(i) + ".csv", "header").getRow(0);
        ST = new State(rowi, colorMap, scaleFactor);
        stateObjs.put(stateNames.get(i), ST);
        }
    return stateObjs;
  }
