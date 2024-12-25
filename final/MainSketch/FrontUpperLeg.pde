void FCS() {
  
  UpperFrontLegSetup();
  
  Leg9Setup();
  
}

void FC() {
  
  UpperFrontLeg();
  
  Leg9();

}





// FROM TIME 0 to 1 second moving and 1 to 2 second freezed

// Calculate rotation parameters for image Upper Front LEG
PImage img2;
float centerXFL, centerYFL; // Center of the circle
float radiusFL; // Radius of the circle
float rotationAngleFL = 0; // Initialize rotation angle
float targetRotationFL = radians(45); // Target rotation angle (90 degrees)
float rotationTimeFL = 1; // Time in seconds to complete the rotation
float rotationSpeedFL = targetRotationFL / rotationTimeFL; // Rotation speed in radians per second
float currentRotationFL = radians(180 + 45);

void UpperFrontLegSetup() {
  // Parameters of img2 UPPER FRONT LEG
  img2 = loadImage("UFL.png"); // Load the third image
  img2.resize(100, 25); // Resize img3 to 100 pixels width and 5 pixels height
  
  // Calculate center position of the circle
  centerXFL = 200 + 100 / sqrt(2);
  centerYFL = 300 + 100 / sqrt(2);
  radiusFL = 50; // Calculate radius of the circle
  
  rotationSpeedi1 = targetRotationi1 / frameRate; // Calculate rotation speed
  
    // Initial position of the image
  posX = 200;
  posY = 200;
  
  // Calculate rotation speed based on target rotation and frame rate
  float frameRate = 60; // Assuming frame rate of 60 frames per second
  //rotationspeed = targetRotation / frameRate; // Calculate rotation speed
  
}

// UpperFrontLegSetup function remains the same...

void UpperFrontLeg() {
  // Calculate elapsed time since the sketch started
  long elapsedTime = millis() - startTime;
  float elapsedTimeInSeconds = elapsedTime / 1000.0; // Convert milliseconds to seconds
  
  // Calculate rotation speed based on target rotation and frame rate
  float frameRate = 60; // Assuming frame rate of 60 frames per second
  float rotationSpeedFL = targetRotationFL / rotationTimeFL / frameRate; // Rotation speed in radians per frame
  
  // Calculate new position based on rotation
  float newX = centerXFL + (radiusFL * cos(currentRotationFL));
  float newY = centerYFL + (radiusFL * sin(currentRotationFL));
  
  // Your function code here
  centerXFL = 200 + 100 / sqrt(2) + 100 * sqrt(2) * floor(elapsedTimeInSeconds / 3);
  if (currentRotationFL >= radians(225 + 45)) {
    currentRotationFL -= radians(45);
  }
  
  // Calculate rotation direction based on elapsed time
  if (floor(elapsedTimeInSeconds) % 6 < 1) {
    currentRotationFL += rotationSpeedFL; // Rotate clockwise
    
    // Draw img2 at the new position and rotation
    pushMatrix();
    translate(newX, newY); // Translate to the new position
    rotate(currentRotationFL); // Rotate by the current rotation angle
    imageMode(CENTER);
    image(img2, 0, 0); // Draw img2 at the translated position with no rotation
    popMatrix();
    
  } else if (floor(elapsedTimeInSeconds) % 6 == 1) {// || floor(elapsedTimeInSeconds) % 6 == 4) {
    // Draw img2 at the new position and rotation
    pushMatrix();
    translate(newX, newY); // Translate to the new position
    //rotate(currentRotationFL); // Rotate by the current rotation angle
    rotate(3.14/2);
    imageMode(CENTER);
    image(img2, 0, 0); // Draw img2 at the translated position with no rotation
    popMatrix();
  }
}



// Time 2 to 3 seconds

PImage img9;
float center9X, center9Y;
float radius9;
float targetRotation9 = radians(45);
float rotationTime9 = 8;
float rotationSpeed9;
float currentRotation9 = radians(270);

void Leg9Setup() {
  img9 = loadImage("UFL.png"); // Load the third image
  img9.resize(100, 25); // Resize img3 to 100 pixels width and 5 pixels height
  
  center9X = 200 + 100 / sqrt(2);
  center9Y = 400 - 50 + 100 / sqrt(2);
  radius9 = 100;
  
  rotationSpeed9 = targetRotation9 / frameRate;
}

void Leg9() {
  long elapsedTime = millis() - startTime;
  float elapsedTimeInSeconds = elapsedTime / 1000.0;

  float newX = center9X + (radius9 * cos(currentRotation9));
  float newY = center9Y + (radius9 * sin(currentRotation9));
  
  center9X = 200 + 100 / sqrt(2) + 100 * sqrt(2) * floor(elapsedTimeInSeconds / 3);
  if (currentRotation9 >= radians(270 + 45)) {
    currentRotation9 -= radians(45);
  }
  
  if (floor(elapsedTimeInSeconds) % 6 == 2) {
    currentRotation9 += rotationSpeed9;
    
    pushMatrix();
    translate(newX, newY);
    rotate(radians(90));
    imageMode(CENTER);
    image(img9, 0, 0);
    popMatrix();
  
  }
}
