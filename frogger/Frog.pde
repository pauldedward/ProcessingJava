class Frog extends Rectangle{
 
  Log attached = null;
  
 Frog(float x, float y, float w) {
   super(x, y, w, w);
 }
 
  void attach(Log log) {
    attached = log;
    
  }
  
  void detach() {
    attached = null;
  }
  
  void update() {
    if (attached != null) {
      frog.x += attached.speed;
    }
    frog.x = constrain(x , 0 ,width - w);
    frog.y = constrain(y , 0 ,height - w);
  }
  void show() {
    fill(0,255,0,200);
   
    rect(x, y , w, w);
  }
  
  void move(float xdir, float ydir) {
    
    x += xdir * grid;
    y += ydir * grid;
    
  }
  
  
}
