void RUS() {
 
  //from 0 to 1
  UpperBackLegSetup();
  
  //from 1 to 2
  UpperRareLegSetup();
  
}

void RU(){
  
  UpperBackLeg();
  
  UpperRareLeg();
  
}


// From Time 0 to 1


// Calculate rotation parameters for immage Upper BACK LEG


float poX = 200, poY = 300; // Current position of the image
PImage img3;



float centerXUB, centerYUB; // Center of the circle
float radiusUB; // Radius of the circle
float rotationAngleUB = 0; // Initialize rotation angle
float targetRotationUB = radians(45); // Target rotation angle (90 degrees)
float rotationTimeUB = 8; // Time in seconds to complete the rotation
float rotationSpeedUB = targetRotationUB / rotationTimeUB; // Rotation speed in radians per second
float currentRotationUB = radians(225);




void UpperBackLegSetup() {
  img3 = loadImage("URL.png"); // Load the third image
  img3.resize(100, 25); // Resize img3 to 100 pixels width and 5 pixels height
  
  // Calculate center position of the circle
  centerXUB = 200 + 100/sqrt(2);
  centerYUB = 350 + 100/sqrt(2);
  radiusUB = 100 ; // Calculate radius of the circle
  
  rotationSpeedUB = targetRotationUB / frameRate; // Calculate rotation speed
}

void UpperBackLeg() {
  
  
  //int currentTime = second();
    // Calculate elapsed time since the sketch started
  long elapsedTime = millis() - startTime;

  // Display elapsed time in seconds
  float elapsedTimeInSeconds = elapsedTime / 1000.0; // Convert milliseconds to seconds
  
  // Print elapsed time
  //println("Elapsed Time: " + elapsedTimeInSeconds + " seconds");
  
  
  // Calculate new position based on rotation
  float newX = centerXUB + (radiusUB * cos(currentRotationUB));
  float newY = centerYUB + (radiusUB * sin(currentRotationUB));
  
  // Your function code here
  centerXUB = 200 + 100/sqrt(2) + 100*sqrt(2) * floor(elapsedTimeInSeconds/3);
  if(currentRotationUB >= radians(225 + 45)){
    currentRotationUB -= radians(45);
  }
  
  
  // Calculate rotation direction based on elapsed time
  if (floor(elapsedTimeInSeconds) % 6 == 0) {
    currentRotationUB += rotationSpeedUB; // Rotate clockwise
    // Draw img2 at the new position and rotation
  pushMatrix();
  translate(newX, newY); // Translate to the new position
  rotate(radians(90)); // Rotate by the current rotation angle
  imageMode(CENTER);
  image(img3, 0, 0); // Draw img2 at the translated position with no rotation
  popMatrix();
  
  }
  

  
  
}









//Time from 1 to 2

// Calculate rotation parameters for immage Upper BACK LEG


//float poX = 200, poY = 300; // Current position of the image
PImage img6;



float centerXUR, centerYUR; // Center of the circle
float radiusUR; // Radius of the circle
float rotationAngleUR = 0; // Initialize rotation angle
float targetRotationUR = radians(45); // Target rotation angle (90 degrees)
float rotationTimeUR = 8; // Time in seconds to complete the rotation
float rotationSpeedUR = targetRotationUR / rotationTimeUR; // Rotation speed in radians per second
float currentRotationUR = radians(90);




void UpperRareLegSetup() {
  img6 = loadImage("URL.png"); // Load the third image
  img6.resize(100, 25); // Resize img3 to 100 pixels width and 5 pixels height
  
  // Calculate center position of the circle
  centerXUR = 200 + 100/sqrt(2);
  centerYUR = 200 + 100/sqrt(2);
  radiusUR = 50 ; // Calculate radius of the circle
  
  rotationSpeedUR = targetRotationUR / frameRate; // Calculate rotation speed
}

void UpperRareLeg() {
  
  
  //int currentTime = second();
    // Calculate elapsed time since the sketch started
  long elapsedTime = millis() - startTime;

  // Display elapsed time in seconds
  float elapsedTimeInSeconds = elapsedTime / 1000.0; // Convert milliseconds to seconds
  
  // Print elapsed time
  //println("Elapsed Time: " + elapsedTimeInSeconds + " seconds");
  
  
  // Calculate new position based on rotation
  float newX = centerXUR + (radiusUR * cos(currentRotationUR));
  float newY = centerYUR + (radiusUR * sin(currentRotationUR));
  
  // Your function code here
  centerXUR = 200 + 100/sqrt(2) + 100*sqrt(2) * floor(elapsedTimeInSeconds/3);
  if(currentRotationUR <= radians(90 - 45)){
    currentRotationUR += radians(45);
  }
  
  
  // Calculate rotation direction based on elapsed time
  if (floor(elapsedTimeInSeconds) % 6 == 1) {
    currentRotationUR -= rotationSpeedUR; // Rotate clockwise
    // Draw img2 at the new position and rotation
  pushMatrix();
  translate(newX, newY); // Translate to the new position
  rotate(currentRotationUR); // Rotate by the current rotation angle
  imageMode(CENTER);
  image(img3, 0, 0); // Draw img2 at the translated position with no rotation
  popMatrix();
  
  }
  
}
