class AddAuthTokenToVotes < ActiveRecord::Migration[7.0]
  def change
    add_column :votes, :user_token_id, :string, default: nil
  end
end
