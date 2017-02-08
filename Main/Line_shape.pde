//The following classes are each unique shapes as part of the game.
class Line_shape extends Shape_base implements Shape
{
  
  Line_shape(int colour)
  {
    super(colour);
    cur_state = 0;
    
    //This maps out the positions of each of the blocks that make up the shape.
    block_pos = new int [][]{{0, 0, 1, 0, -1, 0, -2, 0},
                             {0, 0, 0, -1, 0, -2, 0, 1},
                             {0, 0, 1, 0, -1, 0, -2, 0},
                             {0, 0, 0, -1, 0, -2, 0, 1}
                             };
  }
  
  void create_shape()
  {
    PShape line;
    
    line = createShape();
    line.beginShape();
    line.fill(prim_shape_colour[this.colour]);
    line.stroke(255);
    line.vertex(demo_x, demo_y);
    line.vertex(demo_x, demo_y + (spacing * 4));
    line.vertex(demo_x + spacing, demo_y + (spacing * 4));
    line.vertex(demo_x + spacing, demo_y);
    line.endShape(CLOSE);
    
    shape(line);
  }
     
}