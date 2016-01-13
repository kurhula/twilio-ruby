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
          class AvailablePhoneNumberCountryContext < InstanceContext
            class LocalList < ListResource
              ##
              # Initialize the LocalList
              # @param Version version: Version that contains the resource
              # @param account_sid: A 34 character string that uniquely identifies this resource.
              # @param country_code: The country_code
              
              # @return LocalList LocalList
              def initialize(version, account_sid: nil, country_code: nil)
                super(version)
                
                # Path Solution
                @solution = {
                    account_sid: account_sid,
                    country_code: country_code
                }
                @uri = "/Accounts/#{@solution[:account_sid]}/AvailablePhoneNumbers/#{@solution[:country_code]}/Local.json"
              end
              
              ##
              # Lists LocalInstance records from the API as a list.
              # Unlike stream(), this operation is eager and will load `limit` records into
              # memory before returning.
              # @param String area_code: The area_code
              # @param String contains: The contains
              # @param Boolean sms_enabled: The sms_enabled
              # @param Boolean mms_enabled: The mms_enabled
              # @param Boolean voice_enabled: The voice_enabled
              # @param Boolean exclude_all_address_required: The exclude_all_address_required
              # @param Boolean exclude_local_address_required: The exclude_local_address_required
              # @param Boolean exclude_foreign_address_required: The exclude_foreign_address_required
              # @param Boolean beta: The beta
              # @param Integer limit: Upper limit for the number of records to return. stream()
              #                   guarantees to never return more than limit.  Default is no limit
              # @param Integer page_size: Number of records to fetch per request, when not set will use
              #                       the default value of 50 records.  If no page_size is defined
              #                       but a limit is defined, stream() will attempt to read the
              #                       limit with the most efficient page size, i.e. min(limit, 1000)
              
              # @return Array Array of up to limit results
              def list(area_code: nil, contains: nil, sms_enabled: nil, mms_enabled: nil, voice_enabled: nil, exclude_all_address_required: nil, exclude_local_address_required: nil, exclude_foreign_address_required: nil, beta: nil, limit: nil, page_size: nil)
                self.stream(
                    area_code: area_code,
                    contains: contains,
                    sms_enabled: sms_enabled,
                    mms_enabled: mms_enabled,
                    voice_enabled: voice_enabled,
                    exclude_all_address_required: exclude_all_address_required,
                    exclude_local_address_required: exclude_local_address_required,
                    exclude_foreign_address_required: exclude_foreign_address_required,
                    beta: beta,
                    limit: limit,
                    page_size: page_size
                ).entries
              end
              
              ##
              # Streams LocalInstance records from the API as an Enumerable.
              # This operation lazily loads records as efficiently as possible until the limit
              # is reached.
              # @param String area_code: The area_code
              # @param String contains: The contains
              # @param Boolean sms_enabled: The sms_enabled
              # @param Boolean mms_enabled: The mms_enabled
              # @param Boolean voice_enabled: The voice_enabled
              # @param Boolean exclude_all_address_required: The exclude_all_address_required
              # @param Boolean exclude_local_address_required: The exclude_local_address_required
              # @param Boolean exclude_foreign_address_required: The exclude_foreign_address_required
              # @param Boolean beta: The beta
              # @param Integer limit: Upper limit for the number of records to return. stream()
              #                   guarantees to never return more than limit.  Default is no limit
              # @param Integer page_size: Number of records to fetch per request, when not set will use
              #                       the default value of 50 records.  If no page_size is defined
              #                       but a limit is defined, stream() will attempt to read the
              #                       limit with the most efficient page size, i.e. min(limit, 1000)
              
              # @return Enumerable Enumerable that will yield up to limit results
              def stream(area_code: nil, contains: nil, sms_enabled: nil, mms_enabled: nil, voice_enabled: nil, exclude_all_address_required: nil, exclude_local_address_required: nil, exclude_foreign_address_required: nil, beta: nil, limit: nil, page_size: nil)
                limits = @version.read_limits(limit, page_size)
                
                page = self.page(
                    area_code: area_code,
                    contains: contains,
                    sms_enabled: sms_enabled,
                    mms_enabled: mms_enabled,
                    voice_enabled: voice_enabled,
                    exclude_all_address_required: exclude_all_address_required,
                    exclude_local_address_required: exclude_local_address_required,
                    exclude_foreign_address_required: exclude_foreign_address_required,
                    beta: beta,
                    page_size: limits['page_size'],
                )
                
                @version.stream(page, limit: limits['limit'], page_limit: limits['page_limit'])
              end
              
              ##
              # When passed a block, yields LocalInstance records from the API.
              # This operation lazily loads records as efficiently as possible until the limit
              # is reached.
              # @param String area_code: The area_code
              # @param String contains: The contains
              # @param Boolean sms_enabled: The sms_enabled
              # @param Boolean mms_enabled: The mms_enabled
              # @param Boolean voice_enabled: The voice_enabled
              # @param Boolean exclude_all_address_required: The exclude_all_address_required
              # @param Boolean exclude_local_address_required: The exclude_local_address_required
              # @param Boolean exclude_foreign_address_required: The exclude_foreign_address_required
              # @param Boolean beta: The beta
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
              # Retrieve a single page of LocalInstance records from the API.
              # Request is executed immediately.
              # @param String area_code: The area_code
              # @param String contains: The contains
              # @param Boolean sms_enabled: The sms_enabled
              # @param Boolean mms_enabled: The mms_enabled
              # @param Boolean voice_enabled: The voice_enabled
              # @param Boolean exclude_all_address_required: The exclude_all_address_required
              # @param Boolean exclude_local_address_required: The exclude_local_address_required
              # @param Boolean exclude_foreign_address_required: The exclude_foreign_address_required
              # @param Boolean beta: The beta
              # @param String page_token: PageToken provided by the API
              # @param Integer page_number: Page Number, this value is simply for client state
              # @param Integer page_size: Number of records to return, defaults to 50
              
              # @return Page Page of LocalInstance
              def page(area_code: nil, contains: nil, sms_enabled: nil, mms_enabled: nil, voice_enabled: nil, exclude_all_address_required: nil, exclude_local_address_required: nil, exclude_foreign_address_required: nil, beta: nil, page_token: nil, page_number: nil, page_size: nil)
                params = {
                    'AreaCode' => area_code,
                    'Contains' => contains,
                    'SmsEnabled' => sms_enabled,
                    'MmsEnabled' => mms_enabled,
                    'VoiceEnabled' => voice_enabled,
                    'ExcludeAllAddressRequired' => exclude_all_address_required,
                    'ExcludeLocalAddressRequired' => exclude_local_address_required,
                    'ExcludeForeignAddressRequired' => exclude_foreign_address_required,
                    'Beta' => beta,
                    'PageToken' => page_token,
                    'Page' => page_number,
                    'PageSize' => page_size,
                }
                response = @version.page(
                    'GET',
                    @uri,
                    params
                )
                return LocalPage.new(
                    @version,
                    response,
                    account_sid: @solution['account_sid'],
                    country_code: @solution['country_code'],
                )
              end
              
              ##
              # Provide a user friendly representation
              def to_s
                '#<Twilio.Api.V2010.LocalList>'
              end
            end
          
            class LocalPage < Page
              ##
              # Initialize the LocalPage
              # @param Version version: Version that contains the resource
              # @param Response response: Response from the API
              # @param account_sid: A 34 character string that uniquely identifies this resource.
              # @param country_code: The country_code
              
              # @return LocalPage LocalPage
              def initialize(version, response, account_sid: nil, country_code: nil)
                super(version, response)
                
                # Path Solution
                @solution = {
                    'account_sid' => account_sid,
                    'country_code' => country_code,
                }
              end
              
              ##
              # Build an instance of LocalInstance
              # @param Hash payload: Payload response from the API
              
              # @return LocalInstance LocalInstance
              def get_instance(payload)
                return LocalInstance.new(
                    @version,
                    payload,
                    account_sid: @solution['account_sid'],
                    country_code: @solution['country_code'],
                )
              end
              
              ##
              # Provide a user friendly representation
              def to_s
                '<Twilio.Api.V2010.LocalPage>'
              end
            end
          
            class LocalInstance < InstanceResource
              ##
              # Initialize the LocalInstance
              # @return LocalInstance LocalInstance
              def initialize(version, payload, account_sid: nil, country_code: nil)
                super(version)
                
                # Marshaled Properties
                @properties = {
                    'friendly_name' => payload['friendly_name'],
                    'phone_number' => payload['phone_number'],
                    'lata' => payload['lata'],
                    'rate_center' => payload['rate_center'],
                    'latitude' => payload['latitude'].to_f,
                    'longitude' => payload['longitude'].to_f,
                    'region' => payload['region'],
                    'postal_code' => payload['postal_code'],
                    'iso_country' => payload['iso_country'],
                    'address_requirements' => payload['address_requirements'],
                    'beta' => payload['beta'],
                    'capabilities' => payload['capabilities'],
                }
              end
              
              def friendly_name
                @properties['friendly_name']
              end
              
              def phone_number
                @properties['phone_number']
              end
              
              def lata
                @properties['lata']
              end
              
              def rate_center
                @properties['rate_center']
              end
              
              def latitude
                @properties['latitude']
              end
              
              def longitude
                @properties['longitude']
              end
              
              def region
                @properties['region']
              end
              
              def postal_code
                @properties['postal_code']
              end
              
              def iso_country
                @properties['iso_country']
              end
              
              def address_requirements
                @properties['address_requirements']
              end
              
              def beta
                @properties['beta']
              end
              
              def capabilities
                @properties['capabilities']
              end
              
              ##
              # Provide a user friendly representation
              def to_s
                "<Twilio.Api.V2010.LocalInstance>"
              end
            end
          end
        end
      end
    end
  end
end