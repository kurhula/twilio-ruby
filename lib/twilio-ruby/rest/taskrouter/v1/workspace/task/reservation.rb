##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /       

module Twilio
  module REST
    class Taskrouter < Domain
      class V1 < Version
        class WorkspaceContext < InstanceContext
          class TaskContext < InstanceContext
            class ReservationList < ListResource
              ##
              # Initialize the ReservationList
              # @param Version version: Version that contains the resource
              # @param workspace_sid: The workspace_sid
              # @param task_sid: The task_sid
              
              # @return ReservationList ReservationList
              def initialize(version, workspace_sid: nil, task_sid: nil)
                super(version)
                
                # Path Solution
                @solution = {
                    workspace_sid: workspace_sid,
                    task_sid: task_sid
                }
                @uri = "/Workspaces/#{@solution[:workspace_sid]}/Tasks/#{@solution[:task_sid]}/Reservations"
              end
              
              ##
              # Lists ReservationInstance records from the API as a list.
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
              # Streams ReservationInstance records from the API as an Enumerable.
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
              # When passed a block, yields ReservationInstance records from the API.
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
              # Retrieve a single page of ReservationInstance records from the API.
              # Request is executed immediately.
              # @param String page_token: PageToken provided by the API
              # @param Integer page_number: Page Number, this value is simply for client state
              # @param Integer page_size: Number of records to return, defaults to 50
              
              # @return Page Page of ReservationInstance
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
                return ReservationPage.new(
                    @version,
                    response,
                    workspace_sid: @solution['workspace_sid'],
                    task_sid: @solution['task_sid'],
                )
              end
              
              ##
              # Constructs a ReservationContext
              # @param sid: The sid
              
              # @return ReservationContext ReservationContext
              def get(sid)
                ReservationContext.new(
                    @version,
                    workspace_sid: @solution[:workspace_sid],
                    task_sid: @solution[:task_sid],
                    sid: sid,
                )
              end
              
              ##
              # Provide a user friendly representation
              def to_s
                '#<Twilio.Taskrouter.V1.ReservationList>'
              end
            end
          
            class ReservationPage < Page
              ##
              # Initialize the ReservationPage
              # @param Version version: Version that contains the resource
              # @param Response response: Response from the API
              # @param workspace_sid: The workspace_sid
              # @param task_sid: The task_sid
              
              # @return ReservationPage ReservationPage
              def initialize(version, response, workspace_sid: nil, task_sid: nil)
                super(version, response)
                
                # Path Solution
                @solution = {
                    'workspace_sid' => workspace_sid,
                    'task_sid' => task_sid,
                }
              end
              
              ##
              # Build an instance of ReservationInstance
              # @param Hash payload: Payload response from the API
              
              # @return ReservationInstance ReservationInstance
              def get_instance(payload)
                return ReservationInstance.new(
                    @version,
                    payload,
                    workspace_sid: @solution['workspace_sid'],
                    task_sid: @solution['task_sid'],
                )
              end
              
              ##
              # Provide a user friendly representation
              def to_s
                '<Twilio.Taskrouter.V1.ReservationPage>'
              end
            end
          
            class ReservationContext < InstanceContext
              ##
              # Initialize the ReservationContext
              # @param Version version: Version that contains the resource
              # @param workspace_sid: The workspace_sid
              # @param task_sid: The task_sid
              # @param sid: The sid
              
              # @return ReservationContext ReservationContext
              def initialize(version, workspace_sid, task_sid, sid)
                super(version)
                
                # Path Solution
                @solution = {
                    workspace_sid: workspace_sid,
                    task_sid: task_sid,
                    sid: sid,
                }
                @uri = "/Workspaces/#{@solution[:workspace_sid]}/Tasks/#{@solution[:task_sid]}/Reservations/#{@solution[:sid]}"
              end
              
              ##
              # Fetch a ReservationInstance
              # @return ReservationInstance Fetched ReservationInstance
              def fetch
                params = {}
                
                payload = @version.fetch(
                    'GET',
                    @uri,
                    params,
                )
                
                return ReservationInstance.new(
                    @version,
                    payload,
                    workspace_sid: @solution['workspace_sid'],
                    task_sid: @solution['task_sid'],
                    sid: @solution['sid'],
                )
              end
              
              ##
              # Update the ReservationInstance
              # @param String reservation_status: The reservation_status
              # @param String worker_activity_sid: The worker_activity_sid
              
              # @return ReservationInstance Updated ReservationInstance
              def update(reservation_status: nil, worker_activity_sid: nil)
                data = {
                    'ReservationStatus' => reservation_status,
                    'WorkerActivitySid' => worker_activity_sid,
                }
                
                payload = @version.update(
                    'POST',
                    @uri,
                    data: data,
                )
                
                return ReservationInstance.new(
                    @version,
                    payload,
                    workspace_sid: @solution['workspace_sid'],
                    task_sid: @solution['task_sid'],
                    sid: @solution['sid'],
                )
              end
              
              ##
              # Provide a user friendly representation
              def to_s
                context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                "#<Twilio.Taskrouter.V1.ReservationContext #{context}>"
              end
            end
          
            class ReservationInstance < InstanceResource
              ##
              # Initialize the ReservationInstance
              # @return ReservationInstance ReservationInstance
              def initialize(version, payload, workspace_sid: nil, task_sid: nil, sid: nil)
                super(version)
                
                # Marshaled Properties
                @properties = {
                    'account_sid' => payload['account_sid'],
                    'date_created' => Twilio.deserialize_iso8601(payload['date_created']),
                    'date_updated' => Twilio.deserialize_iso8601(payload['date_updated']),
                    'reservation_status' => payload['reservation_status'],
                    'sid' => payload['sid'],
                    'task_sid' => payload['task_sid'],
                    'worker_name' => payload['worker_name'],
                    'worker_sid' => payload['worker_sid'],
                    'workspace_sid' => payload['workspace_sid'],
                }
                
                # Context
                @instance_context = nil
                @params = {
                    'workspace_sid' => workspace_sid,
                    'task_sid' => task_sid,
                    'sid' => sid || @properties['sid'],
                }
              end
              
              ##
              # Generate an instance context for the instance, the context is capable of
              # performing various actions.  All instance actions are proxied to the context
              # @return ReservationContext ReservationContext for this ReservationInstance
              def context
                unless @instance_context
                  @instance_context = ReservationContext.new(
                      @version,
                      @params['workspace_sid'],
                      @params['task_sid'],
                      @params['sid'],
                  )
                end
                @instance_context
              end
              
              def account_sid
                @properties['account_sid']
              end
              
              def date_created
                @properties['date_created']
              end
              
              def date_updated
                @properties['date_updated']
              end
              
              def reservation_status
                @properties['reservation_status']
              end
              
              def sid
                @properties['sid']
              end
              
              def task_sid
                @properties['task_sid']
              end
              
              def worker_name
                @properties['worker_name']
              end
              
              def worker_sid
                @properties['worker_sid']
              end
              
              def workspace_sid
                @properties['workspace_sid']
              end
              
              ##
              # Fetch a ReservationInstance
              # @return ReservationInstance Fetched ReservationInstance
              def fetch
                @context.fetch()
              end
              
              ##
              # Update the ReservationInstance
              # @param String reservation_status: The reservation_status
              # @param String worker_activity_sid: The worker_activity_sid
              
              # @return ReservationInstance Updated ReservationInstance
              def update(reservation_status: nil, worker_activity_sid: nil)
                @context.update(
                    worker_activity_sid: nil,
                )
              end
              
              ##
              # Provide a user friendly representation
              def to_s
                context = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.Taskrouter.V1.ReservationInstance #{context}>"
              end
            end
          end
        end
      end
    end
  end
end