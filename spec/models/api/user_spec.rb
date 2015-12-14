require 'rails_helper'

describe User, :type => :model do

  let(:user) { build :user }

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }

end