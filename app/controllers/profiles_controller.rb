class ProfilesController < ApplicationController
  # Garante que o usuário esteja logado para acessar o seu perfil
  before_action :authenticate_user!
  def show
    # Encontra o usuário com base no ID
    @user = User.find(params[:id])
  end

  def my_profile
    redirect_to profile_path(current_user)
  end
end
