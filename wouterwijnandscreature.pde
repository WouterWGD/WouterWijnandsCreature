class wouterwijnandscreature extends Creature {


float x, buikradius, hoofdradius,oogradius,buiklengte, buikY,hoofdX;

void setup() {
  size(500, 500);
}

void draw() {
  background(255, 200, 0);
  stroke(255);                   // every outline will be white
  strokeWeight(5);               // every outline will be 5 pixels wide
  noFill();                      // the inside of a shape will not have a color

  
  buikradius = calculatelichaamRadius(0.05, 150, 40);
      buiklengte = buikradius*1.5;    
  hoofdradius = calculatelichaamRadius(0.05, 150, 40); 
  oogradius = calculateoogRadius(1, 30, 2);  
  pushMatrix();
  float lineWidth = map(x, -1, 1, 5, 3);  // and the lineWidth
  strokeWeight(lineWidth);                // set the lineWidth
  
  ellipse(width / 2, height / 3.5, hoofdradius, hoofdradius); //Hoofd 
  
  buikY = buiklengte/2 + hoofdradius/2;
  translate(0,buikY);
  ellipse(width / 2, height / 3.5, buikradius,buiklengte); // De buik

  popMatrix();  
    
    
    
 for(int i = 0; i < 10; i++){ 
       strokeWeight(lineWidth);    
       pushMatrix();
       hoofdX = hoofdradius/4 + oogradius/8;
       translate(hoofdX,0);
       ellipse(width / 2, height / 3.5, oogradius, oogradius); //rechteroog
       ellipse(width / 2.3, height / 3.5, oogradius, oogradius); //linkeroog
       popMatrix();
       
  
        
    }
};    
 
 
 
float calculateoogRadius(float frameMod, float upper, float lower) {
  float phase = frameCount *frameMod;
 // float phaseAddition = map(sin(phase), -1, 1, 100, 102); // determine how much the phase should ‘shift’ for every circle
//  float phaseAddition += 0.5; //More unpredictable result
  phase = phase += 5;  
  float x =sin(phase);
  return map(x, -1, 1, upper, lower);              //hier wordt de value gereturned en ogezet naar de upper en de lower en de phaseaddition wordt toegevoegd
}


float calculatelichaamRadius(float frameMod, float upper, float lower) {
  float phase = frameCount * frameMod;                // determine a ‘phase’ for the sine function(snelheid)
  float x = sin(phase);                           // this will be a value between -1 and 1
  return map(x, -1, 1, upper, lower);              //hier wordt de value gereturned en ogezet naar de upper en de lower
}
}




