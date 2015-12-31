class DataFetchController < ApplicationController

  def core
    # puts LearningStudioAuthentication.version

    app_id            = ENV['APP_ID']
    app_name          = "Progress Tracker"
    token_key_moniker = ENV['TOKEN_KEY_MONIKER']
    shared_secret     = ENV['SHARED_SECRET']
    client_string     = ENV['CLIENT_STRING']

    username_student  = ENV['USERNAME_STUDENT']
    username_teacher  = ENV['USERNAME_TEACHER']
    password          = ENV['PASSWORD']
    base_uri          = "https://api.learningstudio.com"

    # this is (probably) accounting course ID
    course_id         = "12409825"
    # API_URI           = "/courses/#{COURSE_ID}"
    api_uri           = "/courses/#{course_id}"

    # --------------
    # Authentication
    # --------------
    # a generic carrier for the config information for all auth. methods
    # helpful to have all values in place, in case of using both OAuth 1 and OAuth 2
    config = LearningStudioAuthentication::Config::OAuthConfig.new({
      :application_name => app_name,
      :application_id   => app_id,
      :consumer_key     => token_key_moniker,
      :consumer_secret  => shared_secret,
      :client_string    => client_string
    })

    # instantiates the appropriate service for the auth. method you want to use
    factory = LearningStudioAuthentication::Service::OAuthServiceFactory.new(config)

    # --------
    # Requests
    # --------
    # handles all the work of making an API call
    basic_service = LearningStudioCore::BasicService.new(factory)
    # basic_service.use_oauth2(USERNAME_STUDENT)
    basic_service.use_oauth2(username_teacher)

    begin
      response = basic_service.request('GET', api_uri)
      @content = response.content unless response.error?

      # puts "#{response.status_code} : #{response.status_message}" if response.error?
      # puts "#{response.methods.sort.each { |m| puts m }; nil}" if response.error?
      # puts "#{response.url}" if response.error?
      # puts "#{response.content}" unless response.error?
    rescue Exception => e
      puts "Exception from request calling #{api_uri} : #{e.message}"
    end

    @content = JSON.parse(@content)
  end
end