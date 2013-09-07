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
        puts t.split('').join(' ')
      end
  end

  def [](n)
    @titles.map{ |t| t.gsub(/\s/, '') }.map{ |t| t[n] }
  end

end

if __FILE__ == $0
  sa = SetlistAnagram.new ARGV[0]
  sa.pp_titles
end