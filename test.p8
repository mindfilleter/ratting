log("------- RUN START -------")


for _, item in pairs(select_items{str=function (v) return v == 0 end}) do
   log(item.name .. " - " .. item.cost)
end


log("------- RUN END -------")
