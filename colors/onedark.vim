lua << EOF
for k in pairs(package.loaded) do
    if k:find("onedark") then
        package.loaded[k] = nil
    end
end

require('onedark').setup()
EOF
