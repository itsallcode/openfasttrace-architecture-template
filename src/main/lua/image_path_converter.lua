-- Pandoc renders all chapters with the working directory set to the root of the
-- Markdown sources (src/doc). Chapters in sub-directories reference the diagrams
-- as "../uml/...", so that the links also work on GitHub. Strip the "../" so that
-- the images are found during rendering.
function Image(image)
  image.src = string.gsub(image.src, "^%.%./", "")
  return image
end
