require 'spec_helper'

describe 'varnish', :type => :class do

  it { should create_class('varnish') }
  it { should contain_class('varnish::install') }
  it { should contain_class('varnish::config') }
  it { should contain_class('varnish::service') }

end
