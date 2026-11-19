/*
 Excel Ojembe
 Final Processing Project
 TO DO: Make a cookie clicker game
 */

// Image from https://static.wikia.nocookie.net/cookieclicker/images/5/5a/PerfectCookie.png/revision/latest?cb=20130827014912
PImage cookie;
PFont boldFont;
float cookies = 0;
int highScore = 0;
int startTime = 0;
float cookiesPerSecond = 0;
int cursorUpgradeCost = 15;
int grandmaUpgradeCost = 100;
int farmUpgradeCost = 500;
int factoryUpgradeCost = 1000;
int clickUpgradeCost = 2000;
int townUpgradeCost = 2500;
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

  File f = new File(dataPath("highscore.json"));
  if (f.exists()) {
    JSONObject obj = loadJSONObject ("highscore.json");
    highScore = obj.getInt("score");
  }
}

void savedHighScore() {
 JSONObject obj = new JSONObject();
 obj.setInt("score", highScore);
 saveJSONObject(obj, "data/highscore.json");
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

    text("Highest cookie amount: " + highScore, 485, 85);

    textSize(25);
    text("Cookies: " + int(cookies), 50, 100);
    textSize(20);
    text("Cookies per click: " + clickValue, 70, 500);
    text("Cookies per second: " + nf(cookiesPerSecond, 0, 1), 70, 530);

    fill(200, 200, 200);
    rect(470, 100, 500, 700, 15);

    fill(200, 0, 0);
    rect(480, 163, 130, 35, 10);
    fill(0, 0, 0);
    textSize(20);
    text("Cursor (+0.1 cookies per second)", 480, 130);
    fill(0, 0, 0);
    textSize(20);
    text("COST: " + cursorUpgradeCost + " cookies", 480, 155);
    fill(255, 255, 255);
    text("LOCKED", 493, 188);

    fill(200, 0, 0);
    rect(480, 260, 130, 35, 10);
    fill(0, 0, 0);
    textSize(20);
    text("Grandma (+1 cookies per second)", 480, 225);
    fill(0, 0, 0);
    textSize(20);
    text("COST: " + grandmaUpgradeCost + " cookies", 480, 250);
    fill(255, 255, 255);
    text("LOCKED", 493, 285);

    fill(200, 0, 0);
    rect(480, 350, 130, 35, 10);
    fill(0, 0, 0);
    textSize(20);
    text("Farm (+3 cookies per second)", 480, 319);
    fill(0, 0, 0);
    textSize(20);
    text("COST: " + farmUpgradeCost + " cookies", 480, 342);
    fill(255, 255, 255);
    text("LOCKED", 493, 375);

    fill(200, 0, 0);
    rect(480, 440, 130, 35, 10);
    fill(0, 0, 0);
    textSize(20);
    text("Factory (+10 cookies per second)", 480, 409);
    fill(0, 0, 0);
    textSize(20);
    text("COST: " + factoryUpgradeCost + " cookies", 480, 432);
    fill(255, 255, 255);
    text("LOCKED", 493, 465);

    fill(200, 0, 0);
    rect(480, 530, 130, 35, 10);
    fill(0, 0, 0);
    textSize(20);
    text("Click upgrade (+1 cookie per click)", 480, 499);
    fill(0, 0, 0);
    textSize(20);
    text("COST: " + clickUpgradeCost + " cookies", 480, 522);
    fill(255, 255, 255);
    text("LOCKED", 493, 555);

    fill(200, 0, 0);
    rect(480, 620, 130, 35, 10);
    fill(0, 0, 0);
    textSize(20);
    text("Town (+15 cookies per second)", 480, 589);
    fill(0, 0, 0);
    textSize(20);
    text("COST: " + townUpgradeCost + " cookies", 480, 612);
    fill(255, 255, 255);
    text("LOCKED", 493, 645);
  }

  if (inGame && cookies >= cursorUpgradeCost) {
    fill(0, 200, 0);
    rect(480, 163, 130, 35, 10);
    fill(0, 0, 0);
    textSize(20);
    text("Cursor (+0.1 cookies per second)", 480, 130);
    fill(0, 0, 0);
    textSize(20);
    text("COST: " + cursorUpgradeCost + " cookies", 480, 155);
    fill(255, 255, 255);
    text("BUY", 493, 188);
  }
  if (inGame && cookies >= grandmaUpgradeCost) {
    fill(0, 200, 0);
    rect(480, 260, 130, 35, 10);
    fill(0, 0, 0);
    textSize(20);
    text("Grandma (+1 cookies per second)", 480, 225);
    fill(0, 0, 0);
    textSize(20);
    text("COST: " + grandmaUpgradeCost + " cookies", 480, 250);
    fill(255, 255, 255);
    text("BUY", 493, 285);
  }
  if (inGame && cookies >= farmUpgradeCost) {
    fill(0, 200, 0);
    rect(480, 350, 130, 35, 10);
    fill(0, 0, 0);
    textSize(20);
    text("Farm (+3 cookies per second)", 480, 319);
    fill(0, 0, 0);
    textSize(20);
    text("COST: " + farmUpgradeCost + " cookies", 480, 342);
    fill(255, 255, 255);
    text("BUY", 493, 375);
  }
  if (inGame && cookies >= factoryUpgradeCost) {
    fill(0, 200, 0);
    rect(480, 440, 130, 35, 10);
    fill(0, 0, 0);
    textSize(20);
    text("Factory (+10 cookies per second)", 480, 409);
    fill(0, 0, 0);
    textSize(20);
    text("COST: " + factoryUpgradeCost + " cookies", 480, 432);
    fill(255, 255, 255);
    text("BUY", 493, 465);
  }
  if (inGame && cookies >= clickUpgradeCost) {
    fill(0, 200, 0);
    rect(480, 530, 130, 35, 10);
    fill(0, 0, 0);
    textSize(20);
    text("Click upgrade (+1 cookie per click)", 480, 499);
    fill(0, 0, 0);
    textSize(20);
    text("COST: " + clickUpgradeCost + " cookies", 480, 522);
    fill(255, 255, 255);
    text("BUY", 493, 555);
  }
  if (inGame && cookies >= townUpgradeCost) {
    fill(0, 200, 0);
    rect(480, 620, 130, 35, 10);
    fill(0, 0, 0);
    textSize(20);
    text("Town (+15 cookies per second)", 480, 589);
    fill(0, 0, 0);
    textSize(20);
    text("COST: " + townUpgradeCost + " cookies", 480, 612);
    fill(255, 255, 255);
    text("BUY", 493, 645);
  }
  // Automatically generate cookies every second
  if (millis() - startTime >= 1000) {
    cookies += cookiesPerSecond;
    startTime = millis();
    
    if(cookies > highScore) {
      highScore = int(cookies);
      savedHighScore();
    }
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
  } else if (inGame && cookies >= cursorUpgradeCost && mouseX >= 480 && mouseX <= 610 && mouseY >= 163 && mouseY <= 198) {
    cookies = cookies - cursorUpgradeCost;
    cookiesPerSecond = cookiesPerSecond + 0.10;
    cursorUpgradeCost *= 1.15;
  } else if (inGame && cookies >= grandmaUpgradeCost && mouseX >= 480 && mouseX <= 610 && mouseY >= 260 && mouseY <= 295) {
    cookies = cookies - grandmaUpgradeCost;
    cookiesPerSecond = cookiesPerSecond + 1;
    grandmaUpgradeCost *= 1.15;
  } else if (inGame && cookies >= farmUpgradeCost && mouseX >= 480 && mouseX <= 610 && mouseY >= 350 && mouseY <= 385) {
    cookies = cookies - farmUpgradeCost;
    cookiesPerSecond = cookiesPerSecond + 3;
    farmUpgradeCost *= 1.15;
  } else if (inGame && cookies >= factoryUpgradeCost && mouseX >= 480 && mouseX <= 610 && mouseY >= 440 && mouseY <= 475) {
    cookies = cookies - factoryUpgradeCost;
    cookiesPerSecond = cookiesPerSecond + 10;
    factoryUpgradeCost *= 1.15;
  } else if (inGame && cookies >= clickUpgradeCost && mouseX >= 480 && mouseX <= 610 && mouseY >= 530 && mouseY <= 585) {
    cookies = cookies - clickUpgradeCost;
    clickValue = clickValue + 1;
    clickUpgradeCost *= 1.15;
  } else if (inGame && cookies >= townUpgradeCost && mouseX >= 480 && mouseX <= 610 && mouseY >= 620 && mouseY <= 655) {
    cookies = cookies - townUpgradeCost;
    cookiesPerSecond = cookiesPerSecond + 15;
    townUpgradeCost *= 1.15;
  }
}
