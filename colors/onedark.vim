lua << EOF
-- Limpar todos os módulos 'onedark' carregados
for k in pairs(package.loaded) do
    if k:find("onedark") then
        package.loaded[k] = nil
    end
end

-- Configurar o tema 'onedark'
require('onedark').setup()
EOF
