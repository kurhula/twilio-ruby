##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /       

module Twilio
  module REST
    class Api < Domain
      class V2010 < Version
        class AccountContext < InstanceContext
          class AuthorizedConnectAppList < ListResource
            ##
            # Initialize the AuthorizedConnectAppList
            # @param Version version: Version that contains the resource
            # @param account_sid: The unique sid that identifies this account
            
            # @return AuthorizedConnectAppList AuthorizedConnectAppList
            def initialize(version, account_sid: nil)
              super(version)
              
              # Path Solution
              @solution = {
                  account_sid: account_sid
              }
              @uri = "/Accounts/#{@solution[:account_sid]}/AuthorizedConnectApps.json"
            end
            
            ##
            # Lists AuthorizedConnectAppInstance records from the API as a list.
            # Unlike stream(), this operation is eager and will load `limit` records into
            # memory before returning.
            # @param Integer limit: Upper limit for the number of records to return. stream()
            #                   guarantees to never return more than limit.  Default is no limit
            # @param Integer page_size: Number of records to fetch per request, when not set will use
            #                       the default value of 50 records.  If no page_size is defined
            #                       but a limit is defined, stream() will attempt to read the
            #                       limit with the most efficient page size, i.e. min(limit, 1000)
            
            # @return Array Array of up to limit results
            def list(limit: nil, page_size: nil)
              self.stream(
                  limit: limit,
                  page_size: page_size
              ).entries
            end
            
            ##
            # Streams AuthorizedConnectAppInstance records from the API as an Enumerable.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            # @param Integer limit: Upper limit for the number of records to return. stream()
            #                   guarantees to never return more than limit.  Default is no limit
            # @param Integer page_size: Number of records to fetch per request, when not set will use
            #                       the default value of 50 records.  If no page_size is defined
            #                       but a limit is defined, stream() will attempt to read the
            #                       limit with the most efficient page size, i.e. min(limit, 1000)
            
            # @return Enumerable Enumerable that will yield up to limit results
            def stream(limit: nil, page_size: nil)
              limits = @version.read_limits(limit, page_size)
              
              page = self.page(
                  page_size: limits['page_size'],
              )
              
              @version.stream(page, limit: limits['limit'], page_limit: limits['page_limit'])
            end
            
            ##
            # When passed a block, yields AuthorizedConnectAppInstance records from the API.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            # @param Integer limit: Upper limit for the number of records to return. stream()
            #                   guarantees to never return more than limit.  Default is no limit
            # @param Integer page_size: Number of records to fetch per request, when not set will use
            #                       the default value of 50 records.  If no page_size is defined
            #                       but a limit is defined, stream() will attempt to read the
            #                       limit with the most efficient page size, i.e. min(limit, 1000)
            def each
              limits = @version.read_limits
              
              page = self.page(
                  page_size: limits['page_size'],
              )
              
              @version.stream(page,
                              limit: limits['limit'],
                              page_limit: limits['page_limit']).each {|x| yield x}
            end
            
            ##
            # Retrieve a single page of AuthorizedConnectAppInstance records from the API.
            # Request is executed immediately.
            # @param String page_token: PageToken provided by the API
            # @param Integer page_number: Page Number, this value is simply for client state
            # @param Integer page_size: Number of records to return, defaults to 50
            
            # @return Page Page of AuthorizedConnectAppInstance
            def page(page_token: nil, page_number: nil, page_size: nil)
              params = {
                  'PageToken' => page_token,
                  'Page' => page_number,
                  'PageSize' => page_size,
              }
              response = @version.page(
                  'GET',
                  @uri,
                  params
              )
              return AuthorizedConnectAppPage.new(
                  @version,
                  response,
                  account_sid: @solution['account_sid'],
              )
            end
            
            ##
            # Constructs a AuthorizedConnectAppContext
            # @param connect_app_sid: The connect_app_sid
            
            # @return AuthorizedConnectAppContext AuthorizedConnectAppContext
            def get(connect_app_sid)
              AuthorizedConnectAppContext.new(
                  @version,
                  account_sid: @solution[:account_sid],
                  connect_app_sid: connect_app_sid,
              )
            end
            
            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Api.V2010.AuthorizedConnectAppList>'
            end
          end
        
          class AuthorizedConnectAppPage < Page
            ##
            # Initialize the AuthorizedConnectAppPage
            # @param Version version: Version that contains the resource
            # @param Response response: Response from the API
            # @param account_sid: The unique sid that identifies this account
            
            # @return AuthorizedConnectAppPage AuthorizedConnectAppPage
            def initialize(version, response, account_sid: nil)
              super(version, response)
              
              # Path Solution
              @solution = {
                  'account_sid' => account_sid,
              }
            end
            
            ##
            # Build an instance of AuthorizedConnectAppInstance
            # @param Hash payload: Payload response from the API
            
            # @return AuthorizedConnectAppInstance AuthorizedConnectAppInstance
            def get_instance(payload)
              return AuthorizedConnectAppInstance.new(
                  @version,
                  payload,
                  account_sid: @solution['account_sid'],
              )
            end
            
            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Api.V2010.AuthorizedConnectAppPage>'
            end
          end
        
          class AuthorizedConnectAppContext < InstanceContext
            ##
            # Initialize the AuthorizedConnectAppContext
            # @param Version version: Version that contains the resource
            # @param account_sid: The account_sid
            # @param connect_app_sid: The connect_app_sid
            
            # @return AuthorizedConnectAppContext AuthorizedConnectAppContext
            def initialize(version, account_sid, connect_app_sid)
              super(version)
              
              # Path Solution
              @solution = {
                  account_sid: account_sid,
                  connect_app_sid: connect_app_sid,
              }
              @uri = "/Accounts/#{@solution[:account_sid]}/AuthorizedConnectApps/#{@solution[:connect_app_sid]}.json"
            end
            
            ##
            # Fetch a AuthorizedConnectAppInstance
            # @return AuthorizedConnectAppInstance Fetched AuthorizedConnectAppInstance
            def fetch
              params = {}
              
              payload = @version.fetch(
                  'GET',
                  @uri,
                  params,
              )
              
              return AuthorizedConnectAppInstance.new(
                  @version,
                  payload,
                  account_sid: @solution['account_sid'],
                  connect_app_sid: @solution['connect_app_sid'],
              )
            end
            
            ##
            # Provide a user friendly representation
            def to_s
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Api.V2010.AuthorizedConnectAppContext #{context}>"
            end
          end
        
          class AuthorizedConnectAppInstance < InstanceResource
            ##
            # Initialize the AuthorizedConnectAppInstance
            # @return AuthorizedConnectAppInstance AuthorizedConnectAppInstance
            def initialize(version, payload, account_sid: nil, connect_app_sid: nil)
              super(version)
              
              # Marshaled Properties
              @properties = {
                  'account_sid' => payload['account_sid'],
                  'connect_app_company_name' => payload['connect_app_company_name'],
                  'connect_app_description' => payload['connect_app_description'],
                  'connect_app_friendly_name' => payload['connect_app_friendly_name'],
                  'connect_app_homepage_url' => payload['connect_app_homepage_url'],
                  'connect_app_sid' => payload['connect_app_sid'],
                  'date_created' => Twilio.deserialize_rfc2822(payload['date_created']),
                  'date_updated' => Twilio.deserialize_rfc2822(payload['date_updated']),
                  'permissions' => payload['permissions'],
                  'uri' => payload['uri'],
              }
              
              # Context
              @instance_context = nil
              @params = {
                  'account_sid' => account_sid,
                  'connect_app_sid' => connect_app_sid || @properties['connect_app_sid'],
              }
            end
            
            ##
            # Generate an instance context for the instance, the context is capable of
            # performing various actions.  All instance actions are proxied to the context
            # @return AuthorizedConnectAppContext AuthorizedConnectAppContext for this AuthorizedConnectAppInstance
            def context
              unless @instance_context
                @instance_context = AuthorizedConnectAppContext.new(
                    @version,
                    @params['account_sid'],
                    @params['connect_app_sid'],
                )
              end
              @instance_context
            end
            
            def account_sid
              @properties['account_sid']
            end
            
            def connect_app_company_name
              @properties['connect_app_company_name']
            end
            
            def connect_app_description
              @properties['connect_app_description']
            end
            
            def connect_app_friendly_name
              @properties['connect_app_friendly_name']
            end
            
            def connect_app_homepage_url
              @properties['connect_app_homepage_url']
            end
            
            def connect_app_sid
              @properties['connect_app_sid']
            end
            
            def date_created
              @properties['date_created']
            end
            
            def date_updated
              @properties['date_updated']
            end
            
            def permissions
              @properties['permissions']
            end
            
            def uri
              @properties['uri']
            end
            
            ##
            # Fetch a AuthorizedConnectAppInstance
            # @return AuthorizedConnectAppInstance Fetched AuthorizedConnectAppInstance
            def fetch
              @context.fetch()
            end
            
            ##
            # Provide a user friendly representation
            def to_s
              context = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Api.V2010.AuthorizedConnectAppInstance #{context}>"
            end
          end
        end
      end
    end
  end
end