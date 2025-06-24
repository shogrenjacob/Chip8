local bit = require("bit")

function byteToBits(byte)
    local bits = {} -- Big endian byte in array form (ex: 0xf0 = {1,1,1,1,0,0,0,0})

    for i = 7, 0, -1 do
        local val = bit.rshift(byte, i)
        table.insert(bits, val)
    end

    return bits
end