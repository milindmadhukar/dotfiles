conky.config = {
	--Various settings
	-- background = true, 							-- forked to background
	cpu_avg_samples = 2,						-- The number of samples to average for CPU monitoring.
	diskio_avg_samples = 10,					-- The number of samples to average for disk I/O monitoring.
	double_buffer = true,						-- Use the Xdbe extension? (eliminates flicker)
	if_up_strictness = 'address',				-- how strict if testing interface is up - up, link or address
	net_avg_samples = 2,						-- The number of samples to average for net data
	no_buffers = true,							-- Subtract (file system) buffers from used memory?
	temperature_unit = 'celsius',			-- fahrenheit or celsius
	text_buffer_size = 2048,					-- size of buffer for display of content of large variables - default 256
	update_interval = 1,						-- update interval
	imlib_cache_size = 0,                       -- disable image cache to get a new spotify cover per song

	-- Placement (Conky on MIDDLE of THREE monitors at 1920x1080)
	--alignment = 'top_left',		                -- top_left,top_middle,top_right,bottom_left,bottom_middle,bottom_right,
	--gap_x = 3540,                               -- pixels between right or left border
	--gap_y = 70,									-- pixels between bottom or left border

    -- Placement (For SINGLE monitor users!)
	alignment = 'bottom_right',		            -- top_left,top_middle,top_right,bottom_left,bottom_middle,bottom_right,
	gap_x = 20,								-- pixels between right or left border
	gap_y = 20,								-- pixels between bottom or left border

    -- Size
    minimum_height = 5,
    minimum_width = 400,

	--Graphical
	border_inner_margin = 5, 					-- margin between border and text
	border_outer_margin = 5, 					-- margin between border and edge of window
	border_width = 0, 							-- border width in pixels
	default_bar_width = 260,					-- default is 0 - full width
	default_bar_height = 10,					-- default is 6
	default_gauge_height = 25,					-- default is 25
	default_gauge_width =40,					-- default is 40
	default_graph_height = 40,					-- default is 25
	default_graph_width = 153,					-- default is 0 - full width
	default_shade_color = '#000000',			-- default shading colour
	default_outline_color = '#000000',			-- default outline colour
	draw_borders = false,						-- draw borders around text
	draw_graph_borders = true,					-- draw borders around graphs
	draw_shades = false,						-- draw shades
	draw_outline = false,						-- draw outline
	stippled_borders = 0,						-- dashing the border

	--Textual
	format_human_readable = true,				-- KiB, MiB rather then number of bytes
	font  = 'FiraCode Nerd Font',  	-- the default font used
	font1 = 'FiraCode Nerd Font:size=16',         	-- font for the time
	font2 = 'FiraCode Nerd Font:size=24',               	-- font for the date
	override_utf8_locale = true,				-- force UTF8 requires xft
	short_units = true,							-- shorten units from KiB to k
	-- top_name_width = 400,						-- width for $top name value default 15
	top_name_verbose = false,					-- If true, top name shows the full command line of  each  process - Default value is false.
	uppercase = false,							-- uppercase or not
	use_spacer = 'none',						-- adds spaces around certain objects to align - default none
	use_xft = true,								-- xft font - anti-aliased font
	xftalpha = 1,								-- alpha of the xft font - between 0-1

	--Windows
	own_window = true,							-- create your own window to draw
	own_window_argb_value = 255,			    -- real transparency - composite manager required 0-255
	own_window_argb_visual = false,				-- use ARGB - composite manager required
	own_window_class = 'Conky',					-- manually set the WM_CLASS name for use with xprop
	-- own_window_colour = '#2E3440',				-- set colour if own_window_transparent no
	own_window_transparent = true,				-- if own_window_argb_visual is true sets background opacity 0%
	own_window_title = 'conky',			-- set the name manually
	own_window_type = 'override',				-- if own_window true options are: normal/override/dock/desktop/panel
	own_window_hints = 'undecorated,below,above,sticky,skip_taskbar,skip_pager',  -- if own_window true - just hints - own_window_type sets it

	--Colors (Nord)
	color1 = "A6DA95", -- #A6DA95 subtitle
	color2 = "CAD3F5", -- #CAD3F5 text
	color3 = "7DC4E4", -- #7DC4E4 title
};



conky.text = [[
${if_running spotify}${voffset 10}${color green}Spotify (${exec ~/.config/conky/spotify/scripts/status.sh}) $hr $color
# --- Get Spotify Cover ---
# --- added -n (no caching) flag to image as found it was caching it, as it was not updating the cover for me correcty. Also, size and location of the image placement is specific to my setup, so tinker with that yourself ---
${exec ~/.config/conky/spotify/scripts/cover.sh}${image ~/.config/conky/spotify/current/current.jpg -p 2,47 -s 60x60 -n}
${offset 70}Title: ${exec ~/.config/conky/spotify/scripts/title.sh}
${offset 70}Artist: ${exec ~/.config/conky/spotify/scripts/artist.sh}
${offset 70}Album: ${exec ~/.config/conky/spotify/scripts/album.sh}${voffset 10}${endif}
]];
