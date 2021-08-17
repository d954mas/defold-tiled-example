# Tiled example
Example of using [Tiled](https://www.mapeditor.org/) as level editor for game.
Based on [template project for a platformer game](https://github.com/defold/template-platformer).

1)Defold already have tiled engine inside editor. 
But using external tiled editor can give your more power and freedom.

2)Also using text based format for levels instead of collection can give your some benefits.

[![](https://c5.patreon.com/external/logo/become_a_patron_button.png)](https://www.patreon.com/d954mas)

[PLAY](https://d954mas.github.io/defold-tiled-example/)

# Project
Have 3 type of levels.

1)Collection. Level from template-platformer.

2)Json. Load level_1.json from custom_resources

3)Json runtime(only in desktop). Load level_runtime.json if it exist. Load from bundle resources.Can be changed in runtime without defold editor.
Can be shared with level designers without defold project,only need desktop bundle of game.

<img src="https://github.com/d954mas/defold-tiled-example/blob/master/doc/game.png" width="800">


# Tiled vs Defold Tilemap

Tiled: Defold
|KEY            | Tiled(go render)         | Tiled(Defold tilemap render)| Defold |
| ------------- | ------------------------ | ----------------------------| ------ |
| Map View  | orthogonal,isometric,hexagonal |orthogonal| orthogonal  |
| Tile flip  | in editor  |in editor| only in runtime  |
| Render in engine  | NO  | YES| YES|
| Images as tileset  | YES  |NO| NO  |
| Tileset image as tileset  |NO| YES  | YES  |
| Multiple tilesets  |YES| NO  | NO  |
| Tile flip  |YES| YES  | in runtime  |
| Tile rotation  |YES| NO  | NO  |
| Tilemap collisions  |NO| YES  | YES  |
| Tile properties  |YES  | YES  | NO in editor. Can be easy added as lua module  |
| Objects  |YES  | YES  | NO(can be added in collection file)  |
| Objects properties |YES  | YES  | NO(can be added in collection file)  |

## Render.

When use text base format for levels, it need render. 
Render can use  **defold tilemap** or **go**.

In tutorial used go render.

**Defold tilemap render.**

Game collection have empty tilemap. That tilemap is set on load from level text file.

**Go render.**
 
Game object based. 

 Every tile is a game object with sprite.
Render in that tutorial is very simple. In only place object when level created. For big levels you need to implement culling.

# Defold collection level vs text based level(json)
## Defold collection level
1)Tilemap for tilemap

2)Game object with script properties for game objects.

## Text based level(json)
1)Exported from external editor(tiled)

Tiled: Defold
|KEY            | Collection level         | Json level |
| ------------- | ------------------------ | ---------- | 
| Creation  | Editor | Editor,runtime  |
| Assets  | Only used assets load | All assets loaded or need implement asset loading logic |
| Load from server  | liveupdate | as file |
| Users share levels  | NO | YES as file |
| Users make levels  | NO | YES(custom inline editor, or tiled with shared files and examples) |
| Filesize(need test)  | Small | Depends on format |
| Render  | YES | NO |


# Level lifecycle.
Tmx->Lua->Json.

tmx is tiled format.

lua. Export from tiled as lua.
You can use that lua format in defold. But it better to, and some preprocessing(remove unused data,make checks,etc)

Json. Convert lua to your own format.


# Tiled format

<img src="https://github.com/d954mas/defold-tiled-example/blob/master/doc/tiled.png" width="800">

<details> 
  <summary>level_1.lua</summary>
 
```return {
  version = "1.5",
  luaversion = "5.1",
  tiledversion = "1.6.0",
  orientation = "orthogonal",
  renderorder = "left-down",
  width = 46,
  height = 38,
  tilewidth = 64,
  tileheight = 64,
  nextlayerid = 3,
  nextobjectid = 2,
  properties = {},
  tilesets = {
    {
      name = "tile",
      firstgid = 1,
      filename = "tilesets/tile.tsx"
    },
    {
      name = "objects",
      firstgid = 265,
      filename = "tilesets/objects.tsx"
    }
  },
  layers = {
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 46,
      height = 38,
      id = 1,
      name = "front_1",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      data = {
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 22, 0, 0, 22, 0, 0, 0, 0, 0, 0, 22, 0, 0, 0, 44, 0, 0, 0, 22, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 22, 0, 0, 22, 0, 0, 0, 0, 0, 0, 22, 0, 0, 0, 0, 0, 0, 0, 66, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 22, 0, 0, 66, 0, 0, 0, 0, 0, 0, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 0, 0, 0, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 78, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 87, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 55, 88, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 106, 86, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 87, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 62, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 77, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 106, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 40, 0, 0, 0, 30, 3, 31, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 110, 108, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 56, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 30, 3, 31, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 7, 8, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 78, 0, 0, 0, 0, 0, 55, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 2684354670, 0, 0, 0, 0, 30, 3, 3, 31, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 40, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 108, 0, 0, 0, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 0, 2, 3, 3, 4, 64, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 108, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 54, 0, 0, 76, 0, 0, 0, 0, 0, 56, 0, 0, 54, 0, 1, 1, 1, 1, 0, 55, 0, 0, 77, 0, 54, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 29, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 28, 1, 1, 29, 3, 3, 3, 3, 3, 3, 3, 3, 3, 28, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 2,
      name = "objects",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 1,
          name = "",
          type = "",
          shape = "rectangle",
          x = 640,
          y = 1856,
          width = 128,
          height = 256,
          rotation = 0,
          gid = 265,
          visible = true,
          properties = {}
        }
      }
    }
  }
}

``` 
</details>

