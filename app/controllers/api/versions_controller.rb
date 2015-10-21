module Api
  class VersionsController < ApiController
    def create
      card = Card.find(version_params['card_id'])
      @version = card.versions.new(version_params)
      if @version.save
        render json: "success"
      else
        render json: @version.errors.full_messages, status: :unprocessable_entity
      end
    end

    private
    def version_params
      params.require(:version).permit(:card_id, :set_name, :print_tag, :rarity)
    end
  end
end
