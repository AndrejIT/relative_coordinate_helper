

-- Tests if some relative coordinates are calculated correctly
-- Ideally it would be tests for all 6x4x26 combinations. But hopefully this will be enough for now.
function relative_coordinate_helper.get_pos_relative_test1()

    local get_pos_relative = relative_coordinate_helper.get_pos_relative

    local pos = {x=0, y=0, z=0}
    local face_vector = {x=1, y=0, z=0}
    local down_vector = {x=0, y=-1, z=0}
    -- 0.
    assert(
        vector.equals( get_pos_relative(pos, {x=0, y=0, z=0}, face_vector, down_vector), {x=0, y=0, z=0} )
    , "Test 0 failed")
    minetest.chat_send_all('Test 0 done!')
    -- 1. face forward
    assert(
        vector.equals( get_pos_relative(pos, {x=1, y=-1, z=1}, face_vector, down_vector), {x=1, y=-1, z=1} ) and
        vector.equals( get_pos_relative(pos, {x=1, y=-1, z=0}, face_vector, down_vector), {x=1, y=-1, z=0} ) and
        vector.equals( get_pos_relative(pos, {x=1, y=-1, z=-1}, face_vector, down_vector), {x=1, y=-1, z=-1} ) and
        vector.equals( get_pos_relative(pos, {x=0, y=-1, z=1}, face_vector, down_vector), {x=0, y=-1, z=1} ) and
        vector.equals( get_pos_relative(pos, {x=0, y=-1, z=0}, face_vector, down_vector), {x=0, y=-1, z=0} ) and
        vector.equals( get_pos_relative(pos, {x=0, y=-1, z=-1}, face_vector, down_vector), {x=0, y=-1, z=-1} ) and
        vector.equals( get_pos_relative(pos, {x=-1, y=-1, z=1}, face_vector, down_vector), {x=-1, y=-1, z=1} ) and
        vector.equals( get_pos_relative(pos, {x=-1, y=-1, z=0}, face_vector, down_vector), {x=-1, y=-1, z=0} ) and
        vector.equals( get_pos_relative(pos, {x=-1, y=-1, z=-1}, face_vector, down_vector), {x=-1, y=-1, z=-1} ) and
        vector.equals( get_pos_relative(pos, {x=1, y=0, z=1}, face_vector, down_vector), {x=1, y=0, z=1} ) and
        vector.equals( get_pos_relative(pos, {x=1, y=0, z=0}, face_vector, down_vector), {x=1, y=0, z=0} ) and
        vector.equals( get_pos_relative(pos, {x=1, y=0, z=-1}, face_vector, down_vector), {x=1, y=0, z=-1} ) and
        vector.equals( get_pos_relative(pos, {x=0, y=0, z=1}, face_vector, down_vector), {x=0, y=0, z=1} ) and
        vector.equals( get_pos_relative(pos, {x=1, y=0, z=-1}, face_vector, down_vector), {x=1, y=0, z=-1} ) and
        vector.equals( get_pos_relative(pos, {x=-1, y=0, z=1}, face_vector, down_vector), {x=-1, y=0, z=1} ) and
        vector.equals( get_pos_relative(pos, {x=-1, y=0, z=0}, face_vector, down_vector), {x=-1, y=0, z=0} ) and
        vector.equals( get_pos_relative(pos, {x=-1, y=0, z=-1}, face_vector, down_vector), {x=-1, y=0, z=-1} ) and
        vector.equals( get_pos_relative(pos, {x=1, y=1, z=1}, face_vector, down_vector), {x=1, y=1, z=1} ) and
        vector.equals( get_pos_relative(pos, {x=1, y=1, z=0}, face_vector, down_vector), {x=1, y=1, z=0} ) and
        vector.equals( get_pos_relative(pos, {x=1, y=1, z=-1}, face_vector, down_vector), {x=1, y=1, z=-1} ) and
        vector.equals( get_pos_relative(pos, {x=0, y=1, z=1}, face_vector, down_vector), {x=0, y=1, z=1} ) and
        vector.equals( get_pos_relative(pos, {x=0, y=1, z=0}, face_vector, down_vector), {x=0, y=1, z=0} ) and
        vector.equals( get_pos_relative(pos, {x=0, y=1, z=-1}, face_vector, down_vector), {x=0, y=1, z=-1} ) and
        vector.equals( get_pos_relative(pos, {x=-1, y=1, z=1}, face_vector, down_vector), {x=-1, y=1, z=1} ) and
        vector.equals( get_pos_relative(pos, {x=-1, y=1, z=0}, face_vector, down_vector), {x=-1, y=1, z=0} ) and
        vector.equals( get_pos_relative(pos, {x=-1, y=1, z=-1}, face_vector, down_vector), {x=-1, y=1, z=-1} ) and
        vector.equals( get_pos_relative(pos, {x=3, y=3, z=3}, face_vector, down_vector), {x=3, y=3, z=3} )
    , "Test 1 failed")
    minetest.chat_send_all('Test 1 done!')
    -- 1.b face forward, tilt to the right
    down_vector = {x=0, y=0, z=1}
    assert(
        vector.equals( get_pos_relative(pos, {x=-1, y=1, z=0}, face_vector, down_vector), {x=-1, y=0, z=-1} ) and
        vector.equals( get_pos_relative(pos, {x=-1, y=1, z=-1}, face_vector, down_vector), {x=-1, y=-1, z=-1} ) and
        vector.equals( get_pos_relative(pos, {x=3, y=3, z=3}, face_vector, down_vector), {x=3, y=3, z=-3} )
    , "Test 1.b failed")
    minetest.chat_send_all('Test 1.b done!')
    -- 2. face to the right
    face_vector = {x=0, y=0, z=-1}
    down_vector = {x=0, y=-1, z=0}
    assert(
        vector.equals( get_pos_relative(pos, {x=-1, y=1, z=0}, face_vector, down_vector), {x=0, y=1, z=1} ) and
        vector.equals( get_pos_relative(pos, {x=-1, y=1, z=-1}, face_vector, down_vector), {x=-1, y=1, z=1} ) and
        vector.equals( get_pos_relative(pos, {x=3, y=3, z=3}, face_vector, down_vector), {x=3, y=3, z=-3} )
    , "Test 2 failed")
    minetest.chat_send_all('Test 2 done!')
    -- 2.b face to the right, tilt to the right
    face_vector = {x=0, y=0, z=-1}
    down_vector = {x=1, y=0, z=0}
    assert(
        vector.equals( get_pos_relative(pos, {x=-1, y=1, z=0}, face_vector, down_vector), {x=-1, y=0, z=1} ) and
        vector.equals( get_pos_relative(pos, {x=-1, y=1, z=-1}, face_vector, down_vector), {x=-1, y=-1, z=1} ) and
        vector.equals( get_pos_relative(pos, {x=3, y=3, z=3}, face_vector, down_vector), {x=-3, y=3, z=-3} )
    , "Test 2.b failed")
    minetest.chat_send_all('Test 2.b done!')
    -- 3.
    face_vector = {x=-1, y=0, z=0}
    down_vector = {x=0, y=-1, z=0}
    assert(
        vector.equals( get_pos_relative(pos, {x=3, y=3, z=3}, face_vector, down_vector), {x=-3, y=3, z=-3} )
    , "Test 3 failed")
    minetest.chat_send_all('Test 3 done!')
    -- 4.
    face_vector = {x=0, y=0, z=1}
    down_vector = {x=0, y=-1, z=0}
    assert(
        vector.equals( get_pos_relative(pos, {x=3, y=3, z=3}, face_vector, down_vector), {x=-3, y=3, z=3} )
    , "Test 4 failed")
    minetest.chat_send_all('Test 4 done!')
    -- 5. face up
    face_vector = {x=0, y=1, z=0}
    down_vector = {x=1, y=0, z=0}
    assert(
        vector.equals( get_pos_relative(pos, {x=-1, y=1, z=0}, face_vector, down_vector), {x=-1, y=-1, z=0} ) and
        vector.equals( get_pos_relative(pos, {x=-1, y=1, z=-1}, face_vector, down_vector), {x=-1, y=-1, z=-1} ) and
        vector.equals( get_pos_relative(pos, {x=3, y=3, z=3}, face_vector, down_vector), {x=-3, y=3, z=3} )
    , "Test 5 failed")
    minetest.chat_send_all('Test 5 done!')
    -- 5.b face up, tilt to the right
    face_vector = {x=0, y=1, z=0}
    down_vector = {x=0, y=0, z=1}
    assert(
        vector.equals( get_pos_relative(pos, {x=-1, y=1, z=0}, face_vector, down_vector), {x=0, y=-1, z=-1} ) and
        vector.equals( get_pos_relative(pos, {x=-1, y=1, z=-1}, face_vector, down_vector), {x=1, y=-1, z=-1} ) and
        vector.equals( get_pos_relative(pos, {x=3, y=3, z=3}, face_vector, down_vector), {x=-3, y=3, z=-3} )
    , "Test 5.b failed")
    minetest.chat_send_all('Test 5.b done!')
    -- 6. face down
    face_vector = {x=0, y=-1, z=0}
    down_vector = {x=-1, y=0, z=0}
    assert(
        vector.equals( get_pos_relative(pos, {x=1, y=-1, z=1}, face_vector, down_vector), {x=-1, y=-1, z=1} ) and
        vector.equals( get_pos_relative(pos, {x=1, y=-1, z=0}, face_vector, down_vector), {x=-1, y=-1, z=0} ) and
        vector.equals( get_pos_relative(pos, {x=1, y=-1, z=-1}, face_vector, down_vector), {x=-1, y=-1, z=-1} ) and
        -- ...
        vector.equals( get_pos_relative(pos, {x=3, y=3, z=3}, face_vector, down_vector), {x=3, y=-3, z=3} )
    , "Test 6 failed")
    minetest.chat_send_all('Test 6 done!')
    -- ...
    -- 6.c face down, tilt to the right two times
    face_vector = {x=0, y=-1, z=0}
    down_vector = {x=1, y=0, z=0}
    assert(
        vector.equals( get_pos_relative(pos, {x=1, y=-1, z=1}, face_vector, down_vector), {x=1, y=-1, z=-1} ) and
        vector.equals( get_pos_relative(pos, {x=1, y=-1, z=0}, face_vector, down_vector), {x=1, y=-1, z=0} ) and
        vector.equals( get_pos_relative(pos, {x=1, y=-1, z=-1}, face_vector, down_vector), {x=1, y=-1, z=1} ) and
        -- ...
        vector.equals( get_pos_relative(pos, {x=-1, y=1, z=0}, face_vector, down_vector), {x=-1, y=1, z=0} ) and
        vector.equals( get_pos_relative(pos, {x=-1, y=1, z=-1}, face_vector, down_vector), {x=-1, y=1, z=1} ) and
        vector.equals( get_pos_relative(pos, {x=3, y=3, z=3}, face_vector, down_vector), {x=-3, y=-3, z=-3} )
    , "Test 6.c failed")
    minetest.chat_send_all('Test 6.c done!')
    -- 7 face to x, foot z
    face_vector = {x=1, y=0, z=0}
    down_vector = {x=0, y=0, z=1}
    assert(
        vector.equals( get_pos_relative(pos, {x=3, y=3, z=3}, face_vector, down_vector), {x=3, y=3, z=-3} )
    , "Test 7 failed")
    minetest.chat_send_all('Test 7 done!')
    -- 8 face to x, foot up
    face_vector = {x=1, y=0, z=0}
    down_vector = {x=0, y=1, z=0}
    assert(
        vector.equals( get_pos_relative(pos, {x=1, y=-1, z=1}, face_vector, down_vector), {x=1, y=1, z=-1} ) and
        vector.equals( get_pos_relative(pos, {x=1, y=-1, z=0}, face_vector, down_vector), {x=1, y=1, z=0} ) and
        vector.equals( get_pos_relative(pos, {x=1, y=-1, z=-1}, face_vector, down_vector), {x=1, y=1, z=1} ) and
        -- -- ...
        vector.equals( get_pos_relative(pos, {x=-1, y=1, z=0}, face_vector, down_vector), {x=-1, y=-1, z=0} ) and
        vector.equals( get_pos_relative(pos, {x=-1, y=1, z=-1}, face_vector, down_vector), {x=-1, y=-1, z=1} ) and
        vector.equals( get_pos_relative(pos, {x=3, y=3, z=3}, face_vector, down_vector), {x=3, y=-3, z=-3} )
    , "Test 8 failed")
    minetest.chat_send_all('Test 8 done!')
    -- 20.b face to the right, tilt to the right. different position.
    face_vector = {x=0, y=0, z=-1}
    down_vector = {x=1, y=0, z=0}
    pos = {x=7, y=5, z=-7}
    assert(
        vector.equals( get_pos_relative(pos, {x=-1, y=1, z=0}, face_vector, down_vector), {x=6, y=5, z=-6} ) and
        vector.equals( get_pos_relative(pos, {x=-1, y=1, z=-1}, face_vector, down_vector), {x=6, y=4, z=-6} ) and
        vector.equals( get_pos_relative(pos, {x=3, y=3, z=3}, face_vector, down_vector), {x=4, y=8, z=-10} )
    , "Test 20.b failed")
    minetest.chat_send_all('Test 20.b done!')

    minetest.chat_send_all('Looks like all tests completed succefuly!')
end

-- some testing in-world
function relative_coordinate_helper.get_pos_relative_test2()
    local i = 0
    for n = 0, 5, 1 do
        for m = 0, 3, 1 do
            local p = n * 4 + m
            -- if m == 0 then
                minetest.set_node({x=i, y=1, z=3}, {name="default:furnace", param2=p})
                minetest.set_node({x=i, y=4, z=3}, {name="default:sign_wall", param2=p})
            -- end
            i = i + 2
        end
    end

    local positions = minetest.find_nodes_in_area({x=-1, y=-1, z=-5}, {x=50, y=5, z=5}, {"default:furnace"})

    local get_node_face_direction = relative_coordinate_helper.get_node_face_direction
    local get_node_down_direction = relative_coordinate_helper.get_node_down_direction
    local get_pos_relative = relative_coordinate_helper.get_pos_relative

    for _, pos in ipairs(positions) do
        local face_vector = get_node_face_direction(pos)
        local down_vector = get_node_down_direction(pos)

        minetest.set_node(get_pos_relative(pos, {x=1, y=0, z=0}, face_vector, down_vector), {name="fire:permanent_flame"})
    end

    minetest.chat_send_all("In-world test done.")
end
