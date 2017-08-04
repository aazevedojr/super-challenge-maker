get '/courses' do

  Course.first.title

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

    @course = Course.new(bookmark: bookmark, title: course_title) #create new course

    if @course.save #saves new course or returns false if unsuccessful
      redirect '/courses' #redirect back to courses index page
    else
      erb :'courses/new', locals: {errors: "#{bookmark} is already registered."}
    end
  rescue Errno::ENOENT
    erb :'courses/new', locals: {errors: "#{bookmark} is not a course."}
  end
end
