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
      
      else
      {
        result = 0;
      }
    }
  }
  
  void plot()
  {
    for(i = 0; i < 4; i++)
    {
      mainGrid.grid_data[temp_positions[i][1]][temp_positions[i][0]] = 1;
    }
  }
  
  
  void check_y()
  {
    for(i = 0; i < 4; i++)
    {
      if(temp_positions[i][1] > (cols - 1))
      {
        result = -1;
        break;
      }
    }
  }
  
  void rotate_shape(int num)
  {
    //Changing the state of the shape so it rotates
    cur_state += num;
    
    //Making sure it stays in the bounds of the array.
    if(cur_state < 0)
    {
      cur_state = 4;
    }
    
    if(cur_state > 3)
    {
      cur_state = 0;  
    }
    
    //Clearing the data when rotating.
    mainGrid.clear_grid();
  }
  
  int get_colour()
  {
    return(colour);
  }
  
}

interface Shape
{
  void get_position(int x, int y); 
  void plot();
  void rotate_shape(int num);
  
  void check_x();
  void check_y();
  
  int get_colour();
}