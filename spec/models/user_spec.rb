require 'rails_helper'

describe User, type: :model do
  it { is_expected.to validate_presence_of(:uid) }
  it { is_expected.to validate_presence_of(:token) }
  it { is_expected.to validate_presence_of(:refresh_token) }
  it { is_expected.to validate_presence_of(:token_expires) }
end
