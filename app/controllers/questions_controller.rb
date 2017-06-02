class QuestionsController < ApplicationController
  include SessionsHelper
  before_action :login_redirect, only: [:new, :create]
  before_action :question_ownership, only: [:edit, :update, :delete]

  # def index
  # end

  def show
    @question = Question.find_by(id: params[:id])
    @answers = @question.answers

    @errors = "Sorry, not found" if !!@question
  end

  def new
    # @question = Question.new
    @question = current_user.questions.build
  end

  def create
    # @question = Question.new(question_params)
    @question = current_user.questions.build(question_params)

    if @question.save
      redirect_to @question
      # something saying successful
    else
      @errors = @question.errors.full_messages
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def delete
  end

  private
  def question_params
    params.require(:question).permit(:title, :body)
  end

  def question_ownership
    @question = Question.find_by(params[:id])
    redirect_to @question if @question.user != current_user
  end
end
