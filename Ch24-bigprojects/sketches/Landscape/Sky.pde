
class Sky {
   color sunColor;  
   float sunX;      
   float sunY;     
   float sunR;     
   color hazeColor; 
   float hazeR;
   color skyColor;  
   float cloudIntensity;  

   Sky(color asunColor,  float asunX,  float asunY, float asunR,     
       color ahazeColor, float ahazeR,
       color askyColor,  
       float acloudIntensity) { 
      sunColor = asunColor;  
      sunX =  asunX;      
      sunY =  asunY;     
      sunR =  asunR;     
      hazeColor =  ahazeColor; 
      hazeR = ahazeR;
      skyColor = askyColor;  
      cloudIntensity = acloudIntensity;  
   }

   void render() {

      // cdist is the distance from sun's center to the farthest screen corner
      float cdist = dist(sunX, sunY, 0, 0);  
      cdist = max(cdist, dist(sunX, sunY, width, 0));
      cdist = max(cdist, dist(sunX, sunY, 0, height));
      cdist = max(cdist, dist(sunX, sunY, width, height));
    
      for (int y=0; y<height; y++) {
         for (int x=0; x<width; x++) {
            float r = dist(x, y, sunX, sunY);
            if (r < sunR) {                                  
               set(x, y, sunColor);  // when in the sun, we're sun color
            } else if (r < sunR+hazeR) { 
               float a = map(r, sunR, sunR+hazeR, 0, 180);   // distance into degrees 
               float v = map(cos(radians(a)), -1, 1, 1, 0);  // cosine over transition
               color hc = lerpColor(sunColor, hazeColor, v); // blend colors
               set(x, y, hc);                                
            } else {                                        
               float dist = map(r, sunR+hazeR, cdist, 0, 1); // distance into (0,1)
               float cloudClr = noise(0.01*x, 0.03*y);       // cloud strength
               cloudClr -= 0.5;                              // center cloud color at 0
               float cloudStrength = sqrt(dist);             // cloud strength
               cloudClr = lerp(0, cloudClr, cloudStrength);  // scale cloud
               float cgray = cloudClr * cloudIntensity;      // cloud grayness 
               color sc = lerpColor(hazeColor, skyColor, dist); // blend haze to sky
               sc = color(red(sc)+cgray, green(sc)+cgray, blue(sc)+cgray);
               set(x, y, sc);                                
            }
         }
      }
   }
}
