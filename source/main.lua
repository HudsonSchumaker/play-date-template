import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

import "schumaker"

local logo = schumaker(1, -1)
local gfx <const> = playdate.graphics
local sfx <const> = playdate.sound

local font = gfx.font.new('font/Mini Sans 2X')
local song = sfx.fileplayer.new('sounds/output', 2) --ffmpeg -i input.mp3 -acodec adpcm_ima_wav output.wav
print(song:getLength())

local exit = playdate.timer.new(2222, function ()
		logo:remove()
	end
)

local function loadGame()
	playdate.display.setRefreshRate(50) -- Sets framerate to 50 fps
	math.randomseed(playdate.getSecondsSinceEpoch()) -- seed for math.random
	gfx.setFont(font)
	local background = gfx.image.new('images/background')
	gfx.sprite.setBackgroundDrawingCallback(
		function (x, y, w, h)
			gfx.setClipRect(x, y, w, h)
			background:draw(0, 0)
			gfx.clearClipRect()
		end
	)
	
	song:play(0)
end

local function updateGame()
	logo:update()
end

local function drawGame()
	gfx.clear() -- Clears the screen
	logo:draw()
end

loadGame()

function playdate.update()
	updateGame()
	drawGame()
	
	playdate.drawFPS(0, 0) -- FPS widget
end
