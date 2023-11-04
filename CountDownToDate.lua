obs = obslua

-- Settings
source_name = "" -- Name of the text source to be updated
target_date_str = "2023-12-31" -- The date to count down to in format YYYY-MM-DD

-- Function to convert string to date and calculate difference
function calculate_days_left(target)
    local year, month, day = target:match("(%d+)-(%d+)-(%d+)")
    local target_date = os.time({ year = tonumber(year), month = tonumber(month), day = tonumber(day) })
    local current_date = os.time()
    local diff = os.difftime(target_date, current_date)
    return math.floor(diff / (24 * 60 * 60)) -- convert seconds to days
end

-- Function to update the text source
function update_text()
    if source_name == nil or source_name == "" then
        return
    end
    
    local source = obs.obs_get_source_by_name(source_name)
    if source ~= nil then
        local text_source = obs.obs_source_get_settings(source)
        local days_left = calculate_days_left(target_date_str)
        local text = tostring(days_left) .. " "
        obs.obs_data_set_string(text_source, "text", text)
        obs.obs_source_update(source, text_source)
        obs.obs_data_release(text_source)
        obs.obs_source_release(source)
    end
end

-- OBS Script hook for defining script properties
function script_properties()
    local props = obs.obs_properties_create()
    obs.obs_properties_add_text(props, "source_name", "Text Source", obs.OBS_TEXT_DEFAULT)
    obs.obs_properties_add_text(props, "target_date_str", "Target Date (YYYY-MM-DD)", obs.OBS_TEXT_DEFAULT)
    return props
end

-- OBS Script hook for loading script settings
function script_update(settings)
    source_name = obs.obs_data_get_string(settings, "source_name")
    target_date_str = obs.obs_data_get_string(settings, "target_date_str")
    update_text()
end

-- OBS Script hook for providing script description
function script_description()
    return "Updates a text source to display the countdown to a specified date."
end
