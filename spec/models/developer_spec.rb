describe Developer, type: :model do
  describe '#update_contact_info' do
    fg_let!(:developer)
    before { developer.update_contact_info(emails: { name: 'John', email: 'new_email@examlpe.com' }) }

    it do
      expect(developer.reload.emails.count).to eq(2)
    end
  end
end
