//This is the parent class for all of the tetris shapes (subclasses).
abstract class Shape_base
{
  float size;
  color pr_block_colour;
  color sec_block_colour;
  
  Shape_base(color prim_shape_colour, color sec_shape_colour)
  {
    pr_block_colour = prim_shape_colour;
    sec_block_colour = sec_shape_colour;
    
    size = (width - (border * 2))/spacing;
  }
}

interface Shape
{
  void plot(int x, int y);
}