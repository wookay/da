# source from
# http://github.com/azisaka/google-translate-api
#
# A API for Google Translator
# 
# Copyright (C) 2008 Bruno Azisaka Maciel (dookie)
# For contact me bruno at dookie dot com dot br
# 
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

require 'rubygems'
require 'whatlanguage'  # gem install whatlanguage
require 'htmlentities'  # gem install htmlentities
require 'net/http'
require 'json'
require 'cgi'
require 'uri'

class WhatLanguage
  def abbr(text)
    case language(text)
    when :english; 'en'
    when :portuguese; 'pt'
    when :spanish; 'es'
    end
  end
end


class GoogleTranslate
  attr_accessor :text, :tl
  
  def initialize(text, tl="pt")
    what_language(text)  
    @tl = tl
    @uri = URI.parse("http://ajax.googleapis.com/ajax/services/language/translate")
  end
  
  def translate(text=nil)
    what_language(text) unless text.nil?
    
    coder = HTMLEntities.new
    
    coder.decode(JSON.parse(request)['responseData']['translatedText'])
  end
  
  private
  def what_language(text)
    @wl = WhatLanguage.new(:all)
    @text = text
    @sl = @wl.abbr(text)
  end
  
  def request
    Net::HTTP.get(@uri.host, "#{@uri.path}?#{params}")
  end
  
  def params
    { :langpair => "#{@sl}|#{@tl}", 
      :q => @text,
      :v => 1.0 }.map { |k,v| "#{k}=#{CGI.escape(v.to_s)}" }.join('&')
  end
end


#class String
#  def method_missing(method, *args)
#    if method.to_s =~ /^to_\w{2}$/
#      GoogleTranslate.new(self, method.to_s.match(/^to_(\w{2})$/)[1]).translate
#    else
#      super(method, args)
#    end
#  end
#end
