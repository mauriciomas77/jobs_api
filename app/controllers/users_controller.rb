class UsersController < ApplicationController
  before_action :authorized, only: [:auto_login]

  # REGISTER
  def create
    User.transaction do
      @user = User.create(user_params)
      if @user.valid?
        token = encode_token({ user_id: @user.id })
        render json: { user: @user, token: token }
        if user_params[:user_type] == 'company'
          company = Company.new(company_name: user_params[:company_name])
          company.user = @user
          if company.valid?
            company.save!
          else
            raise ActiveRecord::Rollback, "La compañía no pudo crearse"
          end
        end
      else
        render json: { error: "Invalid email or password" }
      end
    end
  end

  # LOGGING IN
  def login
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      token = encode_token({ user_id: @user.id })
      render json: { user: @user, token: token }
    else
      render json: { error: "Invalid email or password" }
    end
  end

  def auto_login
    render json: @user
  end

  private

  def user_params
    params.permit(:email, :password, :age, :first_name, :last_name, :user_type, :company_name)
  end
end
