require 'spec_helper'

describe 'varnish', :type => :class do

  let(:params) { { :version => '1.2.3.4' } }

  it { should contain_package('varnish').with_ensure('1.2.3.4') }

end

