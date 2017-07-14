AdminUser.find_or_create_by!(email: 'admin@sampleapp.com') do |admin|
  admin.password              = 'some_password'
  admin.password_confirmation = 'some_password'
end
