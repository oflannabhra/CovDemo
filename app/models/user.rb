class User < ActiveRecord::Base
  belongs_to :group
  accepts_nested_attributes_for :group
  
  def group_name
    Group.find(self.group_id).name
  end
  
  def active?
    active
  end
  
  def admin?
    is_admin
  end
  
  def activate!
    self.active = true
    save
  end
  
  def deactivate!
    self.active = false
    save
  end
  
  def send_activation_instructions!
    reset_perishable_token!
    Notifier.activation_instructions(self).deliver
  end
  
  def send_activation_confirmation!
    reset_perishable_token!
    Notifier.activation_confirmation(self).deliver
  end
  
  def send_forgot_password!
    reset_perishable_token!
    Notifier.forgot_password(self).deliver
  end
  
  def make_admin!
    self.is_admin = true
    save
  end
  
  def remove_admin!
    self.is_admin = false
    save
  end
  
  acts_as_authentic do |c|
    c.merge_validates_length_of_password_field_options({:minimum => 8})
    end
end
