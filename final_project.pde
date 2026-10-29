/*
Excel Ojembe
 Final Processing Project
 TO DO: Make a game that is similar to cookie clicker
 */

// Image from https://static.wikia.nocookie.net/cookieclicker/images/5/5a/PerfectCookie.png/revision/latest?cb=20130827014912
PImage cookie;
int score = 0;
boolean inMenu = true;
boolean inGame = false;
int circleX = 175;
int circleY = 345;
int circleRadius = 130;

void setup() {
  size(800, 600);
  cookie = loadImage("cookieImage.png");
}

void draw() {
  if (inMenu) {
    background(0, 200, 255);

    fill(0, 0, 0);
    textSize(60);
    text("COOKIE   CLICKER", 190, 200);

    fill(0, 170, 0);
    rect(330, 370, 130, 50, 15);
    fill(255, 255, 255);
    textSize(30);
    text("START", 357, 407);
  } else if (inGame) {
    background(168, 124, 52);

    fill(0, 0, 0);
    circle(circleX, circleY, circleRadius);
    image(cookie, 50, 220, 250, 250);

    textSize(25);
    text("Cookies: " + score, 50, 100);
  }
}

void mousePressed() {
  int minX = 330;
  int maxX = minX + 130;
  int minY = 370;
  int maxY = minY + 50;
  if (inMenu && mouseX >= minX && mouseX <= maxX && mouseY >= minY && mouseY <= maxY) {
    inMenu = false;
    inGame = true;
    
  } else if (inGame && dist(circleX, circleY, mouseX, mouseY) <= circleRadius) {
    score++;
  }
}
