require 'rails_helper'

describe Garage, :type => :model do

  let(:user) { build :garage }

  it { should validate_presence_of(:name).with_message(/can.t be blank/) }

end