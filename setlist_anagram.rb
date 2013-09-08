require_relative 'lib/show'

class SetlistAnagram
  attr_accessor :titles

  def initialize(date, opts = {})
    @show = Show.new date
    @opts = opts

    set_clean_titles
  end

  def set_clean_titles
    @titles = @show.songs.map(&:upcase)

    @titles.map!{ |t| t.gsub(/^THE |^A /, '') } unless @opts[:'preserve-articles']
    @titles.map!{ |t| t.gsub(/[^0-9A-Z ]/i, '') }
  end

  def pp_titles()
    if @opts[:reverse]
      titles = @titles.reverse
    else
      titles = @titles
    end

    titles
      .map{ |t| t.gsub(/\s/, '') }
      .each do |t| 
        title = @opts[:'reverse-letters'] ? t.reverse : t
        puts title.split('').join(' ')
      end
  end

  def [](n)
    @titles.map{ |t| t.gsub(/\s/, '') }.map{ |t| t[n] }
  end

end

if __FILE__ == $0
  require 'trollop'
  opts = Trollop::options do
    opt :reverse, "Display song list in reverse"
    opt :'reverse-letters', "Display song titles in reverse", {:short => 'l'}
    opt :'preserve-articles', "Preserve 'The' and 'A' at the beginning of song titles"
  end

  sa = SetlistAnagram.new ARGV[0], opts
  sa.pp_titles
end