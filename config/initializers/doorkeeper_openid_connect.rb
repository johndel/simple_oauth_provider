Doorkeeper::OpenidConnect.configure do

  jws_private_key <<eol
-----BEGIN RSA PRIVATE KEY-----
....
-----END RSA PRIVATE KEY-----
eol

  jws_public_key <<eol
-----BEGIN RSA PUBLIC KEY-----
....
-----END RSA PUBLIC KEY-----
eol

  resource_owner_from_access_token do |access_token|
    # Example implementation:
    # User.find_by(id: access_token.resource_owner_id)
  end

  issuer 'issuer string'

  subject do |resource_owner|
    # Example implementation:
    # resource_owner.key
  end

  # Expiration time on or after which the ID Token MUST NOT be accepted for processing. (default 120 seconds).
  # expiration 600

  claims do
    normal_claim :_foo_ do |resource_owner|
      resource_owner.foo
    end

    normal_claim :_bar_ do |resource_owner|
      resource_owner.bar
    end
  end

end