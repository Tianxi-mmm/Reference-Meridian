int numberOfBalls = 50;

float[] ballX = new float[numberOfBalls];
float[] ballY = new float[numberOfBalls];
float[] ballXSpeed = new float[numberOfBalls];
float[] ballYSpeed = new float[numberOfBalls];
int[] ballSize = new int[numberOfBalls];


ArrayList<Integer> linkedBall = new ArrayList<Integer>();

HashMap<Integer,ArrayList<Integer>> linkedBalls = new HashMap<Integer,ArrayList<Integer>>();



int ballWidth = 7;
int speedScale = 3;

void setup() {
  //fullScreen();
  size(2160,1600);
  background(21);
  colorMode(RGB, 255, 255, 255, 255);//CHANGE MIN MAX OF COLOR MODE

  for (int i = 0; i < numberOfBalls; i++) {
    ballX[i] = random(ballWidth, width-ballWidth);
    ballY[i] = random(ballWidth, height-ballWidth);
    ballSize[i] = (int)random(30,100);
    ballXSpeed[i] = random(-5, 5) / speedScale;
    ballYSpeed[i] = random(-5, 5) / speedScale;
    linkedBalls.put(i,linkedBall);
  }
  fill(255);
}

void draw() {
  noStroke();
  background(0, 9, 35);


  for (int i = 0; i < numberOfBalls; i++) {
    
    
    drawLine(i);
    drawCircle(i);
    isColliding(ballX[i], ballY[i], i);

    ballX[i] += ballXSpeed[i];
    ballY[i] += ballYSpeed[i];
    
    lightNetwork(i);
    
    println("*****" + i);
    printArray(linkedBalls.get(i));
  }
  
}

void isColliding(float x, float y, int i) {
  if (x < ballWidth/2) {
    ballXSpeed[i] *= -1;
  }
  if (y < ballWidth/2) {
    ballYSpeed[i] *= -1;
  }
  if (x > width-ballWidth/2) {
    ballXSpeed[i] *= -1;
  }
  if (y > height-ballWidth/2) {
    ballYSpeed[i] *= -1;
  }
}

void drawLine(int i) {
  for (int j = 0; j < numberOfBalls; j++) {
    if (i != j) {
      float d = dist(ballX[i], ballY[i], ballX[j], ballY[j]);
      float m = map(d, 0, sqrt(width*width + height*height), 200, -1000);
      stroke(255, m);

      strokeWeight(3);
      line(ballX[i], ballY[i], ballX[j], ballY[j]);
      if (m>0){
        linkedBalls.get(i).add(j);
      }
      
    }
  }
}

void drawCircle(int i){

  for (int j = 0; j < numberOfBalls; j++) {// 
  if (i != j) {
      //float d = dist(ballX[i], ballY[i], ballX[j], ballY[j]);
      //float n = map(d, 0, sqrt(width*width + height*height), 255, 0);
      //println(n);
      noStroke();
      fill(230, 3);
      ellipse(ballX[i], ballY[i], ballSize[i],ballSize[i]);
    }
  }
  
}

void lightNetwork(int i){
  
  if ((mouseX > (ballX[i]-25) )&&( mouseX < (ballX[i] +25)) &&(mouseY > (ballY[i]-25) )&&( mouseY < (ballY[i] +25))){
    
     println("get "+i);
     fill(255);
     ellipse(ballX[i], ballY[i], ballSize[i],ballSize[i]);    
     int n = linkedBalls.get(i).size();
     for(int m = 0; m < n; m++){
       fill(255);
       ellipse(ballX[linkedBalls.get(i).get(m)], ballY[linkedBalls.get(i).get(m)], ballSize[linkedBalls.get(i).get(m)],ballSize[linkedBalls.get(i).get(m)]);
     }
  } 
}

void getLinkedBalls(int i){
  
}

void setInitialNode(int i){
  
}
