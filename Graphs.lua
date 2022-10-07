Object = require "Classic"
Vertex = Object:extend()

function Vertex:new(x_pos,y_pos)
    self.x_pos = x_pos or 0
    self.y_pos = y_pos or 0
end

function Vertex:draw()
    love.graphics.circle("line", self.x_pos, self.y_pos, 10)
end