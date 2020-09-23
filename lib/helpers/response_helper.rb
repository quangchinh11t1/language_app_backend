module ResponseHelper
  def format_response message = "message", data = {}
    {code: 200, message: message, data: data}
  end

  def format_response_error errors
    {code: 500, errors: errors}
  end
end
