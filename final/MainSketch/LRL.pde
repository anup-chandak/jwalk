PImage front_low_leg;       // Variable to hold the original image
PImage cropped_front_low_leg;   // Variable to hold the cropped image
PImage rotated_front_low_leg;   // Variable to hold the rotated image
PImage finalCrop_front_low_leg; // Variable to hold the final cropped image after rotation

void LowerFrontLegSetup() {
  // Load the original image
  front_low_leg = loadImage("source.png");  // Load the image
  
  // Step 1: Crop the image
  cropped_front_low_leg = front_low_leg.get(160, 200, 100, 120); // Crop the image (x, y, width, height)
  cropped_front_low_leg.save("cropped.jpg");  // Save the cropped image
  
  // Step 2: Calculate the diagonal length
  float diagonal = sqrt(sq(cropped_front_low_leg.width) + sq(cropped_front_low_leg.height));
  
  // Step 3: Calculate the angle to rotate (diagonal from top-left to bottom-right becomes vertical)
  float angle = -atan2(cropped_front_low_leg.width, cropped_front_low_leg.height); // Angle in radians
  
  // Step 4: Create a new PGraphics object to draw the rotated image
  PGraphics pg = createGraphics(cropped_front_low_leg.height, cropped_front_low_leg.width); // Width and height swapped
  
  pg.beginDraw();
  pg.background(255, 0); // Set a transparent background (alpha = 0)
  pg.translate(pg.width / 2, pg.height / 2); // Move origin to the center
  pg.rotate(angle); // Rotate the image by the calculated angle
  pg.imageMode(CENTER);
  pg.image(cropped_front_low_leg, 0, 0);
  pg.endDraw();
  
  // Convert PGraphics to PImage
  rotated_front_low_leg = pg.get(); 
  
  // Step 5: Crop the rotated image
  int cropX = 44; // X coordinate of the crop
  int cropY = 0; // Y coordinate of the crop
  int cropWidth = 25; // Width of the crop
  int cropHeight = (int)diagonal - 10; // Height of the crop
  
  // Ensure the cropping dimensions do not exceed the rotated image size
  cropX = constrain(cropX, 0, rotated_front_low_leg.width - cropWidth);
  cropY = constrain(cropY, 0, rotated_front_low_leg.height - cropHeight);
  
  finalCrop_front_low_leg = rotated_front_low_leg.get(cropX, cropY, cropWidth, cropHeight); // Crop the rotated image
  
  // Step 6: Rotate the final cropped image by 90 degrees before saving it
  PGraphics pgFinal = createGraphics(finalCrop_front_low_leg.height, finalCrop_front_low_leg.width); // Swapped dimensions
  pgFinal.beginDraw();
  pgFinal.background(255, 0);  // Transparent background (alpha = 0)
  pgFinal.translate(pgFinal.width / 2, pgFinal.height / 2);  // Center the origin
  pgFinal.rotate(HALF_PI);  // Rotate by 90 degrees (HALF_PI in radians)
  pgFinal.imageMode(CENTER);
  pgFinal.image(finalCrop_front_low_leg, 0, 0);  // Draw the final cropped image
  pgFinal.endDraw();
  
  // Convert PGraphics to PImage and save the rotated image
  PImage finalRotatedImage = pgFinal.get();
  finalRotatedImage.save("LRL.png");  // Save as PNG with transparency
  
  // Print the dimensions of the final rotated image
  println("Final Image width: LRL " + finalRotatedImage.width);  // Print the width of the final image
  println("Final Image height: LRL " + finalRotatedImage.height); // Print the height of the final image
  
  // Display the final rotated image (optional)
  //size(800, 600);
  //image(finalRotatedImage, 0, 0);  // Display the final rotated image
}
