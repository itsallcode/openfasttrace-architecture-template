local function is_html (format)
  return format == 'html' or format == 'html4' or format == 'html5'
end

function Link(link)
  if is_html then
    target = link.target
    if string.find(target, "^https?://") then
      -- leave links to project-external resources alone
    else
      hashTagPos = string.find(target, "#")
      if hashTagPos then
        target = string.sub(target, hashTagPos)      
      else
        if string.find(target, "%.md$") or string.find(target, "%.markdown") then
          target = string.gsub(target, "(.*)[/\\]", "")
          target = string.gsub(target, "[_ ]", "-")
          target = string.gsub(target, "%.md$", "")
          target = string.gsub(target, "%.markdown$", "")
          target = "#" .. target
        end
      end
    end
    link.target = target  
  end
  return link
end