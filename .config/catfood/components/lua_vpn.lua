return {
  config = {
    update_interval = 5000
  },

  update = function()
  end,

  render = function(colorize)
    local country_codes = {
      ["United States"] = "US",
      ["United Kingdom"] = "GB",
      ["Germany"] = "DE",
      ["France"] = "FR",
      ["Netherlands"] = "NL",
      ["Sweden"] = "SE",
      ["Norway"] = "NO",
      ["Denmark"] = "DK",
      ["Finland"] = "FI",
      ["Switzerland"] = "CH",
      ["Austria"] = "AT",
      ["Belgium"] = "BE",
      ["Italy"] = "IT",
      ["Spain"] = "ES",
      ["Poland"] = "PL",
      ["Czech Republic"] = "CZ",
      ["Hungary"] = "HU",
      ["Romania"] = "RO",
      ["Bulgaria"] = "BG",
      ["Croatia"] = "HR",
      ["Slovakia"] = "SK",
      ["Slovenia"] = "SI",
      ["Estonia"] = "EE",
      ["Latvia"] = "LV",
      ["Lithuania"] = "LT",
      ["Portugal"] = "PT",
      ["Greece"] = "GR",
      ["Ireland"] = "IE",
      ["Luxembourg"] = "LU",
      ["Cyprus"] = "CY",
      ["Malta"] = "MT",
      ["Canada"] = "CA",
      ["Australia"] = "AU",
      ["New Zealand"] = "NZ",
      ["Japan"] = "JP",
      ["South Korea"] = "KR",
      ["Singapore"] = "SG",
      ["India"] = "IN",
      ["Brazil"] = "BR",
      ["Argentina"] = "AR",
      ["Chile"] = "CL",
      ["Mexico"] = "MX",
      ["South Africa"] = "ZA",
      ["Turkey"] = "TR",
      ["Israel"] = "IL",
      ["UAE"] = "AE",
      ["Saudi Arabia"] = "SA",
      ["Egypt"] = "EG",
      ["Morocco"] = "MA",
      ["Nigeria"] = "NG",
      ["Kenya"] = "KE",
      ["Thailand"] = "TH",
      ["Vietnam"] = "VN",
      ["Philippines"] = "PH",
      ["Indonesia"] = "ID",
      ["Malaysia"] = "MY",
      ["Hong Kong"] = "HK",
      ["Taiwan"] = "TW"
    }

    local status, country, short = "disconnected", "", "--"
    local handle = io.popen("nordvpn status 2>/dev/null")

    if handle then
      local output = handle:read("*a")
      handle:close()
      if output and output ~= "" then
        for line in output:gmatch("[^\r\n]+") do
          if line:match("Status:") and line:match("Connected") then
            status = "connected"
          elseif line:match("Country:") then
            local country_part = line:match("Country:%s*(.+)")
            if country_part then
              country = country_part:match("^%s*(.-)%s*$") or ""
            end
          end
        end
        if status == "connected" and country ~= "" then
          short = country_codes[country] or "--"
        end
      end
    end

    local text = " " .. short

    if colorize then
      local color = status == "disconnected" and "dark_gray" or "magenta"
      return { text, color }
    else
      return { text, nil }
    end
  end
}
