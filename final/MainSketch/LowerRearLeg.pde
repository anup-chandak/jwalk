void LRS() {
  
  // 3 to 4
  LowRareLegSetupLF();
  
  // 4 to 5
  LowBackLegSetupLF();

}

void LR() {
  
  LowRareLegLF();
  
  LowBackLegLF();
  
}




// Time from 0 to 1

PImage img4LF;

float aLF = 0, bLF = 0; // Horizontal position
float moveSpeedxLF = 0; // Speed of movement
float moveSpeedyLF = 70.71;
float posXLF, posYLF; // Current position of the image

float centerXLRLF, centerYLRLF; // Center of the circle
float radiusLRLF; // Radius of the circle
float rotationAngleLRLF = 0; // Initialize rotation angle
float targetRotationLRLF = radians(45); // Target rotation angle (90 degrees)
float rotationTimeLRLF = 1; // Time in seconds to complete the rotation
float rotationSpeedLRLF = targetRotationLRLF / rotationTimeLRLF; // Rotation speed in radians per second
float currentRotationLRLF = radians(225);

void LowRareLegSetupLF() {
  img4LF = loadImage("LRL.png"); // Load the third image
  img4LF.resize(146, 25); // Resize img3 to 100 pixels width and 5 pixels height
  
  // Calculate center position of the circle
  centerXLRLF = 200 + 50 / sqrt(2);
  centerYLRLF = 400 + 150 / sqrt(2);
  radiusLRLF = 100; // Calculate radius of the circle
  
  rotationSpeedLRLF = targetRotationLRLF / frameRate; // Calculate rotation speed
}

void LowRareLegLF() {
  // Calculate elapsed time since the sketch started
  long elapsedTimeLF = millis() - startTime;
  float elapsedTimeInSecondsLF = elapsedTimeLF / 1000.0; // Convert milliseconds to seconds
  
  // Calculate rotation speed based on target rotation and frame rate
  float frameRateLF = 60; // Assuming frame rate of 60 frames per second
  float rotationSpeedLRLF = targetRotationLRLF / rotationTimeLRLF / frameRateLF; // Rotation speed in radians per frame
  
  // Calculate new position based on rotation
  float newXLF = centerXLRLF + (radiusLRLF * cos(currentRotationLRLF));
  float newYLF = centerYLRLF + (radiusLRLF * sin(currentRotationLRLF));
  
  // Your function code here
  centerXLRLF = 200 + 50 / sqrt(2) + 100 * sqrt(2) * floor(elapsedTimeInSecondsLF / 3);
  if (currentRotationLRLF >= radians(225 + 45)) {
    currentRotationLRLF -= radians(45);
  }
  
  // Calculate rotation direction based on elapsed time
  if (floor(elapsedTimeInSecondsLF) % 6 == 3) {
    currentRotationLRLF += rotationSpeedLRLF; // Rotate clockwise
    
    // Draw img4LF at the new position and rotation
    pushMatrix();
    translate(newXLF, newYLF); // Translate to the new position
    rotate(radians(-45)); // Rotate by the current rotation angle
    imageMode(CENTER);
    image(img4LF, 0, 0); // Draw img4LF at the translated position
    popMatrix();
    
  } else if (floor(elapsedTimeInSecondsLF) % 6 == 35) {
    currentRotationLRLF -= rotationSpeedLRLF; // Rotate counterclockwise
    
    // Draw img4LF at the new position and rotation
    pushMatrix();
    translate(newXLF, newYLF); // Translate to the new position
    rotate(radians(-45)); // Rotate by the current rotation angle
    imageMode(CENTER);
    image(img4LF, 0, 0); // Draw img4LF at the translated position
    popMatrix();
    
  } 
}

// Time from 1 to 2 seconds

// Calculate rotation parameters for image Upper BACK LEG

PImage img7LF;

float centerXLBLF, centerYLBLF; // Center of the circle
float radiusLBLF; // Radius of the circle
float rotationAngleLBLF = 0; // Initialize rotation angle
float targetRotationLBLF = radians(45); // Target rotation angle (90 degrees)
float rotationTimeLBLF = 8; // Time in seconds to complete the rotation
float rotationSpeedLBLF = targetRotationLBLF / rotationTimeLBLF; // Rotation speed in radians per second
float currentRotationLBLF = radians(90);

void LowBackLegSetupLF() {
  img7LF = loadImage("LRL.png"); // Load the third image
  img7LF.resize(146, 25); // Resize img3 to 100 pixels width and 5 pixels height
  
  // Calculate center position of the circle
  centerXLBLF = 200 + 100 / sqrt(2);
  centerYLBLF = 200 + 100 / sqrt(2);
  radiusLBLF = 100; // Calculate radius of the circle
  
  rotationSpeedLBLF = targetRotationLBLF / frameRate; // Calculate rotation speed
}

void LowBackLegLF() {
  // Calculate elapsed time since the sketch started
  long elapsedTimeLF = millis() - startTime;
  float elapsedTimeInSecondsLF = elapsedTimeLF / 1000.0; // Convert milliseconds to seconds
  
  // Calculate new position based on rotation
  float newXLF = centerXLBLF + (radiusLBLF * cos(currentRotationLBLF));
  float newYLF = centerYLBLF + (radiusLBLF * sin(currentRotationLBLF));
  
  // Your function code here
  centerXLBLF = 200 + 100 / sqrt(2) + 100 * sqrt(2) * floor(elapsedTimeInSecondsLF / 3);
  if (currentRotationLBLF <= radians(90 - 45)) {
    currentRotationLBLF += radians(45);
  }
  
  // Calculate rotation direction based on elapsed time
  if (floor(elapsedTimeInSecondsLF) % 6 == 4) {
    currentRotationLBLF -= rotationSpeedLBLF; // Rotate clockwise
    
    // Draw img7LF at the new position and rotation
    pushMatrix();
    translate(newXLF, newYLF); // Translate to the new position
    rotate(currentRotationLBLF + radians(45)); // Rotate by the current rotation angle
    imageMode(CORNER);
    image(img7LF, 0, 0); // Draw img7LF at the translated position
    popMatrix();
    
  }
}