**1)tilesets.**

Different levels can use same tilesets in different order. Need sort that in parser.
```  tilesets = {
    {
      name = "tile",
      firstgid = 1,
      filename = "tilesets/tile.tsx"
    }...
  },
  ```

**2)layers.** 

Can be different type("objectgroup","tilelayer")

**3)Positions.** 
Tiled use y-down. Top left corner is (0,0). Need recalculate positions to y-top in parser.

Pivot of object is left-top corner. Need move pivot to center in parser.

**4)Tiles.**
```
1, 1, 1, 1, 1, 1, 1, 1, 1, 2684354670, 0, 0, 0, 0, 30, 3, 3, 31, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 40, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1,...
```
Tiled use bitmask to save rotation and flip. 2684354670 is rotated tile
```lua
--diagonal flip https://discourse.mapeditor.org/t/can-i-rotate-tiles/703/5
function M.tile_flip_to_scale_and_angle(fh, fv, fad)
    local scale = vmath.vector3(1)
    local rotation = 0
    if fad then
        if (fv and not fh) then
            rotation = 90
        elseif (fh and not fv) then
            rotation = 270
        elseif (fh and fv) then
            rotation = 270
            scale.x = -scale.x
        else
            rotation = -270
            scale.x = -scale.x
        end
    else
        scale.x = fh and -scale.x or scale.x
        scale.y = fv and -scale.y or scale.y
    end
    return scale, rotation
end
```

# Parser

https://github.com/d954mas/defold-tiled-example/tree/master/assets/bundle/common/levels/parser

use system lua to pack levels. Use luarocks to install dependencies
Need lfs, cjons,bit. 

1)Parse tileset
```lua
--parse tilesets from tilesets.json
local function parse_tilesets(path)
    assert(path)
    print("parse tilesets")
    assert(not TILESETS, "tileset already loaded")

    local tiled = dofile(path)
    local id_to_tile = {}
    local tilesets = {}
    for _, tileset in ipairs(tiled.tilesets) do
        print("parse tileset:" .. tileset.name)
        assert(not tilesets[tileset.name], "tileset with name:" .. tileset.name .. " already created")
        tilesets[tileset.name] = { first_gid = tileset.firstgid, end_gid = tileset.firstgid + tileset.tiles[#tileset.tiles].id, name = tileset.name,
                                   properties = tileset.properties or {} }
        for _, tile in ipairs(tileset.tiles) do
            ---@type TileProperties
            tile.properties = tile.properties or {}
            id_to_tile[tile.id + tileset.firstgid] = tile
            tile.id = tile.id + tileset.firstgid
            tile.width = nil
            tile.height = nil
            --  tile.width = tile.width or tile.size or tileset.tilewidth
            --   tile.height = tile.height or tile.size or tileset.tileheight
            --use metatable to copy tileset properties to tile properties
            --when load in game, need setmetatable again
            setmetatable(tile.properties, { __index = tileset.properties })
            if tile.image then
                local image_path = tile.image
                local pathes = {}
                for word in string.gmatch(image_path, "([^/]+)") do
                    table.insert(pathes, word)
                end
                --split path
                --use only image name
                -- tile.atlas = pathes[#pathes - 1]
                tile.image = string.sub(pathes[#pathes], 1, string.find(pathes[#pathes], "%.") - 1)
            end--]]
        end
    end
    TILESETS = { by_id = id_to_tile, tilesets = tilesets }
    print("parse tilesets done")
end

```

2)Parse levels.
```lua
function M.parse_level(path, result_path)
    local name = path:match("^.+\\(.+)....")
    result_path = result_path .. "\\" .. name .. ".json"
    local tiled = dofile(path)
    tiled.src = path
    local data = create_map_data(tiled)
    --reorder tileset if level use different order then tilesets.json
    check_tilesets(tiled)
    --change y-down to y-top
    repack_all(tiled, data)
    --convert tiled objects to own format
    for _, l in ipairs(tiled.layers) do
        if l.objects then prepare_objects(l.objects, tiled, data) end
    end
  
   --parse tiles
    local layer_front_1 = get_layer(tiled, "front_1")
    data.front_1 = parse_base(data, assert(layer_front_1, "no front 1 level"))
    
    --parse physics static geometry
    data.geometry = parse_geometry(data, assert(get_layer(tiled, "geometry")))
   
    -- set parameters to default values
    data.player = nil
    -- parse level objects(player)
    parse_level_objects(data, assert(get_layer(tiled, "objects")))
   
    --check that data is valid
    check(data)

    --save file
    local json = NEED_PRETTY and pretty(data, nil, "  ", "") or cjson.encode(data)
    local file = assert(io.open(result_path, "w+"))
    file:write(json)
    file:close()
end
```


# Level loader(render)

https://github.com/d954mas/defold-tiled-example/blob/master/game/tiled/level_loader.lua

create tiles,geometry, place player.

geometry scale not worked. So use a lot of rects with size of 1 tile.
