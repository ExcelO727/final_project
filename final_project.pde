/*
Excel Ojembe
 Final Processing Project
 TO DO: Make a cookie clicker like game with custom upgrades
 */

PImage cookie;
int score = 0;
boolean inMenu = true;

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
  }
}

void mousePressed() {
  if (mouseX >= 330 && mouseY <= 500) {
    inMenu = false;
    background(168, 124, 52);

    circle(175, 342, 240);
    image(cookie, 50, 220, 250, 250);

    fill(0, 0, 0);

    textSize(25);
    text("Cookies: " + score, 50, 100);
  }
}
