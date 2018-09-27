import java.util.Map;


HashMap<String, String> colorMap = new HashMap<String, String>();
HashMap<String, State> thisYear = new HashMap<String, State>();
StringList stateNames = new StringList();

int year = 1990;
int max_year = 2017;
int current_state = 51;
float ploc_x = 0;
float ploc_y = 0;
float pdia = 0;
float ndia;
float max_volume = 8187212010.0;
float scaleFactor = 2073600.0 / (max_volume * 4.0/3.0); 


void setup() {
  size(1920, 1080);

  //DEFINE ORB COLORS
  colorMap.put("coal", "020002");
  colorMap.put("geothermal", "623E10");
  colorMap.put("hydroelectric", "815714");
  colorMap.put("natural_gas", "8B5B93");
  colorMap.put("nuclear", "66F54D");
  colorMap.put("biomass", "1E6323");
  colorMap.put("solar", "F1F12D");
  colorMap.put("wind", "67D4E8");
  
  //ADD STATE NAMES
  stateNames.append("HI");
  stateNames.append("AZ");
  stateNames.append("NM");
  stateNames.append("TX");
  stateNames.append("LA");
  stateNames.append("MI");
  stateNames.append("AL");
  stateNames.append("FL");
  stateNames.append("GA");
  stateNames.append("FL");
  stateNames.append("CA");
  stateNames.append("NV");
  stateNames.append("UT");
  stateNames.append("CO");
  stateNames.append("KS");
  stateNames.append("OK");
  stateNames.append("AR");
  stateNames.append("TN");
  stateNames.append("NC");
  stateNames.append("NE");
  stateNames.append("MI");
  stateNames.append("KY");
  stateNames.append("WV");
  stateNames.append("VA");
  stateNames.append("OR");
  stateNames.append("ID");
  stateNames.append("WY");
  stateNames.append("SD");
  stateNames.append("IA");
  stateNames.append("IL");
  stateNames.append("IN");
  stateNames.append("OH");
  stateNames.append("PA");
  stateNames.append("DC");
  stateNames.append("MD");
  stateNames.append("DE");
  stateNames.append("WA");
  stateNames.append("MT");
  stateNames.append("ND");
  stateNames.append("MI");
  stateNames.append("WI");
  stateNames.append("MI");
  stateNames.append("NY");
  stateNames.append("NJ");
  stateNames.append("CT");
  stateNames.append("RI");
  stateNames.append("AK");
  stateNames.append("VT");
  stateNames.append("NH");
  stateNames.append("MS");
  stateNames.append("ME"); 
 
  
}

void draw(){
    if(current_state == 51){
        thisYear = load_year(year, stateNames, colorMap, scaleFactor);
        current_state = 0;
        ploc_x = 0;
        ploc_y = 0;
        year += 1;
    }
    ndia = thisYear.get(stateNames.get(current_state)).diameter;
    ploc_x = ploc_x + pdia + ndia;
    ploc_y = ploc_y + pdia + ndia;
    thisYear.get(stateNames.get(current_state)).drawPie(ploc_x + pdia + ndia, ploc_y + pdia + ndia);
    
    
    
    current_state += 1;
    //println(colormap);
    //WA = new State(loadTable(year + "_WA.csv", "header").getRow(0), 1);
    //println(WA.sourcenames);
//  table = loadTable("year.csv", "header");

//  println(table.getRowCount() + " total rows in table"); 
  
  
//  for (TableRow row : table.rows()) {
    
//    String state = row.getString("state");
//    float coal = row.getFloat("coal");
//    float natural_gas = row.getFloat("natural_gas");
    
//    println(state + " (" + coal + ") has an ID of " + natural_gas);
//  } 
//}
}
