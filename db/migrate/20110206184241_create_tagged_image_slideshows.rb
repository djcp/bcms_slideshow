class CreateTaggedImageSlideshows < ActiveRecord::Migration
  def self.up
    create_content_table :tagged_image_slideshows do |t|
      t.integer :width, :default => 640
      t.string :image_zoom, :default => 'width'
      t.integer :height, :default => 480
      t.string :image_order, :default => 'name'
      t.integer :quality, :default => 85
      t.integer :speed, :default => 1000
      t.integer :timeout, :default => 4000
      t.boolean :do_not_loop
      t.boolean :emit_jquery, :default => false
      t.string :effect, :default => 'fade'
    end
    ContentType.create!(:name => "TaggedImageSlideshow", :group_name => "Slideshow")
  end

  def self.down
    ContentType.delete_all(['name = ?', 'TaggedImageSlideshow'])
    CategoryType.all(:conditions => ['name = ?', 'Slideshow']).each(&:destroy)
    #If you aren't creating a versioned table, be sure to comment this out.
    drop_table :tagged_image_slideshow_versions
    drop_table :tagged_image_slideshows
  end
end
