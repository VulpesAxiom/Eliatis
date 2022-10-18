Object = require "Classic"
require "Utilities"

Vertex = Object:extend()
GameArea = Object:extend()

function Vertex:new(x_pos,y_pos)
    self.x_pos = x_pos or 0
    self.y_pos = y_pos or 0
    self.radius = 10
end

function Vertex:draw()
    inside = in_radius(self.x_pos,self.y_pos, self.radius)
    if (inside) then
        love.graphics.setLineWidth(3)
    end
    if(in_game_area(self.x_pos,self.y_pos)) then
        love.graphics.circle("line", self.x_pos, self.y_pos, self.radius)
    end
    love.graphics.setLineWidth(1)
    return inside
end

function GameArea:new(x,y,width,height)
    self.x = x
    self.y = y
    self.width = width
    self.height = height
    self.vertices = {}
end

function GameArea:draw()
    love.graphics.rectangle("line", self.x, self.y, self.width, self.height)
end