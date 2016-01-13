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
          class UsageList < ListResource
            class TriggerList < ListResource
              ##
              # Initialize the TriggerList
              # @param Version version: Version that contains the resource
              # @param account_sid: A 34 character string that uniquely identifies this resource.
              
              # @return TriggerList TriggerList
              def initialize(version, account_sid: nil)
                super(version)
                
                # Path Solution
                @solution = {
                    account_sid: account_sid
                }
                @uri = "/Accounts/#{@solution[:account_sid]}/Usage/Triggers.json"
              end
              
              ##
              # Retrieve a single page of TriggerInstance records from the API.
              # Request is executed immediately.
              # @param String callback_url: URL Twilio will request when the trigger fires
              # @param String trigger_value: the value at which the trigger will fire
              # @param trigger.UsageCategory usage_category: The usage category the trigger watches
              # @param String callback_method: HTTP method to use with callback_url
              # @param String friendly_name: A user-specified, human-readable name for the trigger.
              # @param trigger.Recurring recurring: How this trigger recurs
              # @param trigger.TriggerField trigger_by: The field in the UsageRecord that fires the trigger
              
              # @return TriggerInstance Newly created TriggerInstance
              def create(callback_url: nil, trigger_value: nil, usage_category: nil, callback_method: nil, friendly_name: nil, recurring: nil, trigger_by: nil)
                data = {
                    'CallbackUrl' => callback_url,
                    'TriggerValue' => trigger_value,
                    'UsageCategory' => usage_category,
                    'CallbackMethod' => callback_method,
                    'FriendlyName' => friendly_name,
                    'Recurring' => recurring,
                    'TriggerBy' => trigger_by,
                }
                
                payload = @version.create(
                    'POST',
                    @uri,
                    data: data
                )
                
                return TriggerInstance.new(
                    @version,
                    payload,
                    account_sid: @solution['account_sid'],
                )
              end
              
              ##
              # Lists TriggerInstance records from the API as a list.
              # Unlike stream(), this operation is eager and will load `limit` records into
              # memory before returning.
              # @param trigger.Recurring recurring: Filter by recurring
              # @param trigger.TriggerField trigger_by: Filter by trigger by
              # @param trigger.UsageCategory usage_category: Filter by Usage Category
              # @param Integer limit: Upper limit for the number of records to return. stream()
              #                   guarantees to never return more than limit.  Default is no limit
              # @param Integer page_size: Number of records to fetch per request, when not set will use
              #                       the default value of 50 records.  If no page_size is defined
              #                       but a limit is defined, stream() will attempt to read the
              #                       limit with the most efficient page size, i.e. min(limit, 1000)
              
              # @return Array Array of up to limit results
              def list(recurring: nil, trigger_by: nil, usage_category: nil, limit: nil, page_size: nil)
                self.stream(
                    recurring: recurring,
                    trigger_by: trigger_by,
                    usage_category: usage_category,
                    limit: limit,
                    page_size: page_size
                ).entries
              end
              
              ##
              # Streams TriggerInstance records from the API as an Enumerable.
              # This operation lazily loads records as efficiently as possible until the limit
              # is reached.
              # @param trigger.Recurring recurring: Filter by recurring
              # @param trigger.TriggerField trigger_by: Filter by trigger by
              # @param trigger.UsageCategory usage_category: Filter by Usage Category
              # @param Integer limit: Upper limit for the number of records to return. stream()
              #                   guarantees to never return more than limit.  Default is no limit
              # @param Integer page_size: Number of records to fetch per request, when not set will use
              #                       the default value of 50 records.  If no page_size is defined
              #                       but a limit is defined, stream() will attempt to read the
              #                       limit with the most efficient page size, i.e. min(limit, 1000)
              
              # @return Enumerable Enumerable that will yield up to limit results
              def stream(recurring: nil, trigger_by: nil, usage_category: nil, limit: nil, page_size: nil)
                limits = @version.read_limits(limit, page_size)
                
                page = self.page(
                    recurring: recurring,
                    trigger_by: trigger_by,
                    usage_category: usage_category,
                    page_size: limits['page_size'],
                )
                
                @version.stream(page, limit: limits['limit'], page_limit: limits['page_limit'])
              end
              
              ##
              # When passed a block, yields TriggerInstance records from the API.
              # This operation lazily loads records as efficiently as possible until the limit
              # is reached.
              # @param trigger.Recurring recurring: Filter by recurring
              # @param trigger.TriggerField trigger_by: Filter by trigger by
              # @param trigger.UsageCategory usage_category: Filter by Usage Category
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
              # Retrieve a single page of TriggerInstance records from the API.
              # Request is executed immediately.
              # @param trigger.Recurring recurring: Filter by recurring
              # @param trigger.TriggerField trigger_by: Filter by trigger by
              # @param trigger.UsageCategory usage_category: Filter by Usage Category
              # @param String page_token: PageToken provided by the API
              # @param Integer page_number: Page Number, this value is simply for client state
              # @param Integer page_size: Number of records to return, defaults to 50
              
              # @return Page Page of TriggerInstance
              def page(recurring: nil, trigger_by: nil, usage_category: nil, page_token: nil, page_number: nil, page_size: nil)
                params = {
                    'Recurring' => recurring,
                    'TriggerBy' => trigger_by,
                    'UsageCategory' => usage_category,
                    'PageToken' => page_token,
                    'Page' => page_number,
                    'PageSize' => page_size,
                }
                response = @version.page(
                    'GET',
                    @uri,
                    params
                )
                return TriggerPage.new(
                    @version,
                    response,
                    account_sid: @solution['account_sid'],
                )
              end
              
              ##
              # Constructs a TriggerContext
              # @param sid: Fetch by unique usage-trigger Sid
              
              # @return TriggerContext TriggerContext
              def get(sid)
                TriggerContext.new(
                    @version,
                    account_sid: @solution[:account_sid],
                    sid: sid,
                )
              end
              
              ##
              # Provide a user friendly representation
              def to_s
                '#<Twilio.Api.V2010.TriggerList>'
              end
            end
          
            class TriggerPage < Page
              ##
              # Initialize the TriggerPage
              # @param Version version: Version that contains the resource
              # @param Response response: Response from the API
              # @param account_sid: A 34 character string that uniquely identifies this resource.
              
              # @return TriggerPage TriggerPage
              def initialize(version, response, account_sid: nil)
                super(version, response)
                
                # Path Solution
                @solution = {
                    'account_sid' => account_sid,
                }
              end
              
              ##
              # Build an instance of TriggerInstance
              # @param Hash payload: Payload response from the API
              
              # @return TriggerInstance TriggerInstance
              def get_instance(payload)
                return TriggerInstance.new(
                    @version,
                    payload,
                    account_sid: @solution['account_sid'],
                )
              end
              
              ##
              # Provide a user friendly representation
              def to_s
                '<Twilio.Api.V2010.TriggerPage>'
              end
            end
          
            class TriggerContext < InstanceContext
              ##
              # Initialize the TriggerContext
              # @param Version version: Version that contains the resource
              # @param account_sid: The account_sid
              # @param sid: Fetch by unique usage-trigger Sid
              
              # @return TriggerContext TriggerContext
              def initialize(version, account_sid, sid)
                super(version)
                
                # Path Solution
                @solution = {
                    account_sid: account_sid,
                    sid: sid,
                }
                @uri = "/Accounts/#{@solution[:account_sid]}/Usage/Triggers/#{@solution[:sid]}.json"
              end
              
              ##
              # Fetch a TriggerInstance
              # @return TriggerInstance Fetched TriggerInstance
              def fetch
                params = {}
                
                payload = @version.fetch(
                    'GET',
                    @uri,
                    params,
                )
                
                return TriggerInstance.new(
                    @version,
                    payload,
                    account_sid: @solution['account_sid'],
                    sid: @solution['sid'],
                )
              end
              
              ##
              # Update the TriggerInstance
              # @param String callback_method: HTTP method to use with callback_url
              # @param String callback_url: URL Twilio will request when the trigger fires
              # @param String friendly_name: A user-specified, human-readable name for the trigger.
              
              # @return TriggerInstance Updated TriggerInstance
              def update(callback_method: nil, callback_url: nil, friendly_name: nil)
                data = {
                    'CallbackMethod' => callback_method,
                    'CallbackUrl' => callback_url,
                    'FriendlyName' => friendly_name,
                }
                
                payload = @version.update(
                    'POST',
                    @uri,
                    data: data,
                )
                
                return TriggerInstance.new(
                    @version,
                    payload,
                    account_sid: @solution['account_sid'],
                    sid: @solution['sid'],
                )
              end
              
              ##
              # Deletes the TriggerInstance
              # @return Boolean true if delete succeeds, true otherwise
              def delete
                return @version.delete('delete', @uri)
              end
              
              ##
              # Provide a user friendly representation
              def to_s
                context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                "#<Twilio.Api.V2010.TriggerContext #{context}>"
              end
            end
          
            class TriggerInstance < InstanceResource
              ##
              # Initialize the TriggerInstance
              # @return TriggerInstance TriggerInstance
              def initialize(version, payload, account_sid: nil, sid: nil)
                super(version)
                
                # Marshaled Properties
                @properties = {
                    'account_sid' => payload['account_sid'],
                    'api_version' => payload['api_version'],
                    'callback_method' => payload['callback_method'],
                    'callback_url' => payload['callback_url'],
                    'current_value' => payload['current_value'],
                    'date_created' => Twilio.deserialize_rfc2822(payload['date_created']),
                    'date_fired' => Twilio.deserialize_rfc2822(payload['date_fired']),
                    'date_updated' => Twilio.deserialize_rfc2822(payload['date_updated']),
                    'friendly_name' => payload['friendly_name'],
                    'recurring' => payload['recurring'],
                    'sid' => payload['sid'],
                    'trigger_by' => payload['trigger_by'],
                    'trigger_value' => payload['trigger_value'],
                    'uri' => payload['uri'],
                    'usage_category' => payload['usage_category'],
                    'usage_record_uri' => payload['usage_record_uri'],
                }
                
                # Context
                @instance_context = nil
                @params = {
                    'account_sid' => account_sid,
                    'sid' => sid || @properties['sid'],
                }
              end
              
              ##
              # Generate an instance context for the instance, the context is capable of
              # performing various actions.  All instance actions are proxied to the context
              # @return TriggerContext TriggerContext for this TriggerInstance
              def context
                unless @instance_context
                  @instance_context = TriggerContext.new(
                      @version,
                      @params['account_sid'],
                      @params['sid'],
                  )
                end
                @instance_context
              end
              
              def account_sid
                @properties['account_sid']
              end
              
              def api_version
                @properties['api_version']
              end
              
              def callback_method
                @properties['callback_method']
              end
              
              def callback_url
                @properties['callback_url']
              end
              
              def current_value
                @properties['current_value']
              end
              
              def date_created
                @properties['date_created']
              end
              
              def date_fired
                @properties['date_fired']
              end
              
              def date_updated
                @properties['date_updated']
              end
              
              def friendly_name
                @properties['friendly_name']
              end
              
              def recurring
                @properties['recurring']
              end
              
              def sid
                @properties['sid']
              end
              
              def trigger_by
                @properties['trigger_by']
              end
              
              def trigger_value
                @properties['trigger_value']
              end
              
              def uri
                @properties['uri']
              end
              
              def usage_category
                @properties['usage_category']
              end
              
              def usage_record_uri
                @properties['usage_record_uri']
              end
              
              ##
              # Fetch a TriggerInstance
              # @return TriggerInstance Fetched TriggerInstance
              def fetch
                @context.fetch()
              end
              
              ##
              # Update the TriggerInstance
              # @param String callback_method: HTTP method to use with callback_url
              # @param String callback_url: URL Twilio will request when the trigger fires
              # @param String friendly_name: A user-specified, human-readable name for the trigger.
              
              # @return TriggerInstance Updated TriggerInstance
              def update(callback_method: nil, callback_url: nil, friendly_name: nil)
                @context.update(
                    callback_url: nil,
                    friendly_name: nil,
                )
              end
              
              ##
              # Deletes the TriggerInstance
              # @return Boolean true if delete succeeds, true otherwise
              def delete
                @context.delete()
              end
              
              ##
              # Provide a user friendly representation
              def to_s
                context = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.Api.V2010.TriggerInstance #{context}>"
              end
            end
          end
        end
      end
    end
  end
end