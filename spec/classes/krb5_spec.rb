require 'spec_helper'

describe 'krb5' do
  let(:title) { 'krb5' }

  osfamily = 'RedHat'
  describe "krb5 class" do 
    let(:params) {{
      :default_realm => 'MYORG.LOCAL',
      :kdc => 'kdc.myorg.local',
      :admin_server => 'admin.myorg.local',
      :sssd => 'true'
    }}
    let(:facts) { { :osfamily => osfamily } }

    it { should create_class('krb5') }
    it { should create_package('krb5-libs') }
    it { should create_package('krb5-workstation') }
    it { should create_package('pam_krb5') }
    it { should create_package('oddjob-mkhomedir') }
    it { should create_package('sssd-client') }
    it { should create_service('oddjobd') }
    it { should create_file('/etc/krb5.conf') }
    it {
      should create_file('/etc/krb5.conf')\
      .with_content(/default_realm = MYORG.LOCAL$/)
    }
  end
end
