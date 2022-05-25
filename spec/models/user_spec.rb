require 'rails_helper'

RSpec.describe User, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  subject {
    described_class.new(
      name: "ANYTHING",
      
      )
  }  

  
  
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    subject.name = nil
    #ouvrier = Ouvrier.new(name: nil)
    expect(subject).to_not be_valid
  end
end
