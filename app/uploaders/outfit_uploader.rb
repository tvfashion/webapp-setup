# encoding: utf-8

class OutfitUploader < CarrierWave::Uploader::Base

    include Cloudinary::CarrierWave
    
    def public_id
        return "outfits/"+model.actor_id.to_s+"/"+model.episode_id.to_s+"/"+model.name
    end 
    
end
