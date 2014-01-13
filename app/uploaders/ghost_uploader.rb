# encoding: utf-8

class GhostUploader < CarrierWave::Uploader::Base

    if Rails.env.production?
      storage :fog
    else
      storage :file
    end

    def store_dir
      "uploads"
    end

    def filename
      "#{original_filename}_#{Time.now.to_i + [*1..100].sample}.jpg" if original_filename
    end

end
