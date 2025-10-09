class ChecklistsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_checklist, only: [:show, :edit, :update, :destroy]
  def show
  end

  def new
    @checklist = Checklist.new
  end

  def create
    @checklist = current_user.checklists.new(checklist_params)
    if @checklist.save
      redirect_to @checklist, notice: 'Checklist criada com sucesso'
    else
      render :new, status: :unprocessable_content
    end
  end

  def edit
  end

  def update
    if @checklist.update(checklist_params)
      redirect_to @checklist, notice: 'Checklist atualizada com sucesso'
    else
      render :edit, status: :unprocessable_content
    end
  end

  def destroy
    @checklist.destroy
    redirect_to @checklist, notice: 'Checklist deletada com sucesso'
  end

  private

  def set_checklist
    @checklist = current_user.checklists.find(params[:id])
  end

  def checklist_params
    params.require(:checklist).permit(:title)
  end
end
