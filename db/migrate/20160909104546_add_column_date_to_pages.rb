class AddColumnDateToPages < ActiveRecord::Migration
  def change
    add_column :pages, :date, :varchar
  end
end
