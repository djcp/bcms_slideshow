class TaggedImageSlideshow < ActiveRecord::Base

  acts_as_content_block :taggable => true
  validates_numericality_of :width, :height, :speed, :timeout, :quality

  IMAGE_ZOOM_OPTIONS = [
    ['Full Width','width'],['Height','height'],['Either','either']
  ]

  IMAGE_ORDER_OPTIONS = [
    ['Image Name','name'],['Image Creation Date','created_at']
  ]

  SPEED_OPTIONS = [
    ['1 second',1000],['1/2 second',500],['1.5 seconds',1500],['2 seconds',2000],['3 seconds',3000],['4 seconds',4000]
  ]

  TIMEOUT_OPTIONS = [
    ['4 seconds',4000],['1 second',1000],['2 seconds',2000],['3 seconds',3000],['5 seconds',5000],['6 seconds',6000],['7 seconds',7000],['8 seconds',8000],['9 seconds',9000],['10 seconds',10000],['15 seconds',15000],['20 seconds',20000],['30 seconds',30000],['1 minute',60000]
  ]

  EFFECT_OPTIONS = [
    'blindX','blindY','blindZ','cover','curtainX','curtainY','fade','fadeZoom','growX','growY','none','scrollUp','scrollDown','scrollLeft','scrollRight','scrollHorz','scrollVert','shuffle','slideX','slideY','toss','turnUp','turnDown','turnLeft','turnRight','uncover','wipe','zoom'
  ]

  validates_inclusion_of :image_zoom, :in => IMAGE_ZOOM_OPTIONS.collect{|o| o[1]}
  validates_inclusion_of :image_order, :in => IMAGE_ORDER_OPTIONS.collect{|o| o[1]}
  validates_inclusion_of :speed, :in => SPEED_OPTIONS.collect{|o| o[1]}
  validates_inclusion_of :timeout, :in => TIMEOUT_OPTIONS.collect{|o| o[1]}
  validates_inclusion_of :effect, :in => EFFECT_OPTIONS

  def geometry
    if self.image_zoom == 'width'
      "#{width}"
    elsif self.image_zoom == 'height'
      "x#{height}"
    else
      "#{width}x#{height}"
    end
  end

  def images
    tag_ids_to_find = self.tags.collect{|t| t.id}
    taggings = Tagging.find(:all, :conditions => {:taggable_type => 'AbstractFileBlock', :tag_id => tag_ids_to_find})
    if taggings.blank?
      nil
    else 
      taggings.collect{|t| t.taggable}.reject{|i| i.class != ImageBlock}.uniq.compact.sort_by{|im| im.send(self.image_order)}
    end
  end

end
