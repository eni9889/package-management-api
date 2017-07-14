describe Package, type: :model do
  fg_let(:package)

  describe '#downloads=' do
    before { package.update!(downloads: 1000) }

    it do
      expect(package.downloads).to eq(1000)
      expect(package.download_counts.last.count).to eq(1000)
    end
  end
end