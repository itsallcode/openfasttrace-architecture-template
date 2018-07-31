function Link(el)
  local htmllink = string.gsub(pandoc.Plain(el), ' ','-').lower()
  el.target = "#"..htmllink
  return el
end