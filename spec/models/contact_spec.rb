require 'spec_helper'

describe Contact do
  it 'has a valid factory' do
    expect(FactoryGirl.create(:contact)).to be_valid
  end

  # Checking the validations
  it 'is invalid without a firstname' do
    expect(FactoryGirl.build(:contact, firstname: nil)).not_to be_valid
  end

  it 'is invalid without a lastname' do
    expect(FactoryGirl.build(:contact, lastname: nil)).not_to be_valid
  end

  # Checking the instance methods
  it "returns a contact's full name as a string" do
    contact = FactoryGirl.create(:contact, firstname: 'John', lastname: 'Doe')
    expect(contact.name).to eq('John Doe')
  end

  # Checking class methods
  describe '#by_letter' do
    before :each do
      @smith = FactoryGirl.create(:contact, firstname: 'Walden', lastname: 'Smith')
      @jones = FactoryGirl.create(:contact, firstname: 'Michael', lastname: 'Jones')
      @bujo = FactoryGirl.create(:contact, firstname: 'Sonia', lastname: 'Bujo')
    end

    context 'matching letters' do
      it 'returns a sorted array of results that match' do
        expect(Contact.by_letter('j')).to eq([@bujo, @jones])
      end
    end

    context 'non-matching letters' do
      it "returns nil if the result doesn't match" do
        expect(Contact.by_letter('z')).to be_blank
      end
    end
  end

end