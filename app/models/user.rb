class User < ActiveRecord::Base
  has_many :manta_accounts
  has_one :active_manta_account, -> { where active: true }, class_name: "MantaAccount"
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def setup?
    manta_accounts.any? {|acct| acct.manta_username.present? &&
                          acct.manta_host.present? &&
                          acct.manta_private_key.present?}
  end
end
