function love.load()
    window = {}
    window.width, window.height = love.graphics.getWidth(), love.graphics.getHeight()
    

    -- Get width and height of individual pixels based on screen size, display should be 64x32
    window.pixel_width = window.width / 64
    window.pixel_height = window.height / 32

    window.cursor_x = 0
    window.cursor_y = 0

    -- Manual Pixel Placement
    window.pixel_line =  { 1, 0, 0, 1, 1, 1, 0, 1, 0, 0, 1, 0, 1, 0, 0, 1, 0, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0 }
    window.pixel_line2 = { 1, 0, 0, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1, 0, 0, 1, 1, 1, 0, 1, 1, 1 }
    window.pixel_line3 = { 1, 0, 0, 1, 1, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1, 1, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 0 }
    window.pixel_line4 = { 1, 1, 0, 1, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0 }
    window.pixels = {window.pixel_line, window.pixel_line2, window.pixel_line3, window.pixel_line4}
    
end

function love.update(dt)

end

function love.draw()
    local cursor_x = 0
    local cursor_y = 0

    for i = 1, #window.pixels do
        local line = window.pixels[i]

        for j = 1, #line do

            if line[j] == 1 then
                love.graphics.rectangle("fill", cursor_x, cursor_y, window.pixel_width, window.pixel_height)
            end

            cursor_x = cursor_x + window.pixel_width
        end

        cursor_x = 0
        cursor_y = cursor_y + window.pixel_height
    end
end