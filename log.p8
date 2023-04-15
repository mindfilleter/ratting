function to_string(any)
    if type(any)=="function" then 
        return "function" 
    end
    if any==nil then 
        return "nil" 
    end
    if type(any)=="string" then
        return any
    end
    if type(any)=="boolean" then
        if any then return "true" end
        return "false"
    end
    if type(any)=="table" then
        local str = "{ "
        for k,v in pairs(any) do
            str=str..tostring(k).."->"..tostring(v).." "
        end
        return str.."}"
    end
    if type(any)=="number" then
        return ""..any
    end
    return "unkown" -- should never show
end

function log (text)
   local message = stat(90)
   message = message .. "-" .. stat(91)
   message = message .. "-" .. stat(92)
   message = message .. " " .. stat(93)
   message = message .. ":" .. stat(94)
   message = message .. ":" .. stat(95)
   printh(message .. " - " .. to_string(text), "log.txt")
end
