require 'rails_helper'

RSpec.describe "prenotations/index", type: :view do
  before(:each) do
    assign(:prenotations, [
      Prenotation.create!(
        :name => "Name"
      ),
      Prenotation.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of prenotations" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
