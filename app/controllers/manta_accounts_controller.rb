class MantaAccountsController < ApplicationController
  before_filter :set_manta_account, except: [:index, :new, :create]
  before_filter :authenticate_user!
  def index
    @manta_accounts = current_user.manta_accounts
  end

  def show
  end

  def new
    @manta_account = current_user.manta_accounts.new
  end

  def create
    @manta_account = current_user.manta_accounts.new(new_manta_account_params)
    if @manta_account.save
      redirect_to manta_account_url(@manta_account)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @manta_account.update_attributes(update_manta_account_params)
      redirect_to manta_account_url(@manta_account), notice: "Account Updated!"
    else
      render :edit
    end
  end

  def destroy
    @manta_account.destroy
    redirect_to manta_accounts_url
  end

  private

  def new_manta_account_params
    params.require(:manta_account).permit(:manta_username, :manta_host, :manta_private_key, :active)
  end

  def update_manta_account_params
    params.require(:manta_account).permit(:manta_username, :manta_host, :active)
  end

  def set_manta_account
    @manta_account = current_user.manta_accounts.find(params[:id])
  end
end
