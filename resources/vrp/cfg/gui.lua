
-- gui config file

local cfg = {}

-- additional css loaded to customize the gui display (see gui/design.css to know the available css elements)
-- it is not recommended to modify the vRP core files outside the cfg/ directory, create a new resource instead
-- you can load external images/fonts/etc using the NUI absolute path: nui://my_resource/myfont.ttf
-- example, changing the gui font (suppose a vrp_mod resource containing a custom font)
cfg.css = [[
@font-face {
  font-family: "Titillium Web";
  src: url(https://fonts.googleapis.com/css?family=Titillium+Web:300) format("sans-serif");
}

body{
  font-family: 'Titillium Web', sans-serif;
}
]]

return cfg


-- @font-face {
--   font-family: "Custom Font";
--   src: url(nui://vrp_mod/customfont.ttf) format("truetype");
-- }