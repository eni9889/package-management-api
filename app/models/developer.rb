class Developer < ActiveRecord::Base
  store_accessor :contact_info, :emails
  has_many :identifiers
  has_many :packages

  def update_contact_info(args)
    args.each_key do |channel|
      contacts = self.contact_info[channel.to_s] || []
      contacts << args[channel]
      contacts.uniq! { |c| c[channel.to_s.singularize] }
      self.update!(contact_info: contact_info.merge(channel => contacts))
    end
  end
end
