class MyCustomElevator < Apartment::Elevators::Generic

  # @return {String} - The tenant to switch to
  def parse_tenant_name(request)
    # request is an instance of Rack::Request

    url = request.env["HTTP_REFERER"] ? request.env["HTTP_REFERER"] : request.env["REQUEST_URI"]

    tenant_name = url.gsub(/\/(.+?)\//,'').gsub('/','').gsub('http:','').gsub('https:','')
    return tenant_name
  end
end