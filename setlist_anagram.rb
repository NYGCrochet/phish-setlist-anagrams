require_relative 'lib/show'

class SetlistAnagram
  attr_accessor :titles

  def initialize date
    @show = Show.new date

    set_clean_titles
  end

  def set_clean_titles
    @titles = @show.songs
                .map!(&:upcase)
                .map!{ |t| t.gsub(/^THE |^A /, '') }
                .map!{ |t| t.gsub(/[^0-9A-Z ]/i, '') }
  end

  def pp_titles(opts = {})
    if opts[:reverse]
      titles = @titles.reverse
    else
      titles = @titles
    end

    titles
      .map{ |t| t.gsub(/\s/, '') }
      .each do |t| 
        title = opts[:'reverse-letters'] ? t.reverse : t
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
  end

  sa = SetlistAnagram.new ARGV[0]
  sa.pp_titles(opts)
end