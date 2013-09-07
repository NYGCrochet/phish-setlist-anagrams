require 'nokogiri'
require_relative 'pnet'

class Show

  PNET_KEY = File.read('config/phishnet_key').chomp

  attr_reader :songs

  def initialize date
    @pnet = PNet.new PNET_KEY
    @data  = @pnet.shows_setlists_get('showdate' => format_date(date))[0];
    @songs = []

    Nokogiri::HTML(@data["setlistdata"]).css('p.pnetset').each do |set|
      @songs << set.css('a').map(&:content)
    end

    @songs.flatten!
  end

  private

  def format_date(date)
    month, day, year = date.split('/')
    "%d-%02d-%02d" % [year, month, day]
  end
end