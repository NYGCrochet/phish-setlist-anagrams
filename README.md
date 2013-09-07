## Phish Setlist Anagrams

The gag on the first night of Dicks 2013 spelled out "MOST SHOWS SPELL SOMETHING", backwards.  [Brad Sterling later revealed](https://twitter.com/Phish_Forum/status/376135055040843776) Trey had a setlist for the second night that spelled out "It's not always the first letter".  This is a tool to help find anagrams and visual patterns in Phish setlists.

## Usage

setlist_anagram.rb can be used either as a Ruby class or a command line utility.  To get setup and use on the command line:

1. Create an API key on Phish.net and add it to the file `config/phishnet_key`

	echo YOUR_KEY > config/phishnet_key

2. Install needed gems via Bundler

	bundle

2. Run command and provide a date

	ruby setlist_anagram 8/30/2013

## Notes

- "The"s and "A"s at the beginning of song titles become stripped out.