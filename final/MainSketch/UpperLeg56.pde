// Calculate rotation parameters for image Rear upper and lower LEG for sec 5 to 6

PImage imgUF;
PImage imgFL;

PImage img56;


float centerX156, centerY156; // Center of the circle
float centerX256, centerY256; // Center of the circle

float radius56; // Radius of the circle
float r56;

float rotationAngle56 = 0; // Initialize rotation angle
float targetRotation56 = radians(45); // Target rotation angle (90 degrees)
float rotationTime56 = 1; // Time in seconds to complete the rotation
float rotationSpeed56 = targetRotation56 / rotationTime56; // Rotation speed in radians per second
float currentRotation56 = radians(270);
float currentrotation56 = radians(270);

void LegSetup56() {
  // parameters of img 2     UPPER FRONT LEG
  img56 = loadImage("line.png"); // Load the second image
  img56.resize(100, 5); // Resize img2 to 100 pixels width and 5 pixels height
  
  imgFL = loadImage("LFL.png"); // Load the third image
  imgFL.resize(100, 25);
  
  imgUF = loadImage("UFL.png"); // Load the third image
  imgUF.resize(100, 25);
  
  // Calculate center position of the circle
  centerX156 = 200 + 75 * sqrt(2);
  centerY156 = 300 + 75 * sqrt(2);
  radius56 = 100; // Calculate radius of the circle
  
  centerX256 = 200 + 100 * sqrt(2);
  centerY256 = 350 + 100 * sqrt(2);
  r56 = 100;
    
  // Calculate rotation speed based on target rotation and frame rate
  rotationSpeed56 = targetRotation56 / frameRate; // Calculate rotation speed
}

void Leg56() {
  // Calculate elapsed time since the sketch started
  long elapsedTime56 = millis() - startTime;
  float elapsedTimeInSeconds56 = elapsedTime56 / 1000.0; // Convert milliseconds to seconds
  
  // Calculate rotation speed based on target rotation and frame rate
  float frameRate56 = 60; // Assuming frame rate of 60 frames per second
  float rotationSpeed56 = targetRotation56 / rotationTime56 / frameRate56; // Rotation speed in radians per frame
  
  // Calculate new position based on rotation
  float newX56 = centerX156 + (radius56 * cos(currentRotation56));
  float newY56 = centerY156 + (radius56 * sin(currentRotation56));
  
  // Calculate new position based on rotation
  float newx56 = centerX256 + (radius56 * cos(currentrotation56));
  float newy56 = centerY256 + (radius56 * sin(currentrotation56));
  
  // Your function code here
  centerX156 = 200 + 75 * sqrt(2) + 100 * sqrt(2) * floor(elapsedTimeInSeconds56 / 3);
  if (currentRotation56 >= radians(270 + 45)) {
    currentRotation56 -= radians(45);
  }
  
  // Your function code here
  centerX256 = 200 + 100 * sqrt(2) + 100 * sqrt(2) * floor(elapsedTimeInSeconds56 / 3);
  if (currentrotation56 >= radians(270 + 45)) {
    currentrotation56 -= radians(45);
  }
  
  if (floor(elapsedTimeInSeconds56) % 6 == 5) {
    currentRotation56 += rotationSpeed56;
    currentrotation56 += rotationSpeed56;
    
    pushMatrix();
    translate(newX56, newY56);
    rotate(radians(45));
    imageMode(CENTER);
    image(imgUF, 0, 0);
    popMatrix();
  
    pushMatrix();
    translate(newx56, newy56);
    rotate(radians(90));
    imageMode(CENTER);
    image(imgFL, 0, 0);
    popMatrix();
  
  }
}
