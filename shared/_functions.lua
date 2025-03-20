
function IsFloat(ANumber) 
    if type(ANumber) == "number" then 
        if ANumber % 1 == 0 then
            return false
        else
            return true
        end
    else
        return false 
    end 
end 

function IsInt(ANumber) 
    if type(ANumber) == "number" then 
        if ANumber % 1 == 0 then
            return true
        else
            return false
        end
    else
        return false 
    end 
end


function VerifyVector3(coord_test, trace_func)
    local my_script = Config.ScriptName
    local my_func = "VerifyVector3" 
    if coord_test then  -- verify it exists.
        VerifyNumberData = coord_test
        if IsFloat(VerifyNumberData) then   -- verify it's a float 
                -- valid data
        else
            if IsInt(VerifyNumberData) then -- if not float, check for int.
                VerifyNumberData  = VerifyNumberData + 0.00 
                -- fixed, now valid data.
            else 
                severity = "ERROR"
                message = " Bad Data: Expected float, recieved [" .. type(VerifyNumberData) .. "] var: ".. coord_test
                PrintConsoleMessage(my_script, my_func, severity, message, trace_func)
                VerifyNumberData  = 0.00 
                --  correction of data.
            end 
        end      
        coord_test = VerifyNumberData             
    else 
        -- does not exist at all.
        severity = "ERROR"
        message = " Bad Data: Expected float, recieved [" .. type(VerifyNumberData) .. "] var: ".. coord_test
        PrintConsoleMessage(my_script, my_func, severity, message, trace_func)
        --  correction of data.
        coord_test = 0.000 
    end 
    return coord_test
end 



function ContainsFruit(key_string, key_fruit)
    min,max = string.find(key_string, "%f[%a]" .. key_fruit .. "%f[%A]")
    if min then return true end 
    if max then return true end
    return false
end



function PrintConsoleMessage(my_script, my_func, severity, message, trace_func)
    print('['..my_script..'] ('.. my_func ..')' .. ' - {'.. severity ..'} ' .. message .. '(Trace Back: ' .. trace_func .. ')')
end 

 
function VerifyBlipSprite(VerifyNumberData, trace_func)
    local my_script = Config.ScriptName
    local my_func = "VerifyBlipSprite" 
    -- blips can be strings or numbers? double check 
    if VerifyNumberData then 
        -- data exists
        if type(VerifyNumberData) == "number" then 
            -- valid data
        else if type(VerifyNumberData) == "string" then 
            -- valid data
        else
            -- invalid data.
            severity = "ERROR"
            message = " Bad Data: Expected string or number, recieved [" .. type(VerifyNumberData) .. "] var: ".. VerifyNumberData.. " -- + set to default"
            PrintConsoleMessage(my_script, my_func, severity, message, trace_func)
            VerifyNumberData = Config.DefaultSprite -- default setting
        end 
    else 
        -- does not exist at all.
        severity = "ERROR"
        message = " Bad Data: Expected string or number, recieved [" .. type(VerifyNumberData) .. "] var: ".. VerifyNumberData .. " -- + set to default"
        PrintConsoleMessage(my_script, my_func, severity, message, trace_func )
        VerifyNumberData = Config.DefaultSprite -- default setting
    end 
    return VerifyNumberData
end 

function VerifyBlipColor(VerifyNumberData, trace_func)
    local my_script = Config.ScriptName
    local my_func = "VerifyVector3"

    if VerifyNumberData then 
        -- data exists
        if IsInt(VerifyNumberData) then 
            --- valid data
        else 
            -- bad data 
            severity = "ERROR"
            message = " Bad Data: Expected number, recieved [" .. type(VerifyNumberData) .. "] var: ".. VerifyNumberData .. " -- + set to default"
            PrintConsoleMessage(my_script, my_func, severity, message, trace_func)
            VerifyNumberData = Config.DefaultSpriteColor -- default setting
        end 
    else 
        -- does not exist at all.
        severity = "ERROR"
        message = " Bad Data: Expected number, recieved [" .. type(VerifyNumberData) .. "] var: ".. VerifyNumberData .. " -- + set to default"
        PrintConsoleMessage(my_script, my_func, severity, message, trace_func)
        VerifyNumberData = Config.DefaultSpriteColor -- default setting
    end 
    return VerifyNumberData
end 


function VerifyBlipLabel(VerifyData, trace_func)
    local my_script = Config.ScriptName
    local my_func = "VerifyBlipLabel" 
    -- blips can be strings or numbers? double check 
    if VerifyData then 
        -- data exists
        if type(VerifyData) == "string" then 
            -- valid data
        else if type(VerifyData) == "number" then 
            -- valid data, but convert to string
            VerifyData = str(VerifyData)
        else
            -- invalid data.
            severity = "ERROR"
            message = " Bad Data: Expected string, recieved [" .. type(VerifyData) .. "] var: ".. VerifyData.. " -- + set to default"
            PrintConsoleMessage(my_script, my_func, severity, message, trace_func)
            VerifyData = Config.DefaultSpriteLabel -- default setting
        end 
    else 
        -- does not exist at all.
        severity = "ERROR"
        message = " Bad Data: Expected string, recieved [" .. type(VerifyData) .. "] var: ".. VerifyData .. " -- + set to default"
        PrintConsoleMessage(my_script, my_func, severity, message, trace_func )
        VerifyData = Config.DefaultSpriteLabel -- default setting
    end 
    return VerifyData
end 