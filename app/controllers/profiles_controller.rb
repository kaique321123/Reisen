class ProfilesController < ApplicationController
  #before_action :authenticate_user! # Se usar Devise ou similar

  def edit
    @user = (respond_to?(:current_user) && current_user) || User.first # usa current_user quando disponível
  end

  def update
  @user = (respond_to?(:current_user) && current_user) || User.first

    # remover avatar quando solicitado via checkbox
    if params[:remove_avatar] == '1'
      @user.avatar.purge_later if @user.avatar.attached?
    end

    if @user.update(profile_params)
      redirect_to edit_profile_path, notice: 'Perfil atualizado com sucesso.'
    else
      render :edit
    end
  end

  private

  def profile_params
    params.require(:user).permit(:username, :display_name, :email, :avatar)
  end
end