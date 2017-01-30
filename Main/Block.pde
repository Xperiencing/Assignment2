//This is the parent class for all of the tetris shapes (subclasses).
abstract class Shape
{
  float size;
  color block_colour;
}

//The following classes are each unique shapes as part of the game.
class Line_shape extends Shape
{
  int start_y;
  int start_x;
}

class Square_shape extends Shape
{
  int start_y;
  int start_x;
}

class L_shape extends Shape
{
  int start_y;
  int start_x;
}

class J_shape extends Shape
{
  int start_y;
  int start_x;
}

class Tee_shape extends Shape
{
  int start_y;
  int start_x;
}

class S_shape extends Shape
{
  int start_y;
  int start_x;
}