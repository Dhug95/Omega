require 'rails_helper'

RSpec.describe "prenotations/edit", type: :view do
  before(:each) do
    @prenotation = assign(:prenotation, Prenotation.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit prenotation form" do
    render

    assert_select "form[action=?][method=?]", prenotation_path(@prenotation), "post" do

      assert_select "input[name=?]", "prenotation[name]"
    end
  end
end
