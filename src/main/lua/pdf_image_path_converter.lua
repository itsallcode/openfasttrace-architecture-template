function Image(image)
  src = image.src
    
  src = "../../target/" .. src
  image.src = src  
  
  return image
end
