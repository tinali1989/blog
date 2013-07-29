#used to controll detail/summary
module PostsHelper
  def truncate_with_more (text,id)
    i=0
    tempText = ''
    result = ''
    while i<text.length do 
      tempText+=text[i,60]
      tempText += "<br>"
      i += 60
    end
    
    if text.length > 20
      result += "<span id='text_#{id}'>"
      result += text[0, 20]
      result += "</span>"
      result += "<span id='text_more_link_#{id}'>&hellip;"
      result += "......<a href='#' onclick='$(\"text_more_#{id}\").show(); $(\"text_more_link_#{id}\").hide(); $(\"text_#{id}\").hide(); return false;'>"
      result += "detail</a></span>"
      result += "<span id='text_more_#{id}' style='display: none;'>"
      result += tempText
      result += "</span>"
    else
     result = text
    end
    
    result
  end
  
  #separate the record into several lines
  def formatOutPut (text)
    i=0
    tempText = ''
    while i<text.length do 
      tempText+=text[i,60]
      tempText += "<br>"
      i += 60
    end
    return tempText
  end
end
