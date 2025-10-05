class ProfilesController < ApplicationController
  #before_action :authenticate_user! # Se usar Devise ou similar

def edit
  @user = User.first # ou User.find(1) ou outro id válido
end

def update
  @user = User.first # ou User.find(1)
  if @user.update(profile_params)
    redirect_to edit_profile_path, notice: 'Perfil atualizado com sucesso.'
  else
    render :edit
  end
end

  private

  def profile_params
    params.require(:user).permit(:username, :display_name, :email)
  end
end