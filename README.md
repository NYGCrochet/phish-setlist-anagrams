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
   
   Which will produce

        G H O S T
        N I C U
        I C C U L U S
        H E A V Y T H I N G S
        T H E M E F R O M T H E B O T T O M
        E S T H E R
        M O M A D A N C E
        O C E L O T
        S T A S H
        L A W N B O Y
        L I M B B Y L I M B
        E A S Y T O S L I P
        P U N C H Y O U I N T H E E Y E
        S A N D
        S A Y S O M E T H I N G
        W A L L S O F T H E C A V E
        O H K E E P A C E R E M O N Y
        H A R R Y H O O D
        S I L E N T I N T H E M O R N I N G
        T W I S T
        S L A V E T O T H E T R A F F I C L I G H T
        O H S W E E T N U T H I N
        M E A T S T I C K

## Notes

- "The"s and "A"s at the beginning of song titles become stripped out.
