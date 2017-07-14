object @collection

attributes :id, :description, :name, :settings, :image_url

child(items: :sets) do
  attributes :set_id
  node(:items) do |item|
    item.set.items.map do |item|
      if package = item.package
        partial package.to_partial_path.gsub(/\/([^\/]+)$/, '/show'), object: package
      end
    end
  end
end