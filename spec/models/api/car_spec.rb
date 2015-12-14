require 'rails_helper'

describe Car, :type => :model do

  let(:user) { build :car }

  it { should validate_presence_of(:make).with_message(/can.t be blank/) }
  it { should validate_presence_of(:model).with_message(/can.t be blank/) }
  it { should validate_presence_of(:year).with_message(/can.t be blank/) }

end