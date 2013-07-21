get '/' do
  @events = Event.all
  erb :index
end

get '/events/:id/show' do |id|
  @event = Event.find(id)
  erb :event_show
end

get '/events/new' do
  erb :new_event
end

post '/events/create' do
  @event = Event.create(params[:event])
  if @event.errors.any?
    redirect to('/events/new')
  else
    redirect to('/')
  end
end
