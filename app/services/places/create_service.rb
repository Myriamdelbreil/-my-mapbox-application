module Places
  class CreateService < ApplicationService
    def initialize(params, user)
      @user = user
      @place = Place.new(user: user)
      @place_params = params.except(:place_tags)
      @place_tags_params = params[:place_tags].split(',')
    end

    def call
      ActiveRecord::Base.transaction do
        @place.assign_attributes(@place_params)
        @place.save!
        if @place_tags_params.present?
          tags_service_result = Tags::CreateManyService.new(@place_tags_params, @user).call
          PlaceTags::CreateManyService.new(@place, tags_service_result[:success]).call
        end
      end
      { success: true, result: @place }
    rescue ActiveRecord::RecordInvalid => e
      { error: e.message }
    end
  end
end
