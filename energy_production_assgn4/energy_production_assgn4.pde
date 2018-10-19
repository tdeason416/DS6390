import java.util.Map;


HashMap<String, State> thisYear = new HashMap<String, State>();
StringList stateNames = new StringList();
StringList currentStates = new StringList();
StateChars stateChars = new StateChars();
SleepTimer sleepTimer = new SleepTimer(120);
Floor floor = new Floor();

//int keyloc_x = 3;
//int keyloc_y = 3;
int year = 1990;
int null_timer = 0;
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
       println("It's MAINE AGIAN");
       if(sleepTimer.checkTimer()){
         sleepTimer = new SleepTimer(120);
       }
       else{
         year += 1;
         null_timer = 0;
         sleepTimer.incrementTime();
         stateChars.loadYear(year);
         floor = new Floor(); 
       }
   }
   else{
      println("It's not MAINE");
      if((null_timer % 5 == 0) & (currentStates.size() < 5)){
         if(stateChars.getCurrentState() != "ME"){
         currentStates.append(stateChars.getNextState());
         }
      }
       for(int i = 0; i < currentStates.size(); i += 1){
          State Istate = stateChars.states.get(currentStates.get(i));
          Istate.center_y += Istate.speed_y;
          Istate.center_x += Istate.speed_x;
          boolean bool = floor.checkifFloor(Istate);
          if(bool){
            currentStates.remove(i);
        }
      
     }
   }
}
