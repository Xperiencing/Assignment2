//Property of Patrick Malone. C15398146.
//This project is to make a classic game, and I have chosen to create
//tetris.

void setup()
{
  //Setting the size of the screen.
  size(1020, 620);
  background(0);
  
  //Setting up the font for the menu screen.
  tetris = createFont("tetris_block.ttf", 32);
  normal = createFont("Arial", 12);
  
  //Setting up the table to load the highscore
  Table t = loadTable("highscore.csv", "header");
  highscore = t.getInt(0, 0);
  
  //Setting the width of the grid at the start.
  grid_width = 420;
  
  //Calculating the number of rows and columns that are in the grid that will be drawn.
  rows = (height - (border * 2))/spacing;
  cols = (grid_width - (border * 2))/spacing;
  
  //This creates a new object of the grid class using the rows and cols variables.
  mainGrid = new Grid(rows, cols);
  
  //Creating the array that contins the different shape options aswell as 
  //The random colours.
  shape_pick = new int [8];
  
  for(i = 0; i < 8; i+= 2)
  {
    shape_pick [i] = (int)random(0, 7);
    shape_pick [i + 1] = (int)random(0,6);
  }
  
  //Setting the start time.
  start_time = millis();
}

void draw()
{
  //Menu Check will change depensing on what stage of the game the user is currently on.
  switch (menu_check)
  {
    //Displaying the start up menu.
    case 0:
    {
      display_menu();
      break;
    }
    
    //Creating the shapes and storing them in an array list.
    case 1:
    {
      add_arraylist();
      menu_check = 2;
      break;
    }
    
    case 2:
    {
      //Resetting the background each time.
      background(0);
      
      //Plotting the shape and drawing the grid.
      mainGrid.draw_grid();
      
      //This code will clear any blocks that are not moving.
      if(millis() > (start_time + speed[copy_difficulty]))
      {
        start_time = millis();
        mainGrid.clear_grid();
        y_pos++;
        
        //Checking if the shape can go further.
        shape_list.get(0).get_position(x_pos, y_pos);
        shape_list.get(0).check_y();
        
        if(result != 0)
        {
          y_pos--;
          
          shape_list.get(0).get_position(x_pos, y_pos);
          shape_list.get(0).plot(2);
          
          mainGrid.check_lines();
          create_shape();
        } 
      }
      
      //This if statement contains all control for moving the current tetris shape.
      if(keyPressed)
      {
        //Rotating the shape if the up key is pressed.
        if (keyCode == UP && millis() > (rotate_cool + 100))
        {
          shape_list.get(0).rotate_shape();
          
          for(i = 0; i < 1; i++)
          {
            shape_list.get(0).get_position(x_pos, y_pos);
            shape_list.get(0).check_x();
            
            if(result != 0)
            {
              shape_list.get(0).reset_rotate();
              break;
            }
            
            shape_list.get(0).check_y();
            
            if(result != 0)
            {
              shape_list.get(0).reset_rotate();
              break;    
            }
          }
          
          rotate_cool = millis();
        }
        
        //Moving the shape down much faster.
        if (keyCode == DOWN)
        {
          copy_difficulty = 3;
        }
        
        //If the left or right keys are pressed the shape will translate appropriately. 
        if (keyCode == LEFT && millis() > (move_cool + 100))
        {
          if(x_pos > 0)
          {
            x_pos--;
          }
          
          mainGrid.clear_grid();
          
          //Error checking to make sure the shape stays within the grid.
          do
          {
            //Changing position if out of bounds.
            if(result != 0)
            {
              x_pos++;
            }
            
            shape_list.get(0).get_position(x_pos, y_pos);
            shape_list.get(0).check_x();
            
          }while(result != 0);
          
          //After error checking 
          shape_list.get(0).plot(1);
          
          move_cool = millis();
        }
        
        //Code to move shape to the right.
        if(keyCode == RIGHT && millis() > (move_cool + 100))
        {
          if(x_pos < cols - 1)
          {
            x_pos++;
          }
          mainGrid.clear_grid();
          
          do
          {
            if(result != 0)
            {
              x_pos--;
            }
            
            shape_list.get(0).get_position(x_pos, y_pos);
            shape_list.get(0).check_x();
            
          }while(result != 0);
          
          shape_list.get(0).plot(1);
          
          //Setting the cooldown timer.
          move_cool = millis();
        } 
      }
      
      //If no movement takes place apart from the  constant downward movement
      //The shape will still have to re-map itself.
      shape_list.get(0).get_position(x_pos, y_pos);
      shape_list.get(0).plot(1);
      
      //This is the code to draw the blocks that have been plotted on the grid.
      shape_list.get(0).get_colour();
      mainGrid.draw_block();
      
      //Setting the font to Ariel and setting text parameters.
      textFont(normal);
      textSize(18);
      textAlign(LEFT);
      fill(255);
      
      //Setting x and y positions.
      demo_x = width/2;
      demo_y = height * 1/5;;
      
      text("NEXT SHAPES", demo_x - 15, demo_y - 10);
      
      for(i = 1; i < shape_list.size(); i++)
      {
        demo_y = (height * i/4);
        shape_list.get(i).create_shape();
      }
      
      break;
    }
  }
}

void keyReleased()
{
  if (keyCode == DOWN)
  {
    copy_difficulty = difficulty;
  }
}