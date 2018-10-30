class SleepTimer{
  int currentTime;
  int maxTime;
 
  SleepTimer(int maxTime){
    this.currentTime = 0;
    this.maxTime = maxTime;
  }
  
  int getTime(){
    return this.currentTime;
  }
  
  void incrementTime(){
    this.currentTime += 1;
  }
  
  boolean checkTimer(){
    if(this.currentTime < this.maxTime){
      return false;
    }
    else{
      return true;
    }
  }
  
}
