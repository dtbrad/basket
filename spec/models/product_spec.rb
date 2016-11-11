require 'rails_helper'

RSpec.describe Product, type: :model do

  it "is valid with a name" do
    expect(FactoryGirl.build(:product)).to be_valid
  end

  it "is invalid without a name" do
    product = FactoryGirl.build(:product, name: nil)
    product.valid?
    expect(product.errors[:name]).to include("can't be blank")
  end

  it "is invalid with a duplicate name" do
    FactoryGirl.create(:product, name: 'Cucumber')
    product = FactoryGirl.build(:product, name: 'Cucumber')
    product.valid?
    expect(product.errors[:name]).to include('has already been taken')
  end
end
