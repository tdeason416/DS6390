import java.util.Map;


HashMap<String, String> colorMap = new HashMap<String, String>();
HashMap<String, State> thisYear = new HashMap<String, State>();
StringList stateNames = new StringList();
State IState;


int year = 1990;
int max_year = 2017;
int current_state = 51;
int sleep_timer = 0;
float ploc_x = 0;
float ploc_y = 720;
float pdia = 0;
float ndia;
float max_volume = 8187212010.0;
float scaleFactor = 421600 / (max_volume); 


void setup() {
  size(1280, 720);

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
  stateNames.append("MS");
  stateNames.append("AL");
  stateNames.append("FL");
  stateNames.append("GA");
  stateNames.append("CA");
  stateNames.append("NV");
  stateNames.append("UT");
  stateNames.append("CO");
  stateNames.append("KS");
  stateNames.append("MO");
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
  stateNames.append("NY");
  stateNames.append("MA");
  stateNames.append("NJ");
  stateNames.append("CT");
  stateNames.append("RI");
  stateNames.append("AK");
  stateNames.append("VT");
  stateNames.append("NH");
  stateNames.append("MA");
  stateNames.append("ME"); 
 
 
}

void draw(){
    if(current_state == 51){
         if(sleep_timer < 900){
            sleep_timer += 1;
        }
        else{
          background(190);
          text(str(year), width/2, 10);
          thisYear = load_year(year, stateNames, colorMap, scaleFactor);
          sleep_timer = 0;
          current_state = 0;
          ploc_x = 0;
          ploc_y = height - 20;
          year += 1;
          }
    }
    else{
    IState = thisYear.get(stateNames.get(current_state));
    if(ploc_x + .5 * IState.diameter > width){
        println("poop");
        ploc_y -= 100;
        ploc_x = IState.diameter / 2;
        }
    println(str(ploc_x) + "__" + str(ploc_y) + "::" + str(IState.diameter));
    IState.center_x = ploc_x;
    IState.center_y = ploc_y;
    checkInterferance(IState, thisYear, stateNames, current_state);
    IState.drawPie();
    ploc_x = IState.center_x + 10;
    current_state += 1;
    }
}
