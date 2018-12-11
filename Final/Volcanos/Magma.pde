class Magma{
 float volume;
 float state;
 float peakFlow;
 int numVolcanos;
 HashMap<Integer, Volcano> volcanos;
 int[] probs;
 Land land;
 
 Magma(){
 }
 
  Magma(float volume, int numVolcanos){
   this.land = new Land(854/ 8, 480 /8);
   this.volume = volume;
   this.peakFlow = 20.0;
   this.state = 0;
   this.numVolcanos = numVolcanos;
   this.volcanos = new HashMap<Integer, Volcano>();
   this.probs = new int[numVolcanos * 100];
   for(int i=0; i < numVolcanos; i++){
     this.volcanos.put(i, new Volcano(this.land.randX(), this.land.randY()));
     for(int j= 100 * i; j < 100 * (i + 1); j++){
       this.probs[j] = i;
     }
   }
 }
 
 Magma(float volume, int numVolcanos, float peakFlow){
   this.land = new Land(854/ 8, 480 /8);
   this.volume = volume;
   this.peakFlow = peakFlow;
   this.numVolcanos = numVolcanos;
   this.state = 0;
   this.volcanos = new HashMap<Integer, Volcano>();
   this.probs = new int[numVolcanos * 100];
   for(int i=0; i < numVolcanos; i++){
     this.volcanos.put(i, new Volcano(this.land.randX(), this.land.randY()));
     for(int j= 100 * i; j < 100 * (i + 1); j++){
       this.probs[j] = i;
     }
   }
 }
 
  Magma(float volume, int numVolcanos, float peakFlow, int sizeX, int sizeY){
   this.land = new Land(sizeX, sizeY);
   this.volume = volume;
   this.peakFlow = peakFlow;
   this.numVolcanos = numVolcanos;
   this.state = 0;
   this.volcanos = new HashMap<Integer, Volcano>();
   this.probs = new int[numVolcanos * 100];
   for(int i=0; i < numVolcanos; i++){
     this.volcanos.put(i, new Volcano(this.land.randX(), this.land.randY()));
     for(int j= 100 * i; j < 100 * (i + 1); j++){
       this.probs[j] = i;
     }
   }
 }
 
 //commonMethods
 
 void flow(){
   this.state += random(0, .25);
   float flowAmt = abs(sin(PI * this.state)  * this.peakFlow);
   int choice = int(random(0, this.numVolcanos));
   println(choice);
   this.volcanos.get(choice).addMagma(flowAmt);
   this.probs[int(random(0,this.probs.length))] = choice;
   this.land.raiseLand(this.volcanos.get(choice));
 }
 
 void draw(){
   this.land.draw();
 }
}
