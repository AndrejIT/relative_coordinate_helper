relative_coordinate_helper = {}

-- Relative position is left-handed (as is minetest coordinate system)
-- Position, relative to: x-FRONT/BACK, z-LEFT/RIGHT, y-UP/DOWN
-- I think, this code has to be this long (unless there are some trick with matrix operations). And it should be optimal enough.
-- x-FRONT/BACK, z-LEFT/RIGHT, y-UP/DOWN
function relative_coordinate_helper.get_pos_relative(position, rel_pos, face_vector, down_vector)
    local pos = {x=position.x,y=position.y,z=position.z}

    if not face_vector then
        face_vector = {x=1, y=0, z=0}
        -- assert(vector.length(face_vector) == 1, "Incorrect face vector")
    end

    -- oh no! "wallmounted" and "facedir" cannot store down vector. i choose defaults.
    if not down_vector then
        down_vector = {x=0, y=0, z=0}
        if face_vector.y == 1 then
            down_vector.x = 1
        elseif face_vector.y == -1 then
            down_vector.x = -1
        else
            down_vector.y = -1
        end
    end

    assert(vector.length(down_vector) == 1, "Incorrect down vector")
    assert(vector.length(vector.multiply(face_vector, down_vector)) == 0, "Down vector ".."x"..down_vector.x.."y"..down_vector.y.."z"..down_vector.z.." incompatible with face vector ".."x"..face_vector.x.."y"..face_vector.y.."z"..face_vector.z)

    if rel_pos.x == 0 and rel_pos.y == 0 and rel_pos.z == 0 then
        return {x=pos.x, y=pos.y, z=pos.z}
    end

    local fdir = face_vector
    local ddir = down_vector

    if fdir.x == 1 then -- NORD
        pos.x = pos.x + rel_pos.x
        if ddir.y == -1 then
            pos.y = pos.y + rel_pos.y
            pos.z = pos.z + rel_pos.z
        elseif ddir.x == 1 then
            assert(false, "Impossible vector combination!")
        elseif ddir.x == -1 then
            assert(false, "Impossible vector combination!")
        elseif ddir.z == 1 then
            pos.y = pos.y + rel_pos.z
            pos.z = pos.z - rel_pos.y
        elseif ddir.z == -1 then
            pos.y = pos.y - rel_pos.z
            pos.z = pos.z + rel_pos.y
        elseif ddir.y == 1 then
            pos.y = pos.y - rel_pos.y
            pos.z = pos.z - rel_pos.z
        end
    elseif fdir.z == -1 then -- EAST
        pos.z = pos.z - rel_pos.x
        if ddir.y == -1 then
            pos.y = pos.y + rel_pos.y
            pos.x = pos.x + rel_pos.z
        elseif ddir.x == 1 then
            pos.y = pos.y + rel_pos.z
            pos.x = pos.x - rel_pos.y
        elseif ddir.x == -1 then
            pos.y = pos.y - rel_pos.z
            pos.x = pos.x + rel_pos.y
        elseif ddir.z == 1 then
            assert(false, "Impossible vector combination!")
        elseif ddir.z == -1 then
            assert(false, "Impossible vector combination!")
        elseif ddir.y == 1 then
            pos.y = pos.y - rel_pos.y
            pos.x = pos.x - rel_pos.z
        end
    elseif fdir.x == -1 then -- SOUTH
        pos.x = pos.x - rel_pos.x
        if ddir.y == -1 then
            pos.y = pos.y + rel_pos.y
            pos.z = pos.z - rel_pos.z
        elseif ddir.x == 1 then
            assert(false, "Impossible vector combination!")
        elseif ddir.x == -1 then
            assert(false, "Impossible vector combination!")
        elseif ddir.z == 1 then
            pos.y = pos.y - rel_pos.z
            pos.z = pos.z - rel_pos.y
        elseif ddir.z == -1 then
            pos.y = pos.y + rel_pos.z
            pos.z = pos.z + rel_pos.y
        elseif ddir.y == 1 then
            pos.y = pos.y - rel_pos.y
            pos.z = pos.z + rel_pos.z
        end
    elseif fdir.z == 1 then -- WEST
        pos.z = pos.z + rel_pos.x
        if ddir.y == -1 then
            pos.y = pos.y + rel_pos.y
            pos.x = pos.x - rel_pos.z
        elseif ddir.x == 1 then
            pos.y = pos.y - rel_pos.z
            pos.x = pos.x - rel_pos.y
        elseif ddir.x == -1 then
            pos.y = pos.y + rel_pos.z
            pos.x = pos.x + rel_pos.y
        elseif ddir.z == 1 then
            assert(false, "Impossible vector combination!")
        elseif ddir.z == -1 then
            assert(false, "Impossible vector combination!")
        elseif ddir.y == 1 then
            pos.y = pos.y - rel_pos.y
            pos.x = pos.x + rel_pos.z
        end
    elseif fdir.y == 1 then -- UP
        pos.y = pos.y + rel_pos.x
        if ddir.y == -1 then
            assert(false, "Impossible vector combination!")
        elseif ddir.x == 1 then
            pos.x = pos.x - rel_pos.y
            pos.z = pos.z + rel_pos.z
        elseif ddir.x == -1 then
            pos.x = pos.x + rel_pos.y
            pos.z = pos.z - rel_pos.z
        elseif ddir.z == 1 then
            pos.x = pos.x - rel_pos.z
            pos.z = pos.z - rel_pos.y
        elseif ddir.z == -1 then
            pos.x = pos.x + rel_pos.z
            pos.z = pos.z + rel_pos.y
        elseif ddir.y == 1 then
            assert(false, "Impossible vector combination!")
        end
    elseif fdir.y == -1 then -- DOWN
        pos.y = pos.y - rel_pos.x
        if ddir.y == -1 then
            assert(false, "Impossible vector combination!")
        elseif ddir.x == 1 then
            pos.x = pos.x - rel_pos.y
            pos.z = pos.z - rel_pos.z
        elseif ddir.x == -1 then
            pos.x = pos.x + rel_pos.y
            pos.z = pos.z + rel_pos.z
        elseif ddir.z == 1 then
            pos.x = pos.x + rel_pos.z
            pos.z = pos.z - rel_pos.y
        elseif ddir.z == -1 then
            pos.x = pos.x - rel_pos.z
            pos.z = pos.z + rel_pos.y
        elseif ddir.y == 1 then
            assert(false, "Impossible vector combination!")
        end
    end
    return pos
