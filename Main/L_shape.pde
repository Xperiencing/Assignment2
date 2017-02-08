class L_shape extends Shape_base implements Shape
{
  
  L_shape(int colour)
  {
    super(colour);  
    cur_state = 0;
    
    //This maps out the positions of each of the blocks that make up the shape.
    block_pos = new int [][]{{0, 0, 1, 0, -1, 0, -1, 1},
                             {0, 0, 0, 1, 0, -1, 1, 1},
                             {0, 0, -1, 0, 1, 0, 1, -1},
                             {0, 0, 0, -1, 0, 1, -1, -1}
                             };
  }
  
  void create_shape()
  {
    PShape l;
    
    l = createShape();
    l.beginShape();
    l.fill(255);
    l.noStroke();
    l.vertex(demo_x, demo_y);
    l.vertex(demo_x + (spacing * 3), demo_y);
    l.vertex(demo_x + (spacing * 3), demo_y + spacing);
    l.vertex(demo_x + spacing, demo_y + spacing);
    l.vertex(demo_x + spacing, demo_y + (spacing * 2));
    l.vertex(demo_x, demo_y + (spacing * 2));
    l.endShape(CLOSE);
    
    shape(l, 25, 25);
  
}