public class HandDrawnLine {
  float sX=0;
  float sY=0;
  float eX=0;
  float lineLength=0;
  float angleX=0;
  float angleY=0;
  float angleZ=0;
  float startWeight=0.0;
  float maxWeight=0.0;
  color lineColor;
  long seed = (long)random(0,10000000);

  public HandDrawnLine (float lineLength, float angleX, float angleY, float angleZ, int maxWeight, color c) {
    this.lineLength = lineLength;
    this.angleX = angleX;
    this.angleY = angleY;
    this.angleZ = angleZ;
    this.maxWeight = maxWeight;
    this.lineColor = c;

    //this.init();
  }

  public void init(){

  }

  public void draw(){

    randomSeed(seed);

    float offNoise = 0;
    float choice = 1;
	  float newChoice = 0;
	  float lx = 0;
	  float distX = 5;
	  float distY = 1;
	  float weight = 0;
	 
	  pushMatrix();
	  	rotateZ(angleZ);
	  	rotateX(angleX);
	  	rotateY(angleY);
		  stroke(this.lineColor,255);
		  while((sX+lx)<this.lineLength){
        if (choice == 0){
          newChoice = random(1);
        }else if(choice == 1){
          newChoice = random(2);
        }else{
          newChoice = random(1,2);
        }
		  	
        weight = noise(offNoise) * this.maxWeight;

        offNoise+= 0.2;

		    strokeWeight(weight);
		    line (sX+lx, sY+(choice*distY), sX+lx+distX, sY + (newChoice*distY));

		    choice = newChoice;
		    lx += distX;
		  }
	  popMatrix();
  }
}