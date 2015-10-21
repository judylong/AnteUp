module Api
  class CardsController < ApiController
    def create
      @card = Card.new(card_params)
      if @card.save
        render json: "success"
      else
        render json: @card.errors.full_messages, status: :unprocessable_entity
      end
    end

    def show
      @card = Card.find(params[:id])
    end

    def index
      @cards = Card.all
    end

    private
    def card_params
      params.require(:card).permit(:name,
        :card_text,
        :card_type,
        :monster_type,
        :family,
        :attack,
        :defense,
        :level,
        :property)
    end
  end
end
