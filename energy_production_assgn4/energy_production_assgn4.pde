// Define Orb Colors
//HashMap colormap = new HashMap();
HashMap<String,String> colormap = new HashMap<String, String>()
colormap.put("coal", "020002");
colormap.put("geothermal", "623E10");
colormap.put("hydroelectric", "815714");
colormap.put("natural_gas", "8B5B93");
colormap.put("nuclear", "66F54D");
colormap.put("solar", "F1F12D");
colormap.put("wind", "67D4E8");


void setup() {
  
  
  

  // Note the HashMap's "key" is a String and "value" is an Integer
  HashMap<String,Integer> hm = new HashMap<String,Integer>();
  
  // Putting key-value pairs in the HashMap
  hm.put("Ava", 1);
  hm.put("Cait", 35);
  hm.put("Casey", 36);
  
  // Using an enhanced loop to iterate over each entry
  for (Map.Entry me : hm.entrySet()) {
    print(me.getKey() + " is ");
    println(me.getValue());
  }
    
  
  //table = loadTable("1990.csv", "header");

  //println(table.getRowCount() + " total rows in table"); 

  //for (TableRow row : table.rows()) {
    
  //  String state = row.getString("state");
  //  int year = row.getInt("year");
  //  int coal = row.getInt("coal");
  //  int geothermal = row.getInt("geothermal");
  //  int hydroelectric = row.getInt("hydroelectric");
  //  int natural_gas = row.getInt("natural_gas");
  //  int nuclear = row.getInt("nuclear");
  //  int biomass = row.getInt("biomass");
  //  int solar = row.getInt("solar");
  //  int wind = row.getInt("wind");
  //  int total = row.getInt("total");
    
    
    //println(state + " (" + coal + ") has a total power usage of " + total);
  //}
  
}
