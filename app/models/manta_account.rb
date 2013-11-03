class MantaAccount < ActiveRecord::Base
  belongs_to :user
  before_save :set_active
  validates :manta_username, presence: true
  validates :manta_host, presence: true
  validates :manta_private_key, presence: true

  def set_active
    if self.active == true || self.user.manta_accounts.any? {|acct| !acct.active? }
      active = true
      self.user.manta_accounts.where("id != ?", self.id).update_all(active: false)
    end
  end
end
