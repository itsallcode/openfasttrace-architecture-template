local vars = {}

function get_vars(meta)
  for k, v in pairs(meta) do
    if v then
      vars["$" .. k .. "$"] = v
    end
  end
end

function replace(element)
  if vars[element.text] then
    return pandoc.Span(vars[element.text])
  else
    return element
  end
end

return {{Meta = get_vars}, {Str = replace}}