//This code will produce the starting menu for the game.
void display_menu()
{
  textFont(tetris);
  textAlign(CENTER);
  textSize(40);
  stroke(255);
  background(0);
  
  if(function_check == 0)
  {
    noFill();
    rect(width/4, height * 1/8, width/2, height * 1/6);
    rect(width/4, height * 3/8, width/2, height * 1/6);
    rect(width/4, height * 5/8, width/2, height * 1/6);
  
    //Printing to the screen the menu options.
    fill(prim_shape_colour[3]);
    text("PLAY", width/2, height * 1/4);
    
    //Checking if the play option is pressed.
    if((mouseX > width/4) 
        && (mouseX < (width * 3/4)) 
        && (mouseY > (height * 1/8)) 
        && (mouseY < (height * (1/8f + 1/6f))))
    {
      noFill();
      stroke(prim_shape_colour[3]);
      rect(width/4, height * 1/8, width/2, height * 1/6);
  
      if(mousePressed)
      {
        menu_check = 1;  
      }
    }
    
    fill(prim_shape_colour[2]);
    text("OPTIONS", width/2, height * 1/2);
    
    //Checking if the play option is pressed.
    if((mouseX > width/4) 
        && (mouseX < (width * 3/4)) 
        && (mouseY > (height * 3/8)) 
        && (mouseY < (height * (3/8f + 1/6f))))
    {
      noFill();
      stroke(prim_shape_colour[2]);
      rect(width/4, height * 3/8, width/2, height * 1/6);
      
      if(mousePressed)
      {
        function_check = 1;
      }
    }
    
    fill(prim_shape_colour[1]);
    text("EXIT", width/2, height * 3/4);
    
    //Checking if the exit option is pressed.
    if((mouseX > width/4) 
        && (mouseX < (width * 3/4)) 
        && (mouseY > (height * 5/8)) 
        && (mouseY < (height * (5/8f + 1/6f))))
    {
      noFill();
      stroke(prim_shape_colour[1]);
      rect(width/4, height * 5/8, width/2, height * 1/6);
      
      if(mousePressed)
      {
        exit();
      }
    }
  }
  
  if(function_check == 1)
  {
    noFill();
    rect(border, height * 1/8, width - (border * 2), height * 1/6);
    rect(border, height * 3/8, width - (border * 2), height * 1/6);
    rect(border, height * 5/8, width - (border * 2), height * 1/6);
    
    //Printing to the screen the menu options.
    fill(prim_shape_colour[0]);
    text("DIFFICULTY EASY", width/2, height * 1/4);
    
    //Checking if the play option is pressed.
    if((mouseX > width/4) 
        && (mouseX < (width * 3/4)) 
        && (mouseY > (height * 1/8)) 
        && (mouseY < (height * (1/8f + 1/6f))))
    {
      noFill();
      stroke(prim_shape_colour[0]);
      rect(border, height * 1/8, width - (border * 2), height * 1/6);
  
      if(mousePressed)
      {
        difficulty = 0;
        copy_difficulty = difficulty;
      }
    }
    
    //Printing to the screen the menu options.
    fill(prim_shape_colour[4]);
    text("DIFFICULTY MEDIUM", width/2, height * 2/4);
    
    //Checking if the play option is pressed.
    if((mouseX > width/4) 
        && (mouseX < (width * 3/4)) 
        && (mouseY > (height * 3/8)) 
        && (mouseY < (height * (3/8f + 1/6f))))
    {
      noFill();
      stroke(prim_shape_colour[4]);
      rect(border, height * 3/8, width - (border * 2), height * 1/6);
  
      if(mousePressed)
      {
        difficulty = 1;
        copy_difficulty = difficulty;
      }
    }
    
    //Printing to the screen the menu options.
    fill(prim_shape_colour[5]);
    text("DIFFICULTY HARD", width/2, height * 3/4);
    
    //Checking if the play option is pressed.
    if((mouseX > width/4) 
        && (mouseX < (width * 3/4)) 
        && (mouseY > (height * 5/8)) 
        && (mouseY < (height * (5/8f + 1/6f))))
    {
      noFill();
      stroke(prim_shape_colour[5]);
      rect(border, height * 5/8, width - (border * 2), height * 1/6);
  
      if(mousePressed)
      {
        difficulty = 2;
        copy_difficulty = difficulty;
      }
    }
    
    textFont(normal);
    textSize(12);
    textAlign(LEFT);
    fill(255);
    
    text("Press spacebar to go back", border, border);
    
    //Creating a way to get back to the main menu.
    if(keyPressed)
    { 
      if(key == 32)
      {
        function_check = 0;
      }
    }
  }
}