local Color = {};

inspect = require("Lib/StdLib/Inspect");

function Color.print(textTable, indent)
    if type(textTable) == "string" then
        textTable = {{text = textTable}};
    end
    local indentString = "";
    if indent ~= nil then
        for i = 0, indent - 1 do
            indentString = indentString .. "    ";
        end
    end
    local allTexts = {};
    local allColors = {};
    local firstString = true;
    for k, v in pairs(textTable) do
        local cText = v.text;
        if firstString then
            firstString = false;
            cText = indentString .. v.text;
        else
            cText = v.text;
        end
        table.insert(allTexts, SFML.WString(cText));
        if v.color ~= nil then
            table.insert(allColors, SFML.Color(v.color[1], v.color[2], v.color[3]));
        else
            table.insert(allColors, SFML.Color.White);
        end
    end
    _term_display(allTexts, allColors);
end

return Color;