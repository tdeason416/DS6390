import java.util.Map;

HashMap<String, Integer> colorMap = new HashMap<String, Integer>();
HashMap<String, State> thisYear = new HashMap<String, State>();
StringList stateNames = new StringList();
State IState;

int keyloc_x = 3;
int keyloc_y = 3;
int year = 1990;
int max_year = 2017;
int current_state = 51;
int sleep_timer = 0;
float ploc_x = 0;
float ploc_y = 720;
float pdia = 0;
float ndia;
float max_volume = 8187212010.0;
float scaleFactor = 321600 / (max_volume); 


void setup() {
  size(1280, 720);

  //DEFINE WEDGE COLORS
  colorMap.put("coal", #000000);
  colorMap.put("geothermal", #996633);
  colorMap.put("hydroelectric", #0000ff);
  colorMap.put("natural_gas", #ff80ff);
  colorMap.put("nuclear", #ff6600);
  colorMap.put("biomass", #006600);
  colorMap.put("solar", #ffff4d);
  colorMap.put("wind", #4dffff);
  
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
  stateNames.append("SC");
  stateNames.append("NE");
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
  stateNames.append("MN");
  stateNames.append("WI");
  stateNames.append("NY");
  stateNames.append("MI");
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
         if(sleep_timer < 120){
            sleep_timer += 1;
        }
        else{
          keyloc_y = 10;
          background(190);
          for(String s: colorMap.keySet()){
            fill(colorMap.get(s));
            rect(keyloc_x - 2, keyloc_y - 2, 2, 2);
            text(s, keyloc_x + 4, keyloc_y);
            keyloc_y += 12;
          }
          fill(35);
          text(str(year), width/2, 10);
          thisYear = load_year(year, stateNames, colorMap, scaleFactor);
          sleep_timer = 0;
          current_state = 0;
          ploc_x = 0;
          ploc_y = height - 20;
          year += 1;
          if(year >= 2018){
            year = 1990;
          }
        }
    }
    else{
    IState = thisYear.get(stateNames.get(current_state));
    if(ploc_x + .5 * IState.diameter > width){
        ploc_y -= 100;
        ploc_x = IState.diameter / 2;
        }
    IState.center_x = ploc_x;
    IState.center_y = ploc_y;
//    checkInterferance(IState, thisYear, stateNames, current_state);
    IState.drawPie();
    ploc_x = IState.center_x + 10;
    current_state += 1;
    }
}
