return {
  config = {
    update_interval = 2000, -- milliseconds
    format = "🎵 {artist} - {title}",
    show_player_name = false,
    max_length = 40,
    truncate_suffix = "...",
    show_status = true,
    icons = {
      playing = "",
      paused = "",
      stopped = ""
    }
  },

  update = function()
    -- This function could be used to cache data if needed
    -- For now, we'll fetch fresh data in render()
  end,

  render = function(colorize)
    local config = _G.lua_spotify_config or {}
    local format = config.format or "🎵 {artist} - {title}"
    local max_length = config.max_length or 40
    local truncate_suffix = config.truncate_suffix or "..."
    local show_player_name = config.show_player_name or false
    local show_status = config.show_status or true
    local icons = config.icons or {
      playing = "",
      paused = "",
      stopped = ""
    }

    -- Get metadata from playerctl
    local handle = io.popen("playerctl metadata --format '{{artist}}|{{title}}|{{album}}|{{status}}' 2>/dev/null")
    local output = handle and handle:read("*a")
    if handle then handle:close() end

    if not output or output == "" then
      -- Check if there are any players at all
      local players_handle = io.popen("playerctl --list-all 2>/dev/null")
      local players = players_handle and players_handle:read("*a")
      if players_handle then players_handle:close() end

      local text = ""
      if players and players ~= "" then
        text = "Player stopped"
      end

      if colorize then
        return { text, "dark_gray" }
      else
        return { text, nil }
      end
    end

    -- Parse metadata
    local artist, title, album, status = output:match("^(.*)|(.*)|(.*)|(.*)$")
    artist = artist and artist:gsub("^%s*(.-)%s*$", "%1") or "Unknown Artist"
    title = title and title:gsub("^%s*(.-)%s*$", "%1") or "Unknown Title"
    album = album and album:gsub("^%s*(.-)%s*$", "%1") or ""
    status = status and status:gsub("^%s*(.-)%s*$", "%1") or "stopped"

    -- Get player name for optional display
    local player_name = ""
    if show_player_name then
      local name_handle = io.popen("playerctl metadata --format '{{playerName}}' 2>/dev/null")
      local name_output = name_handle and name_handle:read("*a")
      if name_handle then name_handle:close() end
      player_name = name_output and name_output:gsub("^%s*(.-)%s*$", "%1") or ""
      if player_name ~= "" then
        player_name = player_name .. ": "
      end
    end

    -- Build display text
    local display_text = format
    display_text = display_text:gsub("{artist}", artist)
    display_text = display_text:gsub("{title}", title)
    display_text = display_text:gsub("{album}", album)

    -- Add status icon if enabled (replace existing icon in format)
    if show_status then
      local icon = icons.stopped
      if status == "Playing" then
        icon = icons.playing
      elseif status == "Paused" then
        icon = icons.paused
      end
      -- Replace the default icon in format if it exists
      if display_text:match("^🎵") then
        display_text = display_text:gsub("^🎵", icon)
      else
        display_text = icon .. " " .. display_text
      end
    end

    -- Add player name if enabled
    if show_player_name and player_name ~= "" then
      display_text = player_name .. display_text
    end

    -- Truncate if too long
    if string.len(display_text) > max_length then
      local prefix_len = max_length - string.len(truncate_suffix)
      display_text = string.sub(display_text, 1, prefix_len) .. truncate_suffix
    end

    -- Determine color based on status
    local color = nil
    if colorize then
      if status == "Playing" then
        color = "green"
      elseif status == "Paused" then
        color = "yellow"
      else
        color = "dark_gray"
      end
    end

    return { display_text, color }
  end
}
