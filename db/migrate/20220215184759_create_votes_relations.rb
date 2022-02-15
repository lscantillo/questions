class CreateVotesRelations < ActiveRecord::Migration[7.0]
  def change
    add_reference :votes, :question, foreign_key: true
    add_reference :votes, :employee, foreign_key: true
  end
end
