class MantaFilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_manta_dir, only: [:index]

  def index
    @manta_files = @manta_dir.list_directory
  end

  private

   def set_manta_dir
    path = params[:manta_path] || "/#{current_manta_account.manta_username}/stor"
    @manta_dir = MantaDir.new(full_path: path, user: current_user)
  end
end