end

function relative_coordinate_helper.get_node_face_direction(pos)
    local node = minetest.get_node(pos)
    local node_reg = minetest.registered_nodes[node.name]

    local face_vector = nil
    if node_reg.paramtype2 == "wallmounted" then
        -- face_vector = vector.multiply(minetest.wallmounted_to_dir(node.param2), -1)
        local param2_n = node.param2 % 8
        face_vector = ({[0]={x=0, y=-1, z=0}, [1]={x=0, y=1, z=0}, [2]={x=-1, y=0, z=0}, [3]={x=1, y=0, z=0}, [4]={x=0, y=0, z=-1}, [5]={x=0, y=0, z=1}, [6]={x=0, y=-1, z=0}, [7]={x=0, y=-1, z=0}})[param2_n]
    elseif node_reg.paramtype2 == "facedir" then
        -- face_vector = vector.multiply(minetest.facedir_to_dir(node.param2), -1)
        local param2_n = math.floor((node.param2 % 24)/4)
        local param2_m = node.param2 % 4 -- division remainder

        face_vector = ({
            [0] = {[0]={x=0,  y=0, z=-1}, [1]={x=0, y=1, z=0},  [2]={x=0, y=-1, z=0}, [3]={x=0, y=0, z=-1}, [4]={x=0, y=0, z=-1}, [5]={x=0, y=0, z=-1}},
            [1] = {[0]={x=-1, y=0, z=0},  [1]={x=-1, y=0, z=0}, [2]={x=1, y=0, z=0},  [3]={x=0, y=1, z=0}, [4]={x=0, y=-1, z=0},  [5]={x=-1, y=0, z=0}},
            [2] = {[0]={x=0,  y=0, z=1},  [1]={x=0, y=-1, z=0}, [2]={x=0, y=1, z=0},  [3]={x=0, y=0, z=1},  [4]={x=0, y=0, z=1},  [5]={x=0, y=0, z=1}},
            [3] = {[0]={x=1,  y=0, z=0},  [1]={x=1, y=0, z=0},  [2]={x=-1, y=0, z=0}, [3]={x=0, y=-1, z=0},  [4]={x=0, y=1, z=0}, [5]={x=1, y=0, z=0}},
        })[param2_m][param2_n]
    else
        face_vector = vector.new(1,0,0)
    end
    return face_vector
end

function relative_coordinate_helper.get_node_down_direction(pos)
    local node = minetest.get_node(pos)
    local node_reg = minetest.registered_nodes[node.name]

    local down_vector = nil
    if node_reg.paramtype2 == "wallmounted" then
        local param2_n = node.param2 % 8
        top_vector = ({[0]={x=0, y=0, z=-1}, [1]={x=0, y=0, z=-1}, [2]={x=0, y=-1, z=0}, [3]={x=0, y=-1, z=0}, [4]={x=0, y=-1, z=0}, [5]={x=0, y=-1, z=0}, [6]={x=0, y=0, z=1}, [7]={x=0, y=0, z=1}})[param2_n]

        down_vector = vector.multiply(top_vector, -1)
    elseif node_reg.paramtype2 == "facedir" then
        local param2_n = math.floor((node.param2 % 24)/4)
        local top_vector = ({[0]={x=0, y=1, z=0}, [1]={x=0, y=0, z=1}, [2]={x=0, y=0, z=-1}, [3]={x=1, y=0, z=0}, [4]={x=-1, y=0, z=0}, [5]={x=0, y=-1, z=0}})[param2_n]

        down_vector = vector.multiply(top_vector, -1)
    else
        down_vector = vector.new(0,-1,0)
    end

    return down_vector
end


-- -- Debug
-- -- n - top direction: +y +z -z +x -x -y
-- -- m - rotate: clocwise, start from -z, or from +y when top +z; -y when top -z
-- minetest.register_chatcommand("coord_test", {
-- 	description = "Test coordinate helper",
--     params = "Test function and also do some tests in world",
--     privs = {server=true},
-- 	func = function(name, text)
--         dofile(minetest.get_modpath("relative_coordinate_helper").."/tests.lua")
--         relative_coordinate_helper.get_pos_relative_test1()
--         relative_coordinate_helper.get_pos_relative_test2()
-- 	end,
-- })
