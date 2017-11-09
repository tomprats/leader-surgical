class FileUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  def store_dir
    "#{model.class.name.pluralize.underscore.dasherize}/#{model.id}"
  end

  def extension_white_list
    %w(csv doc docx gif jpe jpeg jpg m4a m4v mp3 mp4 mp4v pdf png ppt pptx txt wav xml xls xlsx xml)
  end

  def filename
    "file.#{file.extension}" if original_filename
  end
end
