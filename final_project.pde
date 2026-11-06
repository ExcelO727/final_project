/*
Excel Ojembe
 Final Processing Project
 TO DO: Make a game that is similar to cookie clicker
 */

// Image from https://static.wikia.nocookie.net/cookieclicker/images/5/5a/PerfectCookie.png/revision/latest?cb=20130827014912
PImage cookie;
PFont boldFont;
double score = 0;
double clickValue = 1;
boolean inMenu = true;
boolean inGame = false;
int circleX = 175;
int circleY = 345;
int circleRadius = 130;

void setup() {
  size(830, 700);
  cookie = loadImage("cookieImage.png");
  boldFont = createFont("Arial Bold", 32);
  textFont(boldFont);
  fill(0);
}

void draw() {
  if (inMenu) {
    background(0, 200, 255);

    fill(0, 0, 0);
    textSize(60);
    text("COOKIE   CLICKER", 155, 200);

    fill(0, 170, 0);
    rect(330, 470, 130, 50, 15);
    fill(255, 255, 255);
    textSize(30);
    text("START", 350, 507);
  } else if (inGame) {
    background(168, 124, 52);

    fill(0, 0, 0);
    circle(circleX, circleY, circleRadius);
    image(cookie, 50, 220, 250, 250);

    textSize(25);
    text("Cookies: " + score, 50, 100);
    textSize(20);
    text("Cookies per click: " + clickValue, 70, 4);

    fill(200, 200, 200);
    rect(470, 100, 500, 700, 15);

    fill(150, 0, 0);
    rect(480, 187, 130, 50, 10);
    fill(0, 0, 0);
    textSize(22);
    text("Cursor (+0.5 cookies per click)", 480, 150);
    fill(0, 0, 0);
    textSize(22);
    text("COST: 10 cookies", 480, 180);
    fill(255, 255, 255);
    text("LOCKED", 493, 220);

    fill(150, 0, 0);
    rect(480, 300, 130, 50, 10);
    fill(0, 0, 0);
    textSize(22);
    text("Grandma (+1 cookies per click)", 480, 270);
    fill(0, 0, 0);
    textSize(22);
    text("COST: 100 cookies", 480, 295);
    fill(255, 255, 255);
    text("LOCKED", 493, 332);
  }

  if (score >= 10) {
    fill(0, 150, 0);
    rect(480, 187, 130, 50, 10);
    fill(0, 0, 0);
    textSize(22);
    text("Cursor (+0.5 cookies per click)", 480, 150);
    fill(0, 0, 0);
    textSize(22);
    text("COST: 10 cookies", 480, 180);
    fill(255, 255, 255);
    text("BUY", 493, 220);
  }
  if (score >= 100) {
    fill(0, 150, 0);
    rect(480, 300, 130, 50, 10);
    fill(0, 0, 0);
    textSize(22);
    text("Grandma (+1 cookies per click)", 480, 270);
    fill(0, 0, 0);
    textSize(22);
    text("COST: 100 cookies", 480, 295);
    fill(255, 255, 255);
    text("BUY", 493, 332);
  }
}


void mousePressed() {
  int minX = 330;
  int maxX = minX + 130;
  int minY = 470;
  int maxY = minY + 50;
  if (inMenu && mouseX >= minX && mouseX <= maxX && mouseY >= minY && mouseY <= maxY) {
    inMenu = false;
    inGame = true;
  } else if (inGame && dist(circleX, circleY, mouseX, mouseY) <= circleRadius) {
    score += clickValue;
  } else if (inGame && score >= 10 && mouseX >= 480 && mouseX <= 610 && mouseY >= 187 && mouseY <= 237) {
    score = score - 10;

    clickValue += 0.5;
  } else if (inGame && score >= 100 && mouseX >= 480 && mouseX <= 610 && mouseY >= 300 && mouseY <= 350) {
    score = score - 100;
    clickValue += 1;
  }
}
