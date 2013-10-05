require 'spec_helper'

describe User do
  it { should have_many :stores }
  it { should have_many :items }
end
