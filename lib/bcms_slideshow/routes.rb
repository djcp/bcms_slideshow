module Cms::Routes
  def routes_for_bcms_slideshow
    namespace(:cms) do |cms|
      cms.content_blocks :tagged_image_slideshows
    end  
  end
end
