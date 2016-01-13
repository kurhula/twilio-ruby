##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /       

module Twilio
  module REST
    class Conversations < Domain
      class V1 < Version
        class ConversationList < ListResource
          ##
          # Initialize the ConversationList
          # @param Version version: Version that contains the resource
          
          # @return ConversationList ConversationList
          def initialize(version)
            super(version)
            
            # Path Solution
            @solution = {}
            
            # Components
            @in_progress = nil
            @completed = nil
          end
          
          ##
          # Access the in_progress
          # @return InProgressList InProgressList
          def in_progress
            @in_progress ||= InProgressList.new(
                @version,
            )
          end
          
          ##
          # Access the completed
          # @return CompletedList CompletedList
          def completed
            @completed ||= CompletedList.new(
                @version,
            )
          end
          
          ##
          # Constructs a ConversationContext
          # @param sid: The sid
          
          # @return ConversationContext ConversationContext
          def get(sid)
            ConversationContext.new(
                @version,
                sid: sid,
            )
          end
          
          ##
          # Provide a user friendly representation
          def to_s
            '#<Twilio.Conversations.V1.ConversationList>'
          end
        end
      
        class ConversationPage < Page
          ##
          # Initialize the ConversationPage
          # @param Version version: Version that contains the resource
          # @param Response response: Response from the API
          
          # @return ConversationPage ConversationPage
          def initialize(version, response)
            super(version, response)
            
            # Path Solution
            @solution = {}
          end
          
          ##
          # Build an instance of ConversationInstance
          # @param Hash payload: Payload response from the API
          
          # @return ConversationInstance ConversationInstance
          def get_instance(payload)
            return ConversationInstance.new(
                @version,
                payload,
            )
          end
          
          ##
          # Provide a user friendly representation
          def to_s
            '<Twilio.Conversations.V1.ConversationPage>'
          end
        end
      
        class ConversationContext < InstanceContext
          ##
          # Initialize the ConversationContext
          # @param Version version: Version that contains the resource
          # @param sid: The sid
          
          # @return ConversationContext ConversationContext
          def initialize(version, sid)
            super(version)
            
            # Path Solution
            @solution = {
                sid: sid,
            }
            @uri = "/Conversations/#{@solution[:sid]}"
            
            # Dependents
            @participants = nil
          end
          
          ##
          # Fetch a ConversationInstance
          # @return ConversationInstance Fetched ConversationInstance
          def fetch
            params = {}
            
            payload = @version.fetch(
                'GET',
                @uri,
                params,
            )
            
            return ConversationInstance.new(
                @version,
                payload,
                sid: @solution['sid'],
            )
          end
          
          ##
          # Access the participants
          # @return ParticipantList ParticipantList
          def participants(sid=:unset)
            if sid != :unset
              return ParticipantContext.new(
                  @version,
                  @solution[:sid],
                  sid,
              )
            end
            
            unless @participants
              @participants = ParticipantList.new(
                  @version,
                  conversation_sid: @solution[:sid],
              )
            end
            
            @participants
          end
          
          ##
          # Provide a user friendly representation
          def to_s
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Conversations.V1.ConversationContext #{context}>"
          end
        end
      
        class ConversationInstance < InstanceResource
          ##
          # Initialize the ConversationInstance
          # @return ConversationInstance ConversationInstance
          def initialize(version, payload, sid: nil)
            super(version)
            
            # Marshaled Properties
            @properties = {
                'sid' => payload['sid'],
                'status' => payload['status'],
                'duration' => payload['duration'].to_i,
                'date_created' => Twilio.deserialize_iso8601(payload['date_created']),
                'start_time' => Twilio.deserialize_iso8601(payload['start_time']),
                'end_time' => Twilio.deserialize_iso8601(payload['end_time']),
                'account_sid' => payload['account_sid'],
                'url' => payload['url'],
            }
            
            # Context
            @instance_context = nil
            @params = {
                'sid' => sid || @properties['sid'],
            }
          end
          
          ##
          # Generate an instance context for the instance, the context is capable of
          # performing various actions.  All instance actions are proxied to the context
          # @return ConversationContext ConversationContext for this ConversationInstance
          def context
            unless @instance_context
              @instance_context = ConversationContext.new(
                  @version,
                  @params['sid'],
              )
            end
            @instance_context
          end
          
          def sid
            @properties['sid']
          end
          
          def status
            @properties['status']
          end
          
          def duration
            @properties['duration']
          end
          
          def date_created
            @properties['date_created']
          end
          
          def start_time
            @properties['start_time']
          end
          
          def end_time
            @properties['end_time']
          end
          
          def account_sid
            @properties['account_sid']
          end
          
          def url
            @properties['url']
          end
          
          ##
          # Fetch a ConversationInstance
          # @return ConversationInstance Fetched ConversationInstance
          def fetch
            @context.fetch()
          end
          
          ##
          # Access the participants
          # @return participants participants
          def participants
            @context.participants
          end
          
          ##
          # Provide a user friendly representation
          def to_s
            context = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Conversations.V1.ConversationInstance #{context}>"
          end
        end
      end
    end
  end
end