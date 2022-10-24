function mouse_in_game_area()
    mouse_x = love.mouse.getX()
    mouse_y = love.mouse.getY()
    if(mouse_x <= game_area.x + game_area.width and mouse_x > game_area.x)then
        if(mouse_y <= game_area.y + game_area.height and mouse_y > game_area.y)then
            return true
        end
    end
    return false
end

function in_radius(x,y, radius)
    if(dist(x,y,love.mouse.getX(),love.mouse.getY()) <= radius )then
        return true
    end
    return false
end

function near_radius(x,y, radius)
    if(dist(x,y,love.mouse.getX(),love.mouse.getY()) <= 2 * radius )then
        return true
    end
    return false
end

function in_game_area(x,y)
    if(math.abs(game_area.x + game_area.width/2 - x) <= game_area.width/2)then
        if(math.abs(game_area.y + game_area.height/2 - y) <= game_area.height/2)then
            return true
        end
    end
    return false
end

function dist(x1,y1,x2,y2)
    return math.sqrt((x1-x2)^2 + (y1-y2)^2)
end