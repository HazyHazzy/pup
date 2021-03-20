class UpdateHealthIssueColumnInBreeds < ActiveRecord::Migration[6.0]
  def change
    rename_column :breeds, :health_issue, :health_issues
    change_column :breeds, :health_issues, 'integer USING CAST(health_issues AS integer)'
  end
end
