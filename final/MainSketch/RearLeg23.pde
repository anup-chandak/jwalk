// Calculate rotation parameters for immage Rear upper and lower LEG for sec 2 to 3


PImage img;
PImage imgRU;
PImage imgRL;
float centerX1, centerY1; // Center of the circle
float centerX2, centerY2; // Center of the circle

float radius; // Radius of the circle
float r;

float rotationAngle = 0; // Initialize rotation angle
float targetRotation = radians(45); // Target rotation angle (90 degrees)
float rotationTime = 1; // Time in seconds to complete the rotation
float rotationSpeed = targetRotation / rotationTime; // Rotation speed in radians per second
float currentRotation = radians(270);
float currentrotation = radians(270);


void LegSetup() {
  //parameters of img 2     UPPER FRONT LEG
  img = loadImage("line.png"); // Load the second image
  img.resize(100, 5); // Resize img2 to 100 pixels width and 5 pixels height
  
  imgRL = loadImage("LRL.png"); // Load the third image
  imgRL.resize(146, 25);
  
  imgRU = loadImage("URL.png"); // Load the third image
  imgRU.resize(100, 25);
  
  // Calculate center position of the circle
  centerX1 = 200 + 75 * sqrt(2);
  centerY1 = 300 + 75 * sqrt(2);
  radius = 100 ; // Calculate radius of the circle
  
  
  
  centerX2 = 200 + 100 * sqrt(2);
  centerY2 = 350 + 100 * sqrt(2);
  r = 100;
  
  
    
  // Calculate rotation speed based on target rotation and frame rate
  rotationSpeed = targetRotation / frameRate; // Calculate rotation speed
}

// UpperFrontLegSetup function remains the same...

void Leg() {
  // Calculate elapsed time since the sketch started
  long elapsedTime = millis() - startTime;
  float elapsedTimeInSeconds = elapsedTime / 1000.0; // Convert milliseconds to seconds
  
  // Calculate rotation speed based on target rotation and frame rate
  float frameRate = 60; // Assuming frame rate of 60 frames per second
  float rotationSpeed = targetRotation / rotationTime / frameRate; // Rotation speed in radians per frame
  
  // Calculate new position based on rotation
  float newX = centerX1 + (radius * cos(currentRotation));
  float newY = centerY1 + (radius * sin(currentRotation));
  
  // Calculate new position based on rotation
  float newx = centerX2 + (radius * cos(currentrotation));
  float newy = centerY2 + (radius * sin(currentrotation));
  
  // Your function code here
  centerX1 = 200 + 75 * sqrt(2) + 100*sqrt(2) * floor(elapsedTimeInSeconds/3);
  if(currentRotation >= radians(270 + 45)){
    currentRotation -= radians(45);
  }
  // Your function code here
  centerX2 = 200 + 100 * sqrt(2) + 100*sqrt(2) * floor(elapsedTimeInSeconds/3);
  if(currentrotation >= radians(270 + 45)){
    currentrotation -= radians(45);
  }
  
  
  
  if (floor(elapsedTimeInSeconds) % 6 == 2) {
    currentRotation += rotationSpeed;
    currentrotation += rotationSpeed;
    
    pushMatrix();
  translate(newX, newY);
  rotate(radians(45));
  imageMode(CENTER);
  image(imgRU, 0, 0);
  popMatrix();
  
  pushMatrix();
  translate(newx, newy);
  rotate(radians(90));
  imageMode(CENTER);
  image(imgRL, 0, 0);
  popMatrix();
  
  } 
}
