require 'spec_helper'

describe Store do
  it { should belong_to :user }
  it { should have_many :items }
end
