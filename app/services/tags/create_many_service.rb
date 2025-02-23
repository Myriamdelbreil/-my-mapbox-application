module Tags
  class CreateManyService < ApplicationService
    def initialize(params, user)
      @params = params
      @user_id = user.id
    end

    def call
      ActiveRecord::Base.transaction do
        tags = @params.map do |param|
          Tag.create!(user_id: @user_id, name: param)
        end
        { success: tags }
      end
    end
  end
end
