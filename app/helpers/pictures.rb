module Pictures
	def display_artist_img(pin,width,height,url="main",class_name=nil)
		image_tag "/images/placeholder/#{width}x#{height}"
    #image_tag(eval("pin.#{url}_url"), :class=> "adjust_#{width}_#{height} #{class_name}",:alt=> "#{pin.professional_nickname}",:onerror => "javascript:(this.src='http://#{configatron.host}/images/placeholder/#{width}x#{height}')")
    rescue
    image_tag "/images/placeholder/#{width}x#{height}"
  end
end
