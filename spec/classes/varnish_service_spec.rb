require 'spec_helper'

describe 'varnish::service', :type => :class do

  it { should contain_service('varnish') }

end
