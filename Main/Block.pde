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
  int x_pos;
  int y_pos;
  int [][] block_pos;
  
  Line_shape(color prim_shape_colour, color sec_shape_colour, int x, int y)
  {
    super(prim_shape_colour, sec_shape_colour);
    x_pos = x;
    y_pos = y;
    
    //This maps out the positions of each of the blocks that make up the shape.
    block_pos = new int [][]{{0, 0, 1, 0, -1, 0, -2, 0},
                             {0, 0, 0, -1, 0, -2, 0, 1},
                             {0, 0, 1, 0, -1, 0, -2, 0},
                             {0, 0, 0, -1, 0, -2, 0, 1}
                             };
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