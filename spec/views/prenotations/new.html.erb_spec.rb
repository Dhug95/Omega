require 'rails_helper'

RSpec.describe "prenotations/new", type: :view do
  before(:each) do
    assign(:prenotation, Prenotation.new(
      :name => "MyString"
    ))
  end

  it "renders new prenotation form" do
    render

    assert_select "form[action=?][method=?]", prenotations_path, "post" do

      assert_select "input[name=?]", "prenotation[name]"
    end
  end
end
