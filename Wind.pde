class Wind{
  float min, max;
  PVector wind;
  Arrow arrow;
  
  Wind(){
    min = -0.01;
    max = min * -1;
    arrow = new Arrow(new PVector());
    
    Update(0);
  }
  
  void Update(float angle){
    wind = PVector.fromAngle(angle);
    //wind.normalize();
    println(wind);
    arrow.SetWind(wind);
  }
  
  PVector Get(){
    return wind;
  }
  
  void Draw(){
    arrow.Draw();
  }
}