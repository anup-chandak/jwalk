PImage front_upper_leg;       // Variable to hold the original image
PImage cropped_front_upper_leg;   // Variable to hold the cropped image
PImage rotated_front_upper_leg;   // Variable to hold the rotated image
PImage finalCrop_front_upper_leg; // Variable to hold the final cropped image after rotation

void UpFrontLegSetup() {
  // Load the original image
  front_upper_leg = loadImage("source.png");  // Load the image
  
  // Step 1: Crop the image
  cropped_front_upper_leg = front_upper_leg.get(230, 90, 55, 130); // Crop the image (x, y, width, height)
  
  cropped_front_upper_leg.save("cropped.jpg");         // Save the cropped image
  
  // Step 2: Calculate the diagonal length
  float diagonal = sqrt(sq(cropped_front_upper_leg.width) + sq(cropped_front_upper_leg.height));
  
  // Step 3: Calculate the angle to rotate (diagonal from top-left to bottom-right becomes vertical)
  float angle = -atan2(cropped_front_upper_leg.width, cropped_front_upper_leg.height) + 3.14 / 18; // Angle in radians
  
  // Step 4: Create a new PGraphics object to draw the rotated image
  PGraphics pg = createGraphics(cropped_front_upper_leg.width, cropped_front_upper_leg.height); // Create with correct dimensions
  
  pg.beginDraw();
  pg.background(255, 0); // Set transparent background (alpha = 0)
  pg.translate(pg.width / 2, pg.height / 2); // Move origin to the center
  pg.rotate(angle); // Rotate the image by the calculated angle
  pg.imageMode(CENTER);
  pg.image(cropped_front_upper_leg, 0, 0);
  pg.endDraw();
  
  // Convert PGraphics to PImage
  rotated_front_upper_leg = pg.get(); 
  
  // Step 5: Crop the rotated image
  int cropX = 15; // X coordinate of the crop
  int cropY = 3; // Y coordinate of the crop
  int cropWidth = 30; // Width of the crop
  int cropHeight = (int)diagonal - 15; // Height of the crop
  
  // Ensure the cropping dimensions do not exceed the rotated image size
  cropX = constrain(cropX, 0, rotated_front_upper_leg.width - cropWidth);
  cropY = constrain(cropY, 0, rotated_front_upper_leg.height - cropHeight);

  finalCrop_front_upper_leg = rotated_front_upper_leg.get(cropX, cropY, cropWidth, cropHeight); // Crop the rotated image
  
  // Step 6: Rotate the final cropped image by 90 degrees before saving it
  PGraphics pgFinal = createGraphics(finalCrop_front_upper_leg.height, finalCrop_front_upper_leg.width); // Swapped dimensions
  pgFinal.beginDraw();
  pgFinal.background(255, 0);  // Transparent background (alpha = 0)
  pgFinal.translate(pgFinal.width / 2, pgFinal.height / 2);  // Center the origin
  pgFinal.rotate(HALF_PI);  // Rotate by 90 degrees (HALF_PI in radians)
  pgFinal.imageMode(CENTER);
  pgFinal.image(finalCrop_front_upper_leg, 0, 0);  // Draw the final cropped image
  pgFinal.endDraw();
  
  // Convert PGraphics to PImage and save the rotated image
  PImage finalRotatedImage = pgFinal.get();
  finalRotatedImage.save("URL.png"); // Save the image as a transparent PNG
  
  // Print the dimensions of the final rotated image
  println("Final Image width: URL " + finalRotatedImage.width);  // Print the width of the final image
  println("Final Image height: URL " + finalRotatedImage.height); // Print the height of the final image
  
  // Optional: Display the images
  // size(1000, 500);
  // image(front_upper_leg, 0, 0);           // Display the original image
  // image(cropped_front_upper_leg, 800, 300);     // Display the cropped image
  // image(rotated_front_upper_leg, 600, 300);     // Display the rotated image
  // image(finalCrop_front_upper_leg, 900, 300); // Display the final cropped image after rotation
}
