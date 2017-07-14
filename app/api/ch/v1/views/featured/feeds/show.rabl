object @feed

attributes :id

child(:category) { attributes :id, :name }
child(sections: :sections) do
  attributes :id, :section_type, :name

  node(:items) do |section|
    item_container = section.target || section
    item_container.items.map do |item|
      # http://stackoverflow.com/a/25448194/1116374
      item_target = if item.is_a?(Featured::Set::Item)
        item.package
      else
        item.target
      end
      partial item_target.to_partial_path.gsub(/\/([^\/]+)$/, '/show'), object: item_target
    end
  end
end