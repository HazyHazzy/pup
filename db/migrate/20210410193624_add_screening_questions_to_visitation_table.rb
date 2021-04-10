class AddScreeningQuestionsToVisitationTable < ActiveRecord::Migration[6.0]
  def change
    rename_column :visitations, :screening_question, :why_dog
    add_column :visitations, :have_dog, :text
    add_column :visitations, :why_interested, :text
    add_column :visitations, :health_issues_aware, :text
    add_column :visitations, :primary_caretaker, :text
    add_column :visitations, :dewelling, :text
    add_column :visitations, :have_children, :text
    add_column :visitations, :lifestyle, :text
    add_column :visitations, :hours_dog_leftalone, :text
  end
end
