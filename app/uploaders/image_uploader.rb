class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  def store_dir
    "#{model.class.name.pluralize.underscore.dasherize}/#{model.id}"
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def filename
    "image.#{file.extension}" if original_filename
  end

  version :square do
    process resize_to_fill: [400, 400]

    def full_filename(for_file = model.logo.file)
      "image_square.#{for_file.split(".").last}"
    end
  end
end
