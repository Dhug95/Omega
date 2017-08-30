require 'rails_helper'

RSpec.describe "prenotations/show", type: :view do
  before(:each) do
    @prenotation = assign(:prenotation, Prenotation.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
