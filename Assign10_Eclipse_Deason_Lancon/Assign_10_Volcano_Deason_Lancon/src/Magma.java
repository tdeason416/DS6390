import java.util.HashMap;
//import java.util.Map;
import processing.core.*;

public class Magma{
 PApplet p;
 float volume;
 float state;
 float peakFlow;
 int numVolcanos;
 int zz;
 HashMap<Integer, Volcano> volcanos;
 int[] probs;
 Land land;
 
  Magma(){
  }
 
  Magma(PApplet p, float volume, int numVolcanos){
   this.p = p;
   this.land = new Land(p,PApplet.parseInt(854/ 8),PApplet.parseInt(480 /8));
   this.volume = volume;
   this.peakFlow = 20;
   this.state = 0;
   this.numVolcanos = numVolcanos;
   this.volcanos = new HashMap<Integer, Volcano>();
   this.probs = new int[numVolcanos * 100];
   for(int i=0; i < numVolcanos; i++){
     this.volcanos.put(i, new Volcano(p, this.land.randX(), this.land.randY()));
     for(int j= 100 * i; j < 100 * (i + 1); j++){
       this.probs[j] = i;
     }
   }
 }
 
 Magma(PApplet p, float volume, int numVolcanos, float peakFlow){
   this.p = p;
   this.land = new Land(p, 854/ 8, 480 /8);
   this.volume = volume;
   this.peakFlow = peakFlow;
   this.numVolcanos = numVolcanos;
   this.state = 0;
   this.volcanos = new HashMap<Integer, Volcano>();
   this.probs = new int[numVolcanos * 100];
   for(int i=0; i < numVolcanos; i++){
     this.volcanos.put(i, new Volcano(p, this.land.randX(), this.land.randY()));
     for(int j= 100 * i; j < 100 * (i + 1); j++){
       this.probs[j] = i;
     }
   }
 }
 
 Magma(PApplet p,float volume, int numVolcanos, float peakFlow, int sizeX, int sizeY){
   this.p = p;
   this.land = new Land(p, sizeX, sizeY);
   this.volume = volume;
   this.peakFlow = peakFlow;
   this.numVolcanos = numVolcanos;
   this.state = 0;
   this.volcanos = new HashMap<Integer, Volcano>();
   this.probs = new int[numVolcanos * 100];
   for(int i=0; i < numVolcanos; i++){
     this.volcanos.put(i, new Volcano(p, this.land.randX(), this.land.randY()));
     for(int j= 100 * i; j < 100 * (i + 1); j++){
       this.probs[j] = i;
     }
   }
 }
 
 //commonMethods
 
 void flow(){
   PApplet p = this.p;
   this.state += p.random(0, 1) / 4;
   float flowAmt = PApplet.abs(PApplet.sin(PConstants.PI * this.state)  * this.peakFlow);
   int choice = (int)(p.random(0, this.numVolcanos));
   this.volcanos.get(choice).addMagma(flowAmt);
   this.probs[(int) (p.random(0,this.probs.length))] = choice;
   this.land.raiseLand(this.volcanos.get(choice));
 }
 
 void draw(){
   this.land.draw();
 }
}
