object @package
cache @package

attributes    :id,
              :description,
              :downloads,
              :name,
              :created_at

child(developer: :developer) { attributes :id, :dev_id, :name, :email }