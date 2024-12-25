

void URS () {
  
  // from 3 to 5
  UpperRearLegSetupURC();
  
  // 5 to 6
  Leg9SetupURC();
  
}

void UR() {
  
   UpperRearLegURC();
   
   Leg9URC();
  
}

// FROM TIME 0 to 1 second moving and 1 to 2 second freezed

// Calculate rotation parameters for image Upper Rear LEG
PImage img2URC;
float centerXURC, centerYURC; // Center of the circle
float radiusURC; // Radius of the circle
float rotationAngleURC = 0; // Initialize rotation angle
float targetRotationURC = radians(45); // Target rotation angle (90 degrees)
float rotationTimeURC = 1; // Time in seconds to complete the rotation
float rotationSpeedURC = targetRotationURC / rotationTimeURC; // Rotation speed in radians per second
float currentRotationURC = radians(180 + 45);

void UpperRearLegSetupURC() {
  // Parameters of img2URC UPPER REAR LEG
  img2URC = loadImage("URL.png"); // Load the second image
  img2URC.resize(100, 25); // Resize img2URC to 100 pixels width and 5 pixels height
  
  
  
  
  
  // Calculate center position of the circle
  centerXURC = 200 + 100 / sqrt(2);
  centerYURC = 300 + 100 / sqrt(2);
  radiusURC = 50; // Calculate radius of the circle
  
  rotationSpeedURC = targetRotationURC / frameRate; // Calculate rotation speed
  
    // Initial position of the image
  posX = 200;
  posY = 200;
  
  // Calculate rotation speed based on target rotation and frame rate
  float frameRate = 60; // Assuming frame rate of 60 frames per second
  //rotationspeed = targetRotation / frameRate; // Calculate rotation speed
}

void UpperRearLegURC() {
  // Calculate elapsed time since the sketch started
  long elapsedTimeURC = millis() - startTime;
  float elapsedTimeInSecondsURC = elapsedTimeURC / 1000.0; // Convert milliseconds to seconds
  
  // Calculate new position based on rotation
  float newXURC = centerXURC + (radiusURC * cos(currentRotationURC));
  float newYURC = centerYURC + (radiusURC * sin(currentRotationURC));
  
  // Your function code here
  centerXURC = 200 + 100 / sqrt(2) + 100 * sqrt(2) * floor(elapsedTimeInSecondsURC / 3);
  if (currentRotationURC >= radians(225 + 45)) {
    currentRotationURC -= radians(45);
  }
  
  // Calculate rotation direction based on elapsed time
  if (floor(elapsedTimeInSecondsURC) % 6 == 3) {
    currentRotationURC += rotationSpeedURC; // Rotate clockwise
    
    // Draw img2URC at the new position and rotation
    pushMatrix();
    translate(newXURC, newYURC); // Translate to the new position
    rotate(currentRotationURC); // Rotate by the current rotation angle
    imageMode(CENTER);
    image(img2URC, 0, 0); // Draw img2URC at the translated position with no rotation
    popMatrix();
    
  } else if (floor(elapsedTimeInSecondsURC) % 6 == 4) {
    // Draw img2URC at the new position and rotation
    pushMatrix();
    translate(newXURC + 25, newYURC - 8); // Translate to the new position
    rotate(3.14/2);//currentRotationURC); // Rotate by the current rotation angle
    imageMode(CENTER);
    image(img2URC, 0, 0); // Draw img2URC at the translated position with no rotation
    popMatrix();
  }
}





// Time 5 to 6 seconds

PImage img9URC;
float center9XURC, center9YURC;
float radius9URC;
float targetRotation9URC = radians(45);
float rotationTime9URC = 8;
float rotationSpeed9URC;
float currentRotation9URC = radians(270);

void Leg9SetupURC() {
  img9URC = loadImage("URL.png");
  img9URC.resize(100, 25);
  
  center9XURC = 200 + 100 / sqrt(2);
  center9YURC = 400 - 50 + 100 / sqrt(2);
  radius9URC = 100;
  
  rotationSpeed9URC = targetRotation9URC / frameRate;
}

void Leg9URC() {
  long elapsedTimeURC = millis() - startTime;
  float elapsedTimeInSecondsURC = elapsedTimeURC / 1000.0;

  float newXURC = center9XURC + (radius9URC * cos(currentRotation9URC)) ;
  float newYURC = center9YURC + (radius9URC * sin(currentRotation9URC));
  
  center9XURC = 200 + 100 / sqrt(2) + 100 * sqrt(2) * floor(elapsedTimeInSecondsURC / 3);
  if (currentRotation9URC >= radians(270 + 45)) {
    currentRotation9URC -= radians(45);
  }
  
  if (floor(elapsedTimeInSecondsURC) % 6 == 5) {
    currentRotation9URC += rotationSpeed9URC;
    
    pushMatrix();
    translate(newXURC, newYURC);
    rotate(radians(90));
    imageMode(CENTER);
    image(img9URC, 0, 0);
    popMatrix();
  
  }
}
