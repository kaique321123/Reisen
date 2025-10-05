# app/controllers/feedbacks_controller.rb
class FeedbacksController < ApplicationController
  before_action :set_feedback, only: [:show]

  def index
    @feedbacks = Feedback.all
  end

  def show; end

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)
    @feedback.usuario = current_usuario

    if @feedback.save
      redirect_to feedbacks_path, notice: "Feedback criado com sucesso."
    else
      render :new
    end
  end

  private

  def set_feedback
    @feedback = Feedback.find(params[:id])
  end

  def feedback_params
    params.require(:feedback).permit(:titulo, :conteudo)
  end
end
