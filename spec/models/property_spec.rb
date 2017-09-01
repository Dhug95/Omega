require "rails_helper"

RSpec.describe Property, :type => :model do
  it "Creo Inserzione senza titolo" do
    property = Property.new(:description => "Fantasticissimo!!!", :price => "567.0", :city => "New York, Stati Uniti")
    expect(property).not_to be_valid
  end

  it "Creo Inserzione senza descrizione" do
    property = Property.new(:title => "Eccezionale", :price => "567.0", :city => "New York, Stati Uniti")
    expect(property).not_to be_valid
  end

  it "Creo Inserzione senza prezzo" do
    property = Property.new(:title => "Eccezionale", :description => "Fantasticissimo!!!", :city => "New York, Stati Uniti")
    expect(property).not_to be_valid
  end

  it "Creo Inserzione senza città" do
    property = Property.new(:title => "Eccezionale", :description => "Fantasticissimo!!!", :price => "567.0")
    expect(property).not_to be_valid
  end

  it "Creo inserzione con titolo insufficientemente lungo" do
    user = User.create(:email => "giacominoalberobello@omega.it", :password => "password", :password_confirmation => "password", :username => "giacominoalberobello")
    property = Property.new(:title => "ccc", :description => "Fantasticissimo!!!", :price => "567.0", :city => "New York, Stati Uniti", :user_id => user.id)
    expect(property).not_to be_valid
  end

  it "Creo inserzione con descrizione insufficientemente lunga" do
    user = User.create(:email => "giacominoalberobello@omega.it", :password => "password", :password_confirmation => "password", :username => "giacominoalberobello")
    property = Property.new(:title => "ccccccc", :description => "Too short", :price => "567.0", :city => "New York, Stati Uniti", :user_id => user.id)
    expect(property).not_to be_valid
  end

  it "Creo inserzione con prezzo negativo" do
    user = User.create(:email => "giacominoalberobello@omega.it", :password => "password", :password_confirmation => "password", :username => "giacominoalberobello")
    property = Property.new(:title => "ccccccc", :description => "Fantasticissimo!!!", :price => "-567.0", :city => "New York, Stati Uniti", :user_id => user.id)
    expect(property).not_to be_valid
  end

  it "Creo Inserzione completa" do
    user = User.create(:email => "giacominoalberobello@omega.it", :password => "password", :password_confirmation => "password", :username => "giacominoalberobello")
    property = Property.new(:title => "Eccezionale", :description => "Fantasticissimo!!!", :price => "567.0", :city => "New York, Stati Uniti", :user_id => user.id)
    expect(property).to be_valid
  end

  context "Inserzione con 2 o più recensioni" do
    it "Dovrei vedere le recensioni ordinate per data crescente" do
      user = User.create(:email => "giacominoalberobello@omega.it", :password => "password", :password_confirmation => "password", :username => "giacominoalberobello")
      property = Property.new(:title => "Eccezionale", :description => "Fantasticissimo!!!", :price => "567.0", :city => "New York, Stati Uniti", :user_id => user.id)
      property.save!
      recensione1 = property.reviews.create!(:title => "Prima Recensione", :body => "Questa è la prima recensione", :valutation => 4, :user_id => user.id)
      recensione2 = property.reviews.create!(:title => "Seconda Recensione", :body => "Questa è la seconda recensione", :valutation => 3, :user_id => user.id)
      expect(property.reload.reviews).to eq([recensione1, recensione2])
    end
  end

  context "Inserzione con almeno una recensione" do
    it "Rimozione recensione da una proprietà" do
      user = User.create(:email => "giacominoalberobello@omega.it", :password => "password", :password_confirmation => "password", :username => "giacominoalberobello")
      property = Property.new(:title => "Eccezionale", :description => "Fantasticissimo!!!", :price => "567.0", :city => "New York, Stati Uniti", :user_id => user.id)
      property.save!
      recensione1 = property.reviews.create!(:title => "Prima Recensione", :body => "Questa è la prima recensione", :valutation => 4, :user_id => user.id)
      property.reviews.first.delete
      expect(property.reload.reviews.first).to eq(nil)
    end

  end

end
