class Picture < ActiveRecord::Base

  has_attached_file :image,
    :path => ":rails_root/public/system/:class/:attachment/:id/:basename-:style.:extension",
    :url => "/system/:class/:attachment/:id/:basename-:style.:extension",
    :styles => {
      :small  => "100x100#",
      :medium => "300x300",
      :large  => "460x460",
      :util => "600x600",
      :desired => "700x700"
         },
    :processors => [:cropper]

  after_update :reprocess_image, :if => :cropping?

  def cropping?
    !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
  end

  def image_geometry(style = :original)
    @geometry ||= {}
    @geometry[style] ||= Paperclip::Geometry.from_file(image.path(style))
  end

  private

  def reprocess_image
    image.reprocess!
  end
end
