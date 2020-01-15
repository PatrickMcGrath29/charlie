class RefillsController < ApplicationController
  before_action :authenticate_user!

  def new
    @refill = Refill.new(user: current_user)
  end

  def create
    @refill = Refill.new(refill_create_params)
  end

  private

  def refill_create_params
    params.require(:refill).permit(:security_code, :refill_amount, :charlie_card_number, :use_default_charlie_card)
  end
end
