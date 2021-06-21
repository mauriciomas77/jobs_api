class AplicantsController < ApplicationController
  before_action :set_advice, only: [:create, :update]

  def create
    if user_already_apply?
      render json: "Usted ya aplicó a este aviso"
    elsif user_is_the_owner?
      render json: "No puede aplicar al aviso siendo el creador"
    else
      @advice.advice_aplicants << AdviceAplicant.new(aplicant: @user, status_id: 1)
      render json: "Gracias #{@user.first_name}, te has postulado al aviso de #{@advice.title}"
    end
  end

  def update
    if invalid_status?
      render json: "No es un status admisible. Por favor revise sus datos"
    elsif user_is_the_owner?
      set_aplication
      @aplication.update_attributes(status_id: params[:status].to_i)
      render json: "El aplicante cambió su estado a #{Status.find(params[:status].to_i).description}"
    else
      render json: "No puede modificar el status de los aplicantes"
    end
  end

  def set_aplication
    @aplication = AdviceAplicant.where(advice_id: params[:advice_id], aplicant_id: params[:aplicant_id]).first
  end

  def invalid_status?
    !%w[1 2 3].include?(params[:status])
  end

  def user_already_apply?
    @advice.aplicants.include?(@user)
  end

  def user_is_the_owner?
    @advice.company.user.id == @user.id
  end

  def set_advice
    @advice = Advice.find(params[:advice_id])
  end
end
