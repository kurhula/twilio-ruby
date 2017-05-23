##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

require 'spec_helper.rb'

describe 'HostedNumberOrder' do
  it "can fetch" do
    @holodeck.mock(Twilio::TwilioResponse.new(500, ''))

    expect {
      @client.preview.hosted_numbers.hosted_number_orders("HRaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa").fetch()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://preview.twilio.com/HostedNumbers/HostedNumberOrders/HRaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Twilio::TwilioResponse.new(
        200,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "address_sid": "AD11111111111111111111111111111111",
          "capabilities": {
              "sms": true,
              "voice": false
          },
          "cc_emails": [
              "aaa@twilio.com",
              "bbb@twilio.com"
          ],
          "date_created": "2017-03-28T20:06:39Z",
          "date_updated": "2017-03-28T20:06:39Z",
          "email": "test@twilio.com",
          "friendly_name": "friendly_name",
          "incoming_phone_number_sid": "PN11111111111111111111111111111111",
          "phone_number": "+14153608311",
          "sid": "HRaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "signing_document_sid": "PX11111111111111111111111111111111",
          "status": "received",
          "unique_name": "foobar",
          "url": "https://preview.twilio.com/HostedNumbers/HostedNumberOrders/HRaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
      ]
    ))

    actual = @client.preview.hosted_numbers.hosted_number_orders("HRaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa").fetch()

    expect(actual).to_not eq(nil)
  end

  it "can delete" do
    @holodeck.mock(Twilio::TwilioResponse.new(500, ''))

    expect {
      @client.preview.hosted_numbers.hosted_number_orders("HRaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa").delete()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'delete',
        url: 'https://preview.twilio.com/HostedNumbers/HostedNumberOrders/HRaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
    ))).to eq(true)
  end

  it "receives delete responses" do
    @holodeck.mock(Twilio::TwilioResponse.new(
        204,
      nil,
    ))

    actual = @client.preview.hosted_numbers.hosted_number_orders("HRaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa").delete()

    expect(actual).to eq(true)
  end

  it "can update" do
    @holodeck.mock(Twilio::TwilioResponse.new(500, ''))

    expect {
      @client.preview.hosted_numbers.hosted_number_orders("HRaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa").update()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://preview.twilio.com/HostedNumbers/HostedNumberOrders/HRaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
    ))).to eq(true)
  end

  it "receives update responses" do
    @holodeck.mock(Twilio::TwilioResponse.new(
        200,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "address_sid": "AD11111111111111111111111111111111",
          "capabilities": {
              "sms": true,
              "voice": false
          },
          "cc_emails": [
              "test1@twilio.com",
              "test2@twilio.com"
          ],
          "date_created": "2017-03-28T20:06:39Z",
          "date_updated": "2017-03-28T20:06:39Z",
          "email": "test+hosted@twilio.com",
          "friendly_name": "new friendly name",
          "incoming_phone_number_sid": "PN11111111111111111111111111111111",
          "phone_number": "+14153608311",
          "sid": "HRaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "signing_document_sid": "PX11111111111111111111111111111111",
          "status": "pending-loa",
          "unique_name": "new unique name",
          "url": "https://preview.twilio.com/HostedNumbers/HostedNumberOrders/HRaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
      ]
    ))

    actual = @client.preview.hosted_numbers.hosted_number_orders("HRaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa").update()

    expect(actual).to_not eq(nil)
  end

  it "can read" do
    @holodeck.mock(Twilio::TwilioResponse.new(500, ''))

    expect {
      @client.preview.hosted_numbers.hosted_number_orders.list()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://preview.twilio.com/HostedNumbers/HostedNumberOrders',
    ))).to eq(true)
  end

  it "receives read_empty responses" do
    @holodeck.mock(Twilio::TwilioResponse.new(
        200,
      %q[
      {
          "meta": {
              "first_page_url": "https://preview.twilio.com/HostedNumbers/HostedNumberOrders?PageSize=50&Page=0",
              "key": "items",
              "next_page_url": null,
              "page": 0,
              "page_size": 50,
              "previous_page_url": null,
              "url": "https://preview.twilio.com/HostedNumbers/HostedNumberOrders?PageSize=50&Page=0"
          },
          "items": []
      }
      ]
    ))

    actual = @client.preview.hosted_numbers.hosted_number_orders.list()

    expect(actual).to_not eq(nil)
  end

  it "receives read_full responses" do
    @holodeck.mock(Twilio::TwilioResponse.new(
        200,
      %q[
      {
          "meta": {
              "first_page_url": "https://preview.twilio.com/HostedNumbers/HostedNumberOrders?PageSize=50&Page=0",
              "key": "items",
              "next_page_url": null,
              "page": 0,
              "page_size": 50,
              "previous_page_url": null,
              "url": "https://preview.twilio.com/HostedNumbers/HostedNumberOrders?PageSize=50&Page=0"
          },
          "items": [
              {
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "address_sid": "AD11111111111111111111111111111111",
                  "capabilities": {
                      "sms": true,
                      "voice": false
                  },
                  "cc_emails": [
                      "aaa@twilio.com",
                      "bbb@twilio.com"
                  ],
                  "date_created": "2017-03-28T20:06:39Z",
                  "date_updated": "2017-03-28T20:06:39Z",
                  "email": "test@twilio.com",
                  "friendly_name": "friendly_name",
                  "incoming_phone_number_sid": "PN11111111111111111111111111111111",
                  "phone_number": "+14153608311",
                  "sid": "HRaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "signing_document_sid": "PX11111111111111111111111111111111",
                  "status": "received",
                  "unique_name": "foobar",
                  "url": "https://preview.twilio.com/HostedNumbers/HostedNumberOrders/HRaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
              }
          ]
      }
      ]
    ))

    actual = @client.preview.hosted_numbers.hosted_number_orders.list()

    expect(actual).to_not eq(nil)
  end

  it "can create" do
    @holodeck.mock(Twilio::TwilioResponse.new(500, ''))

    expect {
      @client.preview.hosted_numbers.hosted_number_orders.create(address_sid: "ADaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", phone_number: "+987654321", type: "local", iso_country: "iso_country", sms_capability: true, email: "email")
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {
        'AddressSid' => "ADaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
        'PhoneNumber' => "+987654321",
        'Type' => "local",
        'IsoCountry' => "iso_country",
        'SmsCapability' => true,
        'Email' => "email",
    }
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://preview.twilio.com/HostedNumbers/HostedNumberOrders',
        data: values,
    ))).to eq(true)
  end

  it "receives create responses" do
    @holodeck.mock(Twilio::TwilioResponse.new(
        201,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "address_sid": "AD11111111111111111111111111111111",
          "capabilities": {
              "sms": true,
              "voice": false
          },
          "cc_emails": [],
          "date_created": "2017-03-28T20:06:39Z",
          "date_updated": "2017-03-28T20:06:39Z",
          "email": "test@twilio.com",
          "friendly_name": null,
          "incoming_phone_number_sid": "PN11111111111111111111111111111111",
          "phone_number": "+14153608311",
          "sid": "HRaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "signing_document_sid": null,
          "status": "received",
          "unique_name": null,
          "url": "https://preview.twilio.com/HostedNumbers/HostedNumberOrders/HRaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
      ]
    ))

    actual = @client.preview.hosted_numbers.hosted_number_orders.create(address_sid: "ADaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", phone_number: "+987654321", type: "local", iso_country: "iso_country", sms_capability: true, email: "email")

    expect(actual).to_not eq(nil)
  end
end