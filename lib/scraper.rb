require 'nokogiri'
require 'open-uri'

require_relative './course.rb'

class Scraper
  attr_accessor :html, :doc 
  
    def print_courses
    self.make_courses
    Course.all.each do |course|
      if course.title && course.title != ""
        puts "Title: #{course.title}"
        puts "  Schedule: #{course.schedule}"
        puts "  Description: #{course.description}"
      end
    end
  end
  
  def get_page 
    @html = open("http://learn-co-curriculum.github.io/site-for-scraping/courses") 
    
    @doc = Nokogiri::HTML(@html)
  end
  
  def get_courses 
    get_page.css(".post")
  end
  
  def make_courses 
    p 
    p
    p 
      get_courses.each do |el| 
        new_course = Course.new 
        new_course.title = el.children[3].text
        new_course.schedule = el.children[5].text
        new_course.description = el.children[7].text
      
      end
  end
end



