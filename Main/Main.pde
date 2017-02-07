//Property of Patrick Malone. C15398146.
//This project is to make a classic game, and I have chosen to create
//tetris.

void setup()
{
  //Setting the size of the screen.
  size(420, 620);
  background(0);
  
  menu_check = 0;
  
  //Calculating the number of rows and columns that are in the grid that will be drawn.
  rows = (height - (border * 2))/spacing;
  cols = (width - (border * 2))/spacing;
  
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
    case 0:
    {
      add_arraylist();
      menu_check = 1;
    }
    
    case 1:
    {
      //Resetting the background each time.
      background(0);
      
      //Plotting the shape and drawing the grid.
      mainGrid.draw_grid();
      
      //This code will clear any blocks that are not moving.
      if(millis() > (start_time + 200))
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
          
          create_shape();
        } 
      }
      
      //This if statement contains all control for moving the current tetris shape.
      if(keyPressed)
      {
        //Rotating the shape if the up key is pressed.
        if (keyCode == UP)
        {
          shape_list.get(0).rotate_shape();
          
          do
          {
            x_pos += result;
            
            shape_list.get(0).get_position(x_pos, y_pos);
            shape_list.get(0).check_x();
            
          }while(result != 0);
          
          delay(100);
        }
        
        //If the left or right keys are pressed the shape will translate appropriately 
        if (keyCode == LEFT)
        {
          if(x_pos > 0)
          {
            x_pos--;
          }
          
          mainGrid.clear_grid();
          
          //Error checking to make sure the shape stays within the grid.
          do
          {
            x_pos += result;
            
            shape_list.get(0).get_position(x_pos, y_pos);
            shape_list.get(0).check_x();
            
          }while(result != 0);
          
          //After error checking 
          shape_list.get(0).plot(1);
          delay(100);
        }
        
        if(keyCode == RIGHT)
        {
          if(x_pos < cols - 1)
          {
            x_pos++;
          }
          mainGrid.clear_grid();
          
          do
          {
            x_pos += result;
            
            shape_list.get(0).get_position(x_pos, y_pos);
            shape_list.get(0).check_x();
            
          }while(result != 0);
          
          shape_list.get(0).plot(1);
          delay(100);
        } 
      }
      
      //If no movement takes place apart from the  constant downward movement
      //The shape will still have to re-map itself.
      shape_list.get(0).get_position(x_pos, y_pos);
      shape_list.get(0).plot(1);
      
      //This is the code to draw the blocks that have been plotted on the grid.
      shape_list.get(0).get_colour();
      mainGrid.draw_block();
    }
  }
}

//This code will produce the starting menu for the game.
void display_menu()
{
  textAlign(CENTER);
  textSize(40);
  stroke(255);
  
  mainGrid.draw_grid();
  
  //text("Play", width/2, height * 1/4);
  //text("Options", width/2, height * 1/2);
  //text("Exit", width/2, height * 3/4);
}

void add_arraylist()
{
  for(i = 0; i < shape_pick.length; i += 2)
  {
    //Creating a test shape for the game.
    if(shape_pick[i] == 0)
    {
      shape_list.add(new Line_shape(shape_pick[i + 1]));
    }
        
    if(shape_pick[i] == 1)
    {
      shape_list.add(new Square_shape(shape_pick[i + 1]));
    }
        
    if(shape_pick[i] == 2)
    {
      shape_list.add(new L_shape(shape_pick[i + 1]));
    }                
        
    if(shape_pick[i] == 3)
    {
      shape_list.add(new J_shape(shape_pick[i + 1]));
    }
        
    if(shape_pick[i] == 4)
    {
      shape_list.add(new Tee_shape(shape_pick[i + 1]));
    }
         
    if(shape_pick[i] == 5)
    {
      shape_list.add(new Z_shape(shape_pick[i + 1]));
    }        
        
    if(shape_pick[i] == 6)
    {
      shape_list.add(new S_shape(shape_pick[i + 1]));
    }        
  } 
      
  x_pos = (int)random(0, cols - 1);
  y_pos = 2;
      
  do
  {
    shape_list.get(0).get_position(x_pos, y_pos);
    shape_list.get(0).check_x();
            
  }while(result != 0);
          
  shape_list.get(0).plot(1);    
}

//This will add a new shape onto the queue
void create_shape()
{
  int [] temp_array =  new int [shape_pick.length];
  for(i = 2, z = 0; i < 8; i += 2, z += 2)
  {
    temp_array[z] = shape_pick[i];
    temp_array[z + 1] = shape_pick[i + 1];
  }
  
  z = 6;
  
  temp_array[z] = (int)random(0, 7);
  temp_array[z + 1] = (int)random(0,6);
  
  shape_pick = temp_array;
  
  remove_arraylist();
  add_arraylist();
}

void remove_arraylist()
{
  for(i = 0; i < shape_list.size(); i++)
  {
    shape_list.remove(i);
  }
}