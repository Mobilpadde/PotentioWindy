import processing.serial.*;

Serial port;
Wind wind;
Ball[] balls;

void settings(){
  size(640, 640);
}

void setup(){
  noStroke();
  
  port = new Serial(this, Serial.list()[1], 9600);
  wind = new Wind();
  balls = new Ball[4];
  
  for(int i = 0, len = balls.length; i < len; i++) balls[i] = new Ball();
}

void draw(){
  background(25);
  
  String read = port.readStringUntil(13);
  if(read != null){
    read = trim(read);
    
    if(read != null && !read.isEmpty()){
      float windDir = float(read) / 1023 * 2 * PI;
      println(windDir);
      wind.Update(windDir);
    }
  }
  
  for(int i = 0, len = balls.length; i < len; i++){
    balls[i].addForce(wind.Get());
    balls[i].Move();
    balls[i].KeepInViewport();
    balls[i].Draw();
  }
  
  wind.Draw();
  saveFrame("/Users/MCordes/Desktop/Windy/#######.tif");
}