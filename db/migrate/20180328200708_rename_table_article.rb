class RenameTableArticle < ActiveRecord::Migration[5.1]
  def change
    rename_table :atricles, :articles
  end
end
