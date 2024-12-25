void UFS() {
  
  // 3 to 4
  UpperFrontLegSetupUF();
  // 4 to 5
  UpperRareLegSetupUF();
  
}

void UF() {
  
  UpperFrontLegUF();
  
  UpperRareLegUF();
  
}






// From Time 0 to 1

// Calculate rotation parameters for image Upper FRONT LEG

float poXUF = 200, poYUF = 300; // Current position of the image
PImage img3UF;

float centerXUF, centerYUF; // Center of the circle
float radiusUF; // Radius of the circle
float rotationAngleUF = 0; // Initialize rotation angle
float targetRotationUF = radians(45); // Target rotation angle (90 degrees)
float rotationTimeUF = 8; // Time in seconds to complete the rotation
float rotationSpeedUF = targetRotationUF / rotationTimeUF; // Rotation speed in radians per second
float currentRotationUF = radians(225);

void UpperFrontLegSetupUF() {
  img3UF = loadImage("UFL.png"); // Load the image
  img3UF.resize(100, 25); // Resize img3 to 100 pixels width and 5 pixels height
  
  // Calculate center position of the circle
  centerXUF = 200 + 100/sqrt(2);
  centerYUF = 350 + 100/sqrt(2);
  radiusUF = 100 ; // Calculate radius of the circle
  
  rotationSpeedUF = targetRotationUF / frameRate; // Calculate rotation speed
}

void UpperFrontLegUF() {
  // Calculate elapsed time since the sketch started
  long elapsedTimeUF = millis() - startTime;

  // Display elapsed time in seconds
  float elapsedTimeInSecondsUF = elapsedTimeUF / 1000.0; // Convert milliseconds to seconds

  // Calculate new position based on rotation
  float newXUF = centerXUF + (radiusUF * cos(currentRotationUF));
  float newYUF = centerYUF + (radiusUF * sin(currentRotationUF));
  
  // Update center and rotation
  centerXUF = 200 + 100/sqrt(2) + 100*sqrt(2) * floor(elapsedTimeInSecondsUF/3);
  if (currentRotationUF >= radians(225 + 45)) {
    currentRotationUF -= radians(45);
  }

  // Calculate rotation direction based on elapsed time
  if (floor(elapsedTimeInSecondsUF) % 6 == 3) {
    currentRotationUF += rotationSpeedUF; // Rotate clockwise

    // Draw img3UF at the new position and rotation
    pushMatrix();
    translate(newXUF, newYUF); // Translate to the new position
    rotate(radians(90)); // Rotate by the current rotation angle
    imageMode(CENTER);
    image(img3UF, 0, 0); // Draw img3UF at the translated position with no rotation
    popMatrix();
  
  }
}

// Time from 1 to 2

// Calculate rotation parameters for image Upper Rare LEG

PImage img6UF;

float centerXURUF, centerYURUF; // Center of the circle
float radiusURUF; // Radius of the circle
float rotationAngleURUF = 0; // Initialize rotation angle
float targetRotationURUF = radians(45); // Target rotation angle (90 degrees)
float rotationTimeURUF = 8; // Time in seconds to complete the rotation
float rotationSpeedURUF = targetRotationURUF / rotationTimeURUF; // Rotation speed in radians per second
float currentRotationURUF = radians(90);

void UpperRareLegSetupUF() {
  img6UF = loadImage("UFL.png"); // Load the image
  img6UF.resize(100, 25); // Resize img6UF to 100 pixels width and 5 pixels height
  
  // Calculate center position of the circle
  centerXURUF = 200 + 100/sqrt(2);
  centerYURUF = 200 + 100/sqrt(2);
  radiusURUF = 50; // Calculate radius of the circle
  
  rotationSpeedURUF = targetRotationURUF / frameRate; // Calculate rotation speed
}

void UpperRareLegUF() {
  // Calculate elapsed time since the sketch started
  long elapsedTimeURUF = millis() - startTime;

  // Display elapsed time in seconds
  float elapsedTimeInSecondsURUF = elapsedTimeURUF / 1000.0; // Convert milliseconds to seconds

  // Calculate new position based on rotation
  float newXURUF = centerXURUF + (radiusURUF * cos(currentRotationURUF));
  float newYURUF = centerYURUF + (radiusURUF * sin(currentRotationURUF));

  // Update center and rotation
  centerXURUF = 200 + 100/sqrt(2) + 100*sqrt(2) * floor(elapsedTimeInSecondsURUF/3);
  if (currentRotationURUF <= radians(90 - 45)) {
    currentRotationURUF += radians(45);
  }

  // Calculate rotation direction based on elapsed time
  if (floor(elapsedTimeInSecondsURUF) % 6 == 4) {
    currentRotationURUF -= rotationSpeedURUF; // Rotate clockwise

    // Draw img6UF at the new position and rotation
    pushMatrix();
    translate(newXURUF, newYURUF); // Translate to the new position
    rotate(currentRotationURUF); // Rotate by the current rotation angle
    imageMode(CENTER);
    image(img6UF, 0, 0); // Draw img6UF at the translated position with no rotation
    popMatrix();
  
  } 
}
