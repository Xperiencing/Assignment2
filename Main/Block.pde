//This is the parent class for all of the tetris shapes (subclasses).
abstract class Shape
{
  float size;
  color pr_block_colour;
  color sec_block_colour;
  
  Shape(color prim_shape_colour, color sec_shape_colour)
  {
    pr_block_colour = prim_shape_colour;
    sec_block_colour = sec_shape_colour;
    
    size = (width - (border * 2))/spacing;
  }
}

//The following classes are each unique shapes as part of the game.
class Line_shape extends Shape
{
  int x_pos, y_pos;
  int cur_state;
  int [][] block_pos;
  
  Line_shape(color prim_shape_colour, color sec_shape_colour)
  {
    super(prim_shape_colour, sec_shape_colour);
    cur_state = 1;
    
    //This maps out the positions of each of the blocks that make up the shape.
    block_pos = new int [][]{{0, 0, 1, 0, -1, 0, -2, 0},
                             {0, 0, 0, -1, 0, -2, 0, 1},
                             {0, 0, 1, 0, -1, 0, -2, 0},
                             {0, 0, 0, -1, 0, -2, 0, 1}
                             };
  }
  
  void plot(int x, int y)
  {
    x_pos = x;
    y_pos = y;
    
    int temp_x, temp_y;
    int [][] temp_positions = new int[4][2];
    
    //Saving the positions in temporary variables to allow them to be changed.
    temp_x = x_pos;
    temp_y = y_pos;
    
    //These variables are used again as indexes for the arrays.
    i = 0; z = 0;
    
    while(i < 8)
    {
      temp_x += block_pos[cur_state][i];
      temp_y += block_pos[cur_state][i + 1];
      
      if(temp_x < 0)
      {
        //Resetting the while loop and starting again with a different source.
        x_pos -= 1;
        temp_x = x_pos;
        
        i = 0; z = 0;
      }
      else if(temp_y > rows)
      {
        y_pos -= 1;
        temp_y = y_pos;
        
        i = 0; z = 0;
      }
      else
      {
        temp_positions[z][0] = temp_x;
        temp_positions[z][1] = temp_y;
        
        i += 2;
        z += 1;
      }
    }
    
    for(i = 0; i < 4; i++)
    {
      println(temp_positions[i][0]);
      println(temp_positions[i][1]);
    }
    
    delay(20);
    
    z = 0;
    
    //Finalising the block positions
    for(i = 0; i < 4; i++)
    {
      mainGrid.grid_data[temp_positions[i][z]][temp_positions[i][z + 1]] = 1;     
    }
  }
}

class Square_shape extends Shape
{
  int x_pos;
  int y_pos;
  
  Square_shape(color prim_shape_colour, color sec_shape_colour, int x, int y)
  {
    super(prim_shape_colour, sec_shape_colour);
    x_pos = x;
    y_pos = y;
  }
}

class L_shape extends Shape
{
  int x_pos;
  int y_pos;
  
  L_shape(color prim_shape_colour, color sec_shape_colour, int x, int y)
  {
    super(prim_shape_colour, sec_shape_colour);    
    x_pos = x;
    y_pos = y;
  }
}

class J_shape extends Shape
{
  int x_pos;
  int y_pos;
  
  J_shape(color prim_shape_colour, color sec_shape_colour, int x, int y)
  {
    super(prim_shape_colour, sec_shape_colour);
    x_pos = x;
    y_pos = y;
  }
}

class Tee_shape extends Shape
{
  int x_pos;
  int y_pos;
  
  Tee_shape(color prim_shape_colour, color sec_shape_colour, int x, int y)
  {
    super(prim_shape_colour, sec_shape_colour);
    x_pos = x;
    y_pos = y;
  }
}

class S_shape extends Shape
{
  int x_pos;
  int y_pos;
  
  S_shape(color prim_shape_colour, color sec_shape_colour, int x, int y)
  {
    super(prim_shape_colour, sec_shape_colour);
    x_pos = x;
    y_pos = y;
  }
}