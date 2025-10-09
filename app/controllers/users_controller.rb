class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:edit, :update, :destroy]

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to profile_path, notice: 'Usuário atualizado com sucesso.'
    else
      render :edit, status: :unprocessable_content
    end
  end

  def destroy
    @user.destroy
    redirect_to root_path, notice: 'Usuário deletado com sucesso'
  end

  private

  def set_user
    # Define o usuário como o usuário atual
    @user = current_user
  end

  def user_params
    # Define quais parâmetros podem ser atualizados do usuário
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
