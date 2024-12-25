
void RLS () {
  
  //from 0 to 1
  LowRareLegSetup();
  
  //
  LowBackLegSetup();
  
}

void RL() {
  
  LowRareLeg();
  
  LowBackLeg();
  
}



// Time from 0 to 1


PImage img4;

float a = 0, b = 0; // Horizontal position
float moveSpeedx = 0;//270.71;
float moveSpeedy = 70.71;// Speed of movement
float posX, posY; // Current position of the image

float centerXLR, centerYLR; // Center of the circle
float radiusLR; // Radius of the circle
float rotationAngleLR = 0; // Initialize rotation angle
float targetRotationLR = radians(45); // Target rotation angle (90 degrees)
float rotationTimeLR = 1; // Time in seconds to complete the rotation
float rotationSpeedLR = targetRotationLR / rotationTimeLR; // Rotation speed in radians per second
float currentRotationLR = radians(225);

void LowRareLegSetup() {
  img4 = loadImage("LRL.png"); // Load the third image
  img4.resize(146, 25); // Resize img3 to 100 pixels width and 5 pixels height
  
  // Calculate center position of the circle
  centerXLR = 200 + 50/sqrt(2);
  centerYLR = 400 + 150/sqrt(2);
  radiusLR = 100 ; // Calculate radius of the circle
  
  rotationSpeedi1 = targetRotationi1 / frameRate; // Calculate rotation speed
  
}

void LowRareLeg() {
  // Calculate elapsed time since the sketch started
  long elapsedTime = millis() - startTime;
  float elapsedTimeInSeconds = elapsedTime / 1000.0; // Convert milliseconds to seconds
  
  // Calculate rotation speed based on target rotation and frame rate
  float frameRate = 60; // Assuming frame rate of 60 frames per second
  float rotationSpeedLR = targetRotationLR / rotationTimeLR / frameRate; // Rotation speed in radians per frame
  
  
  // Calculate new position based on rotation
  float newX = centerXLR + (radiusLR * cos(currentRotationLR));
  float newY = centerYLR + (radiusLR * sin(currentRotationLR));
  
  // Your function code here
  centerXLR = 200 + 50/sqrt(2) + 100*sqrt(2) * floor(elapsedTimeInSeconds/3);
  if(currentRotationLR >= radians(225 + 45)){
    currentRotationLR -= radians(45);
  }
  
  // Calculate rotation direction based on elapsed time
  if (floor(elapsedTimeInSeconds) % 6 == 0) {
    currentRotationLR += rotationSpeedLR; // Rotate clockwise
    
    // Draw img2 at the new position and rotation
  pushMatrix();
  translate(newX, newY); // Translate to the new position
  rotate(radians(-45)); // Rotate by the current rotation angle
  imageMode(CENTER);
  image(img4, 0, 0); // Draw img2 at the translated position with no rotation
  popMatrix();
    
  } 

  
  
  
  
  
}







// Time from 1 to 2 seconds


// Calculate rotation parameters for immage Upper BACK LEG


//float poX = 200, poY = 300; // Current position of the image
PImage img7;



float centerXLB, centerYLB; // Center of the circle
float radiusLB; // Radius of the circle
float rotationAngleLB = 0; // Initialize rotation angle
float targetRotationLB = radians(45); // Target rotation angle (90 degrees)
float rotationTimeLB = 8; // Time in seconds to complete the rotation
float rotationSpeedLB = targetRotationLB / rotationTimeLB; // Rotation speed in radians per second
float currentRotationLB = radians(90);




void LowBackLegSetup() {
  img7 = loadImage("LRL.png"); // Load the third image
  img7.resize(146, 25); // Resize img3 to 100 pixels width and 5 pixels height
  
  // Calculate center position of the circle
  centerXLB = 200 + 100/sqrt(2);
  centerYLB = 200 + 100/sqrt(2);
  radiusLB = 100 ; // Calculate radius of the circle
  
  rotationSpeedLB = targetRotationLB / frameRate; // Calculate rotation speed
}

void LowBackLeg() {
  
  
  //int currentTime = second();
    // Calculate elapsed time since the sketch started
  long elapsedTime = millis() - startTime;

  // Display elapsed time in seconds
  float elapsedTimeInSeconds = elapsedTime / 1000.0; // Convert milliseconds to seconds
  
  // Print elapsed time
  //println("Elapsed Time: " + elapsedTimeInSeconds + " seconds");
  
  
  // Calculate new position based on rotation
  float newX = centerXLB + (radiusLB * cos(currentRotationLB));
  float newY = centerYLB + (radiusLB * sin(currentRotationLB));
  
  
  // Your function code here
  centerXLB = 200 + 100/sqrt(2) + 100*sqrt(2) * floor(elapsedTimeInSeconds/3);
  if(currentRotationLB <= radians(90 - 45)){
    currentRotationLB += radians(45);
  }
  
  
  
  // Calculate rotation direction based on elapsed time
  if (floor(elapsedTimeInSeconds) % 6 == 1) {
    currentRotationLB -= rotationSpeedLB; // Rotate clockwise
    // Draw img2 at the new position and rotation
  pushMatrix();
  translate(newX, newY); // Translate to the new position
  rotate(currentRotationLB + radians(45)); // Rotate by the current rotation angle
  imageMode(CORNER);
  image(img7, 0, 0); // Draw img2 at the translated position with no rotation
  popMatrix();
  
  } 

  

  
  
}
