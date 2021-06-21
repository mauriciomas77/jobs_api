class AdvicesController < ApplicationController
  def create
    advice = Advice.new(advice_params)
    advice.company = @user.company
    if advice.valid?
      advice.save!
      render json: { advice: advice, status: 200 }
    else
      render json: { error: "El aviso no pudo crearse: #{errors_details(advice)}" }
    end
  end

  private

  def errors_details(advice)
    advice.errors.full_messages.join(' - ')
  end

  def advice_params
    params.permit(:id, :title, :description, :company_id)
  end
end
