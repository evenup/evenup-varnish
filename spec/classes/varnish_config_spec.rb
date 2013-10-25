require 'spec_helper'

describe 'varnish::config', :type => :class do
  let(:params) { {
    :listen_address       => '0.0.0.0',
    :vcl_source           => 'a vcl goes here',
    :listen_port          => 80,
    :admin_listen_address => '127.0.0.1',
    :admin_listen_port    => 6081,
    :secret_file          => '/etc/varnish/secret',
    :min_threads          => 50,
    :max_threads          => 100,
    :thread_timeout       => 120,
    :storage_size         => '1G',
    :ttl                  => 120,
  } }

  context 'default' do
    it { should contain_file('/etc/varnish/varnish.vcl') }
    it { should contain_file('/etc/sysconfig/varnish') }
  end

  context 'debian-based' do
    let(:facts) { { :operatingsystem => 'debian' } }
    it { should contain_file('/etc/default/varnish') }
  end

end
