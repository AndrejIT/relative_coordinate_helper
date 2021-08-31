# Relative coordinate helper functions
Helper library for  Minetest game.

Main function is:
relative_coordinate_helper.get_pos_relative(pos, rel_pos, face_vector, down_vector)

You give vector rel_pos as coordinate relative to node and it's face and bottom.
x-FRONT/BACK, z-LEFT/RIGHT, y-UP/DOWN
And it gives you correct coordinates in the world!

relative_coordinate_helper.get_node_face_direction(pos)
relative_coordinate_helper.get_node_down_direction(pos)

MIT licence, so you can link to it, or copy it into your mod code.


Example will put fire in front of node:

local get_pos_relative = relative_coordinate_helper.get_pos_relative
local get_node_face_direction = relative_coordinate_helper.get_node_face_direction
local get_node_down_direction = relative_coordinate_helper.get_node_down_direction

local face_vector = get_node_face_direction(pos)
local down_vector = get_node_down_direction(pos)

minetest.set_node(get_pos_relative(pos, {x=1, y=0, z=0}, face_vector, down_vector), {name="fire:basic_flame"})
