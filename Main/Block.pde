//This is the parent class for all of the tetris shapes (subclasses).
abstract class Shape
{
  float size;
  color block_colour;
  
  Shape(color shape_colour)
  {
    block_colour = shape_colour;
    size = (width - (border * 2))/spacing;
  }
}

//The following classes are each unique shapes as part of the game.
class Line_shape extends Shape
{
  int start_x;
  int start_y;
  int [][] block_pos;
  
  Line_shape(color shape_colour, int x, int y)
  {
    super(shape_colour);
    start_x = x;
    start_y = y;
    
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
  int start_x;
  int start_y;
  
  Square_shape(color shape_colour, int x, int y)
  {
    super(shape_colour);
    start_x = x;
    start_y = y;
  }
}

class L_shape extends Shape
{
  int start_x;
  int start_y;
  
  L_shape(color shape_colour, int x, int y)
  {
    super(shape_colour);
    start_x = x;
    start_y = y;
  }
}

class J_shape extends Shape
{
  int start_x;
  int start_y;
  
  J_shape(color shape_colour, int x, int y)
  {
    super(shape_colour);
    start_x = x;
    start_y = y;
  }
}

class Tee_shape extends Shape
{
  int start_x;
  int start_y;
  
  Tee_shape(color shape_colour, int x, int y)
  {
    super(shape_colour);
    start_x = x;
    start_y = y;
  }
}

class S_shape extends Shape
{
  int start_x;
  int start_y;
  
  S_shape(color shape_colour, int x, int y)
  {
    super(shape_colour);
    start_x = x;
    start_y = y;
  }
}