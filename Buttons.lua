Object = require("Classic")
Button = Object:extend()

function Button:new(x,y)
    self.x = x
    self.y = y
end

function Button:draw()
    love.graphics.rectangle('line', self.x, self.y, 60, 30)
end