object @banner

attributes :id, :name, :image_url, :target_type, :target_id

child(target: :target) do |target|
  node(:class) { 'Package' }
  extends target.to_partial_path.gsub(/\/([^\/]+)$/, '/show')
end