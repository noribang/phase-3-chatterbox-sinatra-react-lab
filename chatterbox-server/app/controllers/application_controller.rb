class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add routes

  # read
  get '/messages' do
    messages = Message.all.order(:created_at)
    messages.to_json
  end

  # create
  post '/messages' do
    # create instance
    messages = Message.create(
      body: params[:body],
      username: params[:username]
    )
    # send response
    messages.to_json
  end

  # update
  patch '/messages/:id' do
    # find it
    message = Message.find(params[:id])
    # update instance
    message.update(
      body: params[:body]
    )
    # send response
    message.to_json
  end

  # destroy
  delete '/messages/:id' do
    # find the message by ID
    message = Message.find(params[:id])
    # delete the instance
    message.destroy
    # send response with deleted instance
    message.to_json
  end

  
end
