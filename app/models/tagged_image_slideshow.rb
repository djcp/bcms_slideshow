class TaggedImageSlideshow < ActiveRecord::Base
  acts_as_content_block :taggable => true
  validates_numericality_of :width, :height, :speed, :timeout

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
