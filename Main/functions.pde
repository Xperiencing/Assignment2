void add_arraylist()
{
  for(i = 0; i < shape_pick.length; i += 2)
  {
    //Creating a test shape for the game.
    if(shape_pick[i] == 0)
    {
      shape_list.add(new Line_shape(shape_pick[i + 1]));
    }
        
    if(shape_pick[i] == 1)
    {
      shape_list.add(new Square_shape(shape_pick[i + 1]));
    }
        
    if(shape_pick[i] == 2)
    {
      shape_list.add(new L_shape(shape_pick[i + 1]));
    }                
        
    if(shape_pick[i] == 3)
    {
      shape_list.add(new J_shape(shape_pick[i + 1]));
    }
        
    if(shape_pick[i] == 4)
    {
      shape_list.add(new Tee_shape(shape_pick[i + 1]));
    }
         
    if(shape_pick[i] == 5)
    {
      shape_list.add(new Z_shape(shape_pick[i + 1]));
    }        
        
    if(shape_pick[i] == 6)
    {
      shape_list.add(new S_shape(shape_pick[i + 1]));
    }        
  } 
  
  x_pos = (int)random(0, cols - 1);
  y_pos = 2;
      
  do
  {
    shape_list.get(0).get_position(x_pos, y_pos);
    shape_list.get(0).check_x();
            
  }while(result != 0);
          
  shape_list.get(0).plot(1);    
}

//This will add a new shape onto the queue
void create_shape()
{
  int [] temp_array =  new int [shape_pick.length];
  for(i = 2, z = 0; i < 8; i += 2, z += 2)
  {
    temp_array[z] = shape_pick[i];
    temp_array[z + 1] = shape_pick[i + 1];
  }
  
  z = 6;
  
  temp_array[z] = (int)random(0, 7);
  temp_array[z + 1] = (int)random(0,6);
  
  shape_pick = temp_array;
  
  remove_arraylist();
  add_arraylist();
}

void remove_arraylist()
{
  println(shape_list.size());
  
  for(i = (shape_list.size() - 1); i >= 0; i--)
  {
    shape_list.remove(i);
  }
}