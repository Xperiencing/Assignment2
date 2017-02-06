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