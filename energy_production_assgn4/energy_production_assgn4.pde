import java.util.Map;


HashMap<String, State> thisYear;
StringList stateNames;
StringList currentStates;
StateChars stateChars;
SleepTimer sleepTimer;
Floor floor;
int year = 1990;
int nullTimer = 0;
int max_year = 2017;
float max_volume = 8187212010.0;
float scaleFactor = 321600 / (max_volume); 


void setup() {
  size(1280, 720);
  floor = new Floor();
  sleepTimer = new SleepTimer(120);
  stateChars = new StateChars();
  currentStates = new StringList();
  stateNames = new StringList();
  thisYear = new HashMap<String, State>();
  stateChars.loadYear(year);
}


void draw(){
   if((stateChars.currentState == "ME") & (currentStates.size() == 0)){
       println("It's MAINE AGIAN");
       if(sleepTimer.checkTimer()){
         sleepTimer = new SleepTimer(120);
       }
       else{
         year += 1;
         nullTimer = 0;
         sleepTimer.incrementTime();
         stateChars.loadYear(year);
         stateChars.updateCenters();
         floor = new Floor(); 
       }
   }
   else{
      background(122);
      //println(currentStates);
      if((nullTimer % 50 == 0) & (currentStates.size() < 5)){
         if(stateChars.getCurrentState() != "ME"){
         currentStates.append(stateChars.getNextState()); 
         }
      }
      for(int i = 0; i < currentStates.size(); i += 1){
         State Istate = stateChars.states.get(currentStates.get(i));
         //println(Istate.center_x + " : "  + Istate.center_y);
         Istate.center_y += Istate.speed_y;
         Istate.center_x += Istate.speed_x;
         boolean bool = floor.checkifFloor(Istate);
         println(bool);
         if(bool){
           currentStates.remove(i);
         
        }
     nullTimer += 1;
     }
   }
   //println(floor.floorHeight);
   stateChars.drawAll();
}
