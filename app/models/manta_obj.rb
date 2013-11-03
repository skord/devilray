class MantaObj
  include ActiveModel::Model
  attr_accessor :name, :etag, :size, :type, :mtime, :full_path, :user_id


  def user=(user)
    self.user_id = user.id
  end

  def user
    User.find(self.user_id)
  end

  def manta_client
    client = MantaClient.new(user.active_manta_account.manta_host,
                             user.active_manta_account.manta_username,
                             user.active_manta_account.manta_private_key)
  end

  def persisted?
    true
  end

end


