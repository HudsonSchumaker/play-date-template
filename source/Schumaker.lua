import "CoreLibs/graphics"
import "CoreLibs/object"

local gfx <const> = playdate.graphics

class("Schumaker").extends()

function Schumaker:init(xspeed, yspeed)
    self.label = {
		x = 155,
		y = 110,
		xspeed = xspeed,
		yspeed = yspeed,
		width = 180,
		height = 20,
		title = "SchuamkerTeam"
	}
end

function Schumaker:swapColors()
	if (gfx.getBackgroundColor() == gfx.kColorWhite) then
		gfx.setBackgroundColor(gfx.kColorBlack)
		gfx.setImageDrawMode("inverted")
	else
		gfx.setBackgroundColor(gfx.kColorWhite)
		gfx.setImageDrawMode("copy")
	end
end

function Schumaker:update()
    local label = self.label;
    local swap = false
	if (label.x + label.width >= 400 or label.x <= 0) then
        label.xspeed = -label.xspeed;
		swap = true
    end
        
    if (label.y + label.height >= 240 or label.y <= 0) then
        label.yspeed = -label.yspeed;
		swap = true
	end

	if (swap) then
		self:swapColors()
	end

	label.x += label.xspeed
	label.y += label.yspeed
end

function Schumaker:draw()
    local label = self.label;
    gfx.drawTextInRect(label.title, label.x, label.y, label.width, label.height)
end