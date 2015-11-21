class Ball{
  PVector location, velocity, acceleration;
  color col;
  float size, mass;
  
  Ball(){
    location = new PVector(width / 2, height / 2);
    velocity = new PVector();
    acceleration = new PVector();
    
    col = color(random(55, 255));
    
    size = random(10, 25);
    mass = size * 1.5;
  }
  
  void addForce(PVector force){
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }
  
  void Move(){
    velocity.add(acceleration);
    velocity.limit(1);
    location.add(velocity);
    
    acceleration.mult(0);
  }
  
  void KeepInViewport(){
    location.x = constrain(location.x, 0, width);
    location.y = constrain(location.y, 0, height);
  }
  
  void Draw(){
    fill(col);
    ellipse(location.x, location.y, size, size);
  }
}