//This is the parent class for all of the tetris shapes (subclasses).
abstract class Shape
{
  float size;
  color block_colour;
}

class Line_shape
{
  int start_y;
  int start_x;
}