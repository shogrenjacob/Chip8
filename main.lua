-- GRAPHICS / MAIN
-- TODO: Fix Graphics Width Issue

require("helpers")
local Vm = require("vm")

function love.load()
    window = {}
    window.width, window.height = love.graphics.getWidth(), love.graphics.getHeight()
    window.resolution_width = 64
    window.resolution_height = 32


    -- Get width and height of individual pixels based on screen size, display should be 64x32
    window.pixel_width = window.width / window.resolution_width
    window.pixel_height = window.height / window.resolution_height

    window.cursor_x = 0
    window.cursor_y = 0

    window.screen = {
        0xF0, 0xF0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
        0x90, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
        0x90, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
        0x90, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
        0xF0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
    }
end

function love.update(dt)

end

function love.draw()
    local cursor_x = 0
    local cursor_y = 0

    -- for i = 1, #window.pixels do
    --     local line = window.pixels[i]

    --     -- Loop through pixel rows
    --     for j = 1, #line do

    --         -- Draw pixels on pixel columns
    --         if line[j] == 1 then
    --             love.graphics.rectangle("fill", cursor_x, cursor_y, window.pixel_width, window.pixel_height)
    --         end

    --         cursor_x = cursor_x + window.pixel_width
    --     end

    --     -- Reset column cursor, increment row cursor
    --     cursor_x = 0
    --     cursor_y = cursor_y + window.pixel_height
    -- end

    for i = 1, #window.screen do
        if window.screen[i] ~= 0x0 then
            local bits = byteToBits(window.screen[i])

            for j = 1, #bits do
                if bits[j] == 1 then
                    love.graphics.rectangle("fill", cursor_x, cursor_y, window.pixel_width, window.pixel_height)
                end
                cursor_x = cursor_x + window.pixel_width
            end
        else
            cursor_x = cursor_x + window.pixel_width * 8 -- Multiply by 8 for each bit in the byte given, which each correspond to a pixel on screen
        end

        if (i % 8) == 0 then
            cursor_x = 0
            cursor_y = cursor_y + window.pixel_height
        end
    end
end