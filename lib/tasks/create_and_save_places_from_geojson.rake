require './app/models/application_record.rb'
require './app/models/user'
task create_and_save_places_from_geojson: :environment do
  places = JSON.parse(File.read('lib/assets/mapstr.geojson'))["features"]
  user = User.first
  user_id = user.id

  places.each do |place|
    new_place = Place.new({
      user_id: user_id,
      name: place["properties"]["name"],
      description: place["properties"]["userComment"],
      icon: place["properties"]["icon"],
      kind: place["properties"]["icon"],
      latitude: place["geometry"]["coordinates"].last,
      longitude: place["geometry"]["coordinates"].first,
    })
    new_place.save!
    Favorite.create!(user: user, place: new_place)
    tags = place["properties"]["tags"]
    tags.each do |tag|
      new_tag = Tag.new(
        {
          name: tag["name"],
          color: tag["color"],
          created_by: user,
        }
      )
      new_tag.save!
      PlaceTag.create!(place: new_place, tag: new_tag)
    end
  end
end
