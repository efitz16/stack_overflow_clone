class AddUserToAnswers < ActiveRecord::Migration[5.0]
  def change
  	add_reference :answers, :user, index: true
  end
end
