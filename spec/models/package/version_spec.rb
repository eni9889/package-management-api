describe Package::Version do
  fg_let(:package)
  let(:version) { create(:package_version, package: package) }

  describe 'scope :pending' do
    it { expect(package.versions.pending).to eq([version]) }
  end

  describe '#processed?' do
    let(:version) { create(:package_version, package: package, md5: 'b7e27f74b1da3a9640558910cbea52a7') }

    it { expect(version).to be_processed }
  end

  describe '#downloads=' do
    before { version.update!(downloads: 1000) }

    it do
      expect(version.downloads).to eq(1000)
      expect(version.download_counts.last.count).to eq(1000)
    end
  end

end