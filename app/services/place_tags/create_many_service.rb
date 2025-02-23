module PlaceTags
  class CreateManyService
    def initialize(place, tags)
      @place = place
      @tags = tags
    end

    def call
      ActiveRecord::Base.transaction do
        @tags.each do |tag|
          PlaceTag.create!(tag: tag, place: @place)
        end
      end
    end
  end
end
