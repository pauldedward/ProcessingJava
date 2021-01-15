Frog frog;
Car[] cars;
Log[] logs;
float grid = 50;

void resetGame() {

  frog = new Frog(width / 2 - grid / 2, height - grid, grid );
}
void setup() {
  size(540, 500); 

  resetGame();

  int index = 0;
  cars = new Car[8];

  for (int i = 0; i < 2; i++) { 
    float x = i * 300;
    cars[index] = new Car(x, height - grid * 2, grid * 2, grid, 2);
    index++;
  }

  for (int i = 0; i < 2; i++) { 
    float x = i * 350 ;
    cars[index] = new Car(x, height - grid * 3, grid, grid, -2.5);
    index++;
  }

  for (int i = 0; i < 4; i++) { 
    float x = i * 175 ;
    cars[index] = new Car(x, height - grid * 4, grid, grid, 1);
    index++;
  }
  index = 0;
  logs = new Log[7];

  for (int i = 0; i < 2; i++) { 
    float x = i * 250 ;
    logs[index] = new Log(x, height - grid * 6, grid * 3, grid, 1.5);
    index++;
  }

  for (int i = 0; i < 3; i++) { 
    float x = i * 230 ;
    logs[index] = new Log(x, height - grid * 7, grid * 2, grid, -1.2);
    index++;
  }
  for (int i = 0; i < 2; i++) { 
    float x = i * 400 ;
    logs[index] = new Log(x, height - grid * 8, grid * 4, grid, .6);
    index++;
  }
}

void draw() {

  background(20);
  fill(2,245,239,200);
  rect(0,grid*2,width,grid *3);
  fill(210, 150);
  rect(0, 0, width, grid*2);
  rect(0, height-grid, width, grid);
  rect(0, height-grid*5, width, grid);

  for (Car car : cars) {
    car.show();
    car.update();
    if ( frog.intersects(car)) {
      // println("Game over");
      resetGame();
    }
  }

  for (Log log : logs) {
    log.show();
    log.update();
  }
  boolean ok = false;
  if (frog.y < height -grid*5 && frog.y > grid * 1.8 ) {
    for (Log log : logs) {
      if (frog.intersects(log)) {
        ok = true;
        frog.attach(log);
      }
    }
    if (!ok) { 
      resetGame();
    }
  } else { 
    frog.detach();
  }

  frog.update();
  frog.show();
}

void keyPressed() {

  if (keyCode == UP) {
    frog.move(0, -1);
  } else if (keyCode == DOWN) {
    frog.move(0, 1);
  } else if (keyCode == RIGHT) {
    frog.move(1, 0);
  } else if (keyCode == LEFT) {
    frog.move( -1, 0);
  }
}
