class ImageUploader < CarrierWave::Uploader::Base
  # Choose storage type (file storage for local, fog for cloud)
  storage :file

  # Directory where uploaded files will be stored
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Add allowed file types (optional)
  def extension_allowlist
    %w[jpg jpeg png gif]
  end

  # Resize images (optional, requires MiniMagick)
  include CarrierWave::MiniMagick
  process resize_to_limit: [ 800, 800 ]
end
