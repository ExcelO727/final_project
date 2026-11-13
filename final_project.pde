/*
Excel Ojembe
 Final Processing Project
 TO DO: Make a game that is similar to cookie clicker
 */

// Image from https://static.wikia.nocookie.net/cookieclicker/images/5/5a/PerfectCookie.png/revision/latest?cb=20130827014912
PImage cookie;
PFont boldFont;
float cookies = 0;
int startTime = 0;
float cookiesPerSecond = 0;
int cursorUpgradeCost = 10;
int grandmaUpgradeCost = 100;
int farmUpgradeCost = 500;
int clickValue = 1;
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
  startTime = millis();
}

void draw() {
  if (inMenu) {
    background(0, 200, 255);

    fill(0, 0, 0);
    textSize(60);
    text("COOKIE   CLICKER", 155, 200);

    if (mouseX > 330 && mouseX < 460 && mouseY > 470 && mouseY < 520) {
      fill(0, 150, 0);
      rect(330, 470, 130, 50, 15);
      fill(255, 255, 255);
      triangle(378, 480, 378, 510, 413, 493);
      image(cookie, 194, 153, 50, 50);
      image(cookie, 244, 153, 50, 50);
    } else {
      fill(0, 200, 0);
      rect(330, 470, 130, 50, 15);
      fill(255, 255, 255);
      triangle(378, 480, 378, 510, 413, 493);
      image(cookie, 194, 153, 50, 50);
      image(cookie, 244, 153, 50, 50);
    }
  } else if (inGame) {
    background(168, 124, 52);

    fill(0, 0, 0);
    circle(circleX, circleY, circleRadius);
    image(cookie, 50, 220, 250, 250);

    textSize(25);
    text("Cookies: " + int(cookies), 50, 100);
    textSize(20);
    text("Cookies per click: " + clickValue, 70, 500);
    text("Cookies per second: " + nf(cookiesPerSecond, 0, 1), 70, 530);

    fill(200, 200, 200);
    rect(470, 100, 500, 700, 15);

    fill(200, 0, 0);
    rect(480, 187, 130, 50, 10);
    fill(0, 0, 0);
    textSize(20);
    text("Cursor (+0.1 cookies per second)", 480, 150);
    fill(0, 0, 0);
    textSize(20);
    text("COST: " + cursorUpgradeCost + " cookies", 480, 175);
    fill(255, 255, 255);
    text("LOCKED", 493, 219);

    fill(200, 0, 0);
    rect(480, 300, 130, 50, 10);
    fill(0, 0, 0);
    textSize(20);
    text("Grandma (+1 cookies per second)", 480, 270);
    fill(0, 0, 0);
    textSize(20);
    text("COST: " + grandmaUpgradeCost + " cookies", 480, 295);
    fill(255, 255, 255);
    text("LOCKED", 493, 332);

    fill(200, 0, 0);
    rect(480, 415, 130, 50, 10);
    fill(0, 0, 0);
    textSize(20);
    text("Farm (+3 cookies every second)", 480, 380);
    fill(0, 0, 0);
    textSize(20);
    text("COST: " + farmUpgradeCost + " cookies", 480, 407);
    fill(255, 255, 255);
    text("LOCKED", 493, 445);
  }

  if (inGame && cookies >= cursorUpgradeCost) {
    fill(0, 200, 0);
    rect(480, 187, 130, 50, 10);
    fill(0, 0, 0);
    textSize(20);
    text("Cursor (+0.1 cookies per second)", 480, 150);
    fill(0, 0, 0);
    textSize(20);
    text("COST: " + cursorUpgradeCost + " cookies", 480, 175);
    fill(255, 255, 255);
    text("BUY", 493, 219);
  }
  if (inGame && cookies >= grandmaUpgradeCost) {
    fill(0, 200, 0);
    rect(480, 300, 130, 50, 10);
    fill(0, 0, 0);
    textSize(20);
    text("Grandma (+1 cookies per second)", 480, 270);
    fill(0, 0, 0);
    textSize(20);
    text("COST: " + grandmaUpgradeCost + " cookies", 480, 295);
    fill(255, 255, 255);
    text("BUY", 493, 332);
  }
  if (inGame && cookies >= farmUpgradeCost) {
    fill(0, 200, 0);
    rect(480, 415, 130, 50, 10);
    fill(0, 0, 0);
    textSize(20);
    text("Farm (+3 cookies every second)", 480, 380);
    fill(0, 0, 0);
    textSize(20);
    text("COST: " + farmUpgradeCost + " cookies", 480, 407);
    fill(255, 255, 255);
    text("BUY", 493, 445);
  }
  // Automatically generate cookies every second
  if (millis() - startTime >= 1000) {
    cookies += cookiesPerSecond;
    startTime = millis();
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
    cookies += clickValue;
  } else if (inGame && cookies >= cursorUpgradeCost && mouseX >= 480 && mouseX <= 610 && mouseY >= 187 && mouseY <= 237) {
    cookies = cookies - cursorUpgradeCost;
    cookiesPerSecond = cookiesPerSecond + 0.10;
    cursorUpgradeCost *= 1.2;
  } else if (inGame && cookies >= grandmaUpgradeCost && mouseX >= 480 && mouseX <= 610 && mouseY >= 300 && mouseY <= 350) {
    cookies = cookies - grandmaUpgradeCost;
    cookiesPerSecond = cookiesPerSecond + 0.5;
    grandmaUpgradeCost *= 1.2;
  } else if (inGame && cookies >= farmUpgradeCost && mouseX >= 480 && mouseX <= 610 && mouseY >= 415 && mouseY <= 465) {
    cookies = cookies - farmUpgradeCost;
    cookiesPerSecond = cookiesPerSecond + 3;
    farmUpgradeCost *= 1.2;
  }
}
