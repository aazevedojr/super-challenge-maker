get '/courses' do
  @courses = Course.all #define instance variable for view
  erb :'courses/index' #show all courses view (index)
end

get '/courses/new' do
  erb :'courses/new' #show new courses view
end

def to_url(code)
  "https://supermariomakerbookmark.nintendo.net/courses/" + code
end

post '/courses' do
  bookmark = params[:bookmark]
  begin
    doc = Nokogiri::HTML(open(to_url(bookmark)))
    #creator_id = /\/profile\/(.*)\?/.match(doc.css('.course-detail-wrapper a#mii')[0].attributes['href'].value)[1]
    #creator_name = doc.css('.creator-info .name')[0].content
    course_title = doc.css('.course-title')[0].content

    @challenge = Challenge.find(params[:challenge_id])
    @course = @challenge.courses.new(bookmark: bookmark, title: course_title)

    if @course.save
      redirect "/challenges/#{@challenge.id}"
    else
      @errors = "#{params[:bookmark]} is already registered."
      erb :"challenges/#{@challenge.id}"
    end
  rescue
    @errors = "#{params[:bookmark]} is not a course."
    erb :"challenges/#{@challenge.id}"
  end
end
