import java.util.Map;


HashMap<String, State> thisYear = new HashMap<String, State>();
StringList stateNames = new StringList();
StringList currentStates = newStringList();
stateChars stateChars = new StateChars();
SleepTimer sleepTimer = new SleepTimer(120);
Floor floor = new Floor();

//int keyloc_x = 3;
//int keyloc_y = 3;
int year = 1990;
null_timer = 0;
int max_year = 2017;
int currentState = 51;
String latestState = "ME";
//float ploc_x = 0;
//float ploc_y = 720;
//float pdia = 0;
//float ndia;
float max_volume = 8187212010.0;
float scaleFactor = 321600 / (max_volume); 


void setup() {
  size(1280, 720);
}


void draw(){
   if((latestState == "ME") & (currentStates.size() == 0)){
       if(sleepTimer.checkTimer()){
         sleepTimer = new SleepTimer(120);
       }
       else{
         year += 1
         null_timer = 0
         sleepTimer.incrementTime();
         stateChars.loadYear(year);
         floor = new Floor(); 
       }
   }
   else{
      if((null_timer % 5 == 0) & (currentStates.size() < 5){
         if(stateChars.getCurrentState() != "ME"){
         currentStates.append(stateChars.getNextState())
         }
      }
       for(i = 0; i < currentStates.size(), i += 1){
          Istate = stateChars.states.get(currentStates(i))
          Istate.center_y += Istate.speed_y;
          Istate.center_x += Istate.speed_x;
          boolean bool = floor.checkifFloor(IState);
          if(bool){
            currentStates.remove(i);
        }
      
     }
   }

//void draw(){
//    if(current_state == 51){
//         if(sleep_timer < 120){
//            sleep_timer += 1;
//        }
//        else{
//          keyloc_y = 10;
//          background(190);
//          for(String s: colorMap.keySet()){
//            fill(colorMap.get(s));
//            rect(keyloc_x - 2, keyloc_y - 2, 2, 2);
//            text(s, keyloc_x + 4, keyloc_y);
//            keyloc_y += 12;
//          }
//          fill(35);
//          text(str(year), width/2, 10);
//          thisYear = load_year(year, stateNames, colorMap, scaleFactor);
//          sleep_timer = 0;
//          current_state = 0;
//          ploc_x = 0;
//          ploc_y = height - 20;
//          year += 1;
//          if(year >= 2018){
//            year = 1990;
//          }
//        }
//    }
//    else{
//    IState = thisYear.get(stateNames.get(current_state));
//    if(ploc_x + .5 * IState.diameter > width){
//        ploc_y -= 100;
//        ploc_x = IState.diameter / 2;
//        }
//    IState.center_x = ploc_x;
//    IState.center_y = ploc_y;
////    checkInterferance(IState, thisYear, stateNames, current_state);
//    IState.drawPie();
//    ploc_x = IState.center_x + 10;
//    current_state += 1;
//    }
//}
