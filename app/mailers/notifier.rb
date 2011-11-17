class Notifier < ActionMailer::Base
  default :from => "no-reply@covenantgroup.com"
  default_url_options[:host => "localhost:3000"]
  
  def forgot_password(user)
    @reset_password_url = reset_password_url(user.perishable_token)
    
    mail( :to   => user.email,
          :subject   => "Password Reset Instructions"
          ) do |format|
            format.text
          end
  end
  def activation_instructions(user)
    @account_activation_url = activate_account_url(user.perishable_token)
    
    mail( :to  => user.email,
          :subject => "Activation Instructions"
          ) do |format|
            format.text
          end
  end
  def activation_confirmation(user)
    mail( :to => user.email,
          :subject => "Activation Complete"
          ) do |format|
            format.text
          end
  end
  
end
