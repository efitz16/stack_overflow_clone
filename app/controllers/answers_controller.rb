class AnswersController < ApplicationController
  include SessionsHelper
  before_action :login_redirect, only: [:new, :create]
  before_action :answer_owner, only: [:edit, :update, :delete]

  def index
  end

  def show
  end

  def new
    @question = Question.find_by(id: params[:question_id])
    @answer = @question.answers.build
  end

  def create
    @answer = Question.find_by(id: params[:question_id]).answers.build(answer_params)
    @answer.user = current_user

    if @answer.save
      redirect_to @answer.question
    else
      @errors = @answer.errors.full_messages
    end
  end

  def edit
  end

  def update
  end

  def delete
  end

  private
  def answer_params
    params.require(:answer).permit(:body)
  end

  def answer_owner
    @answer = Answer.find_by(params[:id])

    redirect_to @answer.question if @answer.user != current_user
  end
end
