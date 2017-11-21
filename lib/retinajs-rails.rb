module RetinaJs
  class Engine < ::Rails::Engine
  end
end

module ImageHelper
  def retina_image_tag(source, options={})
    resolution = options.delete(:resolution) || 2
    updated_source = source.gsub(%r[.[^.]*$], "@#{resolution}x\\0")
    image_tag(source, options.merge(data: { rjs: asset_path(updated_source) }))
  end
end
ActionView::Base.send :include, ImageHelper
