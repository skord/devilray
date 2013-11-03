class MantaDir < MantaObj

  def list_directory
    contents = manta_client.list_directory(self.full_path)[0]
    contents.collect! do |content|
      content["full_path"] = self.full_path + "/#{content["name"]}"
      if content["type"] == "object"
        content = MantaFile.new(content.merge!(user_id: self.user_id))
      elsif content["type"] == "directory"
        content = MantaDir.new(content.merge!(user_id: self.user_id))
      end
    end
    contents
  end

end

