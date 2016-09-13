class AddColumnSiteNameToPages < ActiveRecord::Migration
  def change
    add_column :pages, :site_name, :varchar
  end
end
