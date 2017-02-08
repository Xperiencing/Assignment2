//This is the parent class for all of the tetris shapes (subclasses).
abstract class Shape_base
{
  float size;
  int colour;
  int cur_state;
  int [][] block_pos;
  
  Shape_base(int c)
  {
    colour = c;
    
    size = (width - (border * 2))/spacing;
  }
  
  void get_position(int x, int y)
  {
    int temp_x, temp_y;
    temp_positions = new int[4][2];
    
    //Saving the positions in temporary variables to allow them to be changed.
    temp_x = x;
    temp_y = y;
    
    //These variables are used again as indexes for the arrays.
    i = 0; z = 0;
    
    while(i < 8)
    {
      temp_x += block_pos[cur_state][i];
      temp_y += block_pos[cur_state][i + 1];
      
      temp_positions[z][0] = temp_x;
      temp_positions[z][1] = temp_y;
        
      //Incrementing the index variables.
      i += 2;
      z += 1;
        
      temp_x = x;
      temp_y = y;
    }
    
    x_pos = x;
    y_pos = y;
    z = 0;
  }
  
  void check_x()
  {
    for(i = 0; i < 4; i++)
    {
      if(temp_positions[i][0] < 0)
      {
        result = 1;
        break;
      }
      
      else if(temp_positions[i][0] > (cols - 1))
      {
        result = -1;
        break;
      }
      
      else if(mainGrid.grid_data[temp_positions[i][1]][temp_positions[i][0]] == 2)
      {
        result = 1;
        break;
      }
      
      else
      {
        result = 0;
      }
    }
  }
  
  void plot(int type)
  { 
    for(i = 0; i < 4; i++)
    {
      mainGrid.grid_data[temp_positions[i][1]][temp_positions[i][0]] = type;
      mainGrid.grid_colour[temp_positions[i][1]][temp_positions[i][0]] = colour;
      
      if(type == 2 && temp_positions[i][1] < 6)
      {
        menu_check = 3;
      }
    }
  }
  
  
  void check_y()
  {
    for(i = 0; i < 4; i++)
    {
      if(temp_positions[i][1] > (rows - 1))
      {
        result = -1;
        break;
      }
      
      else if(mainGrid.grid_data[temp_positions[i][1]][temp_positions[i][0]] == 2)
      {
        result = -1;
        break;
      }
      
      else
      {
        result = 0;  
      }
      
    }
  }
  
  void rotate_shape()
  {
    //Changing the state of the shape so it rotates
    cur_state -= 1;
    
    //Making sure it stays in the bounds of the array.
    if(cur_state < 0)
    {
      cur_state = 3;
    }
    
    //Clearing the data when rotating.
    mainGrid.clear_grid();
  }
  
  int get_colour()
  {
    return(colour);
  }
  
  void reset_rotate()
  {
    //Resetting the change that just occured to avoid the shape going out of bounds.
    cur_state += 1;
  }
  
}

interface Shape
{
  void get_position(int x, int y); 
  void plot(int type);
  void rotate_shape();
  void reset_rotate();
  
  void check_x();
  void check_y();
  
  void create_shape();
  
  int get_colour();
}