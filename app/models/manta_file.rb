class MantaFile < MantaObj

  def file_data
    file_data, headers = manta_client.get_object(full_path)
    file_data
  end

  def delete
    file_status, headers = manta_client.delete_object(full_path)
    file_status
  end
  
  def signed_url(valid_for)
    "https://#{manta_client.gen_signed_url(Time.now + valid_for, :get, full_path)}"
  end

end
