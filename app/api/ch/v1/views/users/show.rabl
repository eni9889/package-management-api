object @user

attributes  :id,
            :first_name,
            :middle_name,
            :last_name,
            :email,
            :user_type,
            :photo_url,
            :job_title_description,
            :confirmed_email,
            :confirmed_phone

node(:address) { |this_item|
       address = this_item.addresses.last
       { id: address.id, address_line_1: address.address_line_1, address_line_2: address.address_line_2, city: address.city, state: address.state, zipcode: address.zipcode, address_type: address.address_type } if address
}
