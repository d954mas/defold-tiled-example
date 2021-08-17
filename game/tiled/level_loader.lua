local TILESETS = require "game.tilesets"
local LEVEL_MAP_HELPER = require "assets.bundle.common.levels.parser.map_helper"

local FACTORY_TILE_URL = msg.url("game_tiled:/factories#tile")
local FACTORY_GEOMETRY_URL = msg.url("game_tiled:/factories#geometry")
local PLAYER_URL = msg.url("game_tiled:/player/player")

local Loader = {}

---@param map LevelData
---@param tiles number[]
local function create_tiles(map, tiles)
    local result = {}
    for i, tile in ipairs(tiles) do
        if (tile ~= 0) then
            local data = { tile_data = LEVEL_MAP_HELPER.tile_to_data(tile), url = nil }
            local x, y = LEVEL_MAP_HELPER.id_to_coords(map, i)
            local scale, rotation = LEVEL_MAP_HELPER.tile_flip_to_scale_and_angle(data.tile_data.fh, data.tile_data.fv, data.tile_data.fd)
            rotation = vmath.quat_rotation_z(math.rad(rotation))
            data.url = msg.url(factory.create(FACTORY_TILE_URL, vmath.vector3(x * 64 - 32, y * 64 + 32, 0), rotation, nil, scale))
            local sprite_url = msg.url(data.url.socket, data.url.path, "sprite")
            sprite.play_flipbook(sprite_url, TILESETS.by_id[data.tile_data.id].image_hash)
            result[i] = data
        end
    end
    return result
end

---@return url[]
local function create_geometry(objs)
    local result = {}
    for i, obj in ipairs(objs) do
        local data = { obj = obj, url = nil }
        local scale = vmath.vector3(obj.w / 64, obj.h / 64, 1)
        --SCALE NOT WORKED FOR GEOMETRY
        data.url = msg.url(factory.create(FACTORY_GEOMETRY_URL, vmath.vector3(obj.x + obj.w / 2, obj.y + obj.h / 2, 0), nil, nil, nil))
        go.set_scale(scale, data.url)
        result[i] = data
    end
    return result
end

---@return url[]
---@param player LevelMapObject
local function create_player(player)
    go.set_position(vmath.vector3(player.center_x, player.center_y, 0.1), PLAYER_URL)
end

---@param data LevelData
function Loader.load(data)
    assert(data)
    local result = {}
    result.front_1 = create_tiles(data, data.front_1)
    result.geometry = create_geometry(data.geometry)
    create_player(data.player)

    return result
end

return Loader
