class Bro
  attr_accessor :id, :created_at, :email, :password, :api_key, :saved

  def initialize(options)
    @email = options[:email] if options.has_key? :email
    @password = options[:password] if options.has_key? :password
  end

  def saved?
    @saved
  end

  def signup(&block)
    @saved = false

    if (@email =~ /\A.+@.+\.(com|org|net|me|edu|ca|us|co\.uk)\z/) != 0
      # show notification: invalid email address
      return
    end

    bro_data = {:bro => {
      :email => @email,
      :password => @password
    }}

    BW::HTTP.post(BaseURL + '/bro', {payload: bro_data}) do |response|
      if response.ok?
        @saved = true
      else
        @saved = false
      end
      block.call
    end
  end
end
