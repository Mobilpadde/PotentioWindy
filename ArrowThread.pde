class ArrowThread extends Thread{
  Arrow arrow;
  PVector lerpTo;
  float lastTime;
  
  ArrowThread(Arrow a, PVector l){
    arrow = a;
    lerpTo = l;
    lastTime = millis();
  }
  
  void run(){
    while(true){
      if(millis() - lastTime > 1000 / 60){
        arrow.location.lerp(lerpTo, 0.02);
        lastTime = millis();
      }
    }
  }
}