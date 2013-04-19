# Description:
#   butt.
#
#   Set the environment variable HUBOT_BUTT_TRIGGER_FREQ to [1, +inf) to change
#   how frequently the buttscript responds. Lower numbers correspond to more
#   responses, e.g. a value of 6 corresponds to 1 in 6 messages responded.
#
#   Similarly, set the env var HUBOT_BUTT_REPLACE_FREQ to [1, +inf) to change
#   how many words are replaced in a given phrase selected for butting.
#
# Dependencies:
#   None
#
# Configuration:
#   HUBOT_BUTT_TRIGGER_FREQ [1, +inf) - how often the buttbot script triggers, 1 = always
#   HUBOT_BUTT_REPLACE_FREQ [1, +inf) - how many words are butted, 1 = all words
#
# Commands:
#   "" - buttbot script technically triggers on every message
#
# Notes:
#   A port of buttbot, an IRC bot in perl: https://code.google.com/p/buttbot/
#
# Author:
#   devmage

# defaults
default_trigger_freq_denom = 51 # buttbot default, one in 51 messages trigger the bot
default_replace_freq_denom = 11 # buttbot default, one in 11 unique words per statement replaced
meme = "butt" # configurable I guess but[t] why would you ever want to change it...

# environment variables
trigger_env = process.env.HUBOT_BUTT_TRIGGER_FREQ
replace_env = process.env.HUBOT_BUTT_REPLACE_FREQ

# list of stopwords to ignore for butting
stopwords = [
  "a",
  "about",
  "above",
  "absent",
  "across",
  "after",
  "against",
  "all",
  "along",
  "among",
  "an",
  "and",
  "are",
  "around",
  "as",
  "at",
  "atop",
  "be",
  "before",
  "behind",
  "below",
  "beneath",
  "beside",
  "besides",
  "between",
  "beyond",
  "but",
  "by",
  "can",
  "could",
  "do",
  "down",
  "during",
  "each",
  "except",
  "for",
  "from",
  "had",
  "has",
  "have",
  "he",
  "he'll",
  "her",
  "him",
  "his",
  "how",
  "I",
  "I'm",
  "if",
  "in",
  "inside",
  "into",
  "is",
  "it",
  "it's",
  "like",
  "many",
  "might",
  "must",
  "near",
  "next",
  "not",
  "of",
  "off",
  "on",
  "one",
  "onto",
  "opposite",
  "or",
  "other",
  "out",
  "outside",
  "over",
  "past",
  "per",
  "plus",
  "round",
  "said",
  "she",
  "should",
  "since",
  "so",
  "some",
  "than",
  "that",
  "the",
  "their",
  "them",
  "then",
  "there",
  "these",
  "they",
  "they'll",
  "they're",
  "this",
  "through",
  "till",
  "times",
  "to",
  "toward",
  "towards",
  "under",
  "unlike",
  "until",
  "up",
  "upon",
  "via",
  "was",
  "we",
  "we'll",
  "we're",
  "were",
  "what",
  "when",
  "which",
  "will",
  "with",
  "within",
  "without",
  "word",
  "won't",
  "worth",
  "would",
  "you",
  "you'll",
  "you're",
  "your"
]

# message must contain at least some word characters that we can butt
is_string_buttable (str) ->
  # do a regex match on all word-like substring tokens, make sure we got something
  str.search /[a-zA-Z]+/gi > 0

how_many_butts (words) ->


buttify (words) ->
  # how many butts?
  # determine butts
  # perform buttification

  # reform string
  words.join(' ')

buttify_string (str) ->
  if is_string_buttable
    # attempt butt
    buttify(str.split(' '))
  else
    # if there's nothing we can do about it, just give it back
    str

module.exports = (robot) ->

  if trigger_env
    frequency_denom = parseInt(trigger_env)
  else
    frequency_denom = default_trigger_freq_denom

  # match on all incoming strings
  robot.hear /(.+)/i, (msg) ->
    original = escape(msg.match[1])
    butted = buttify_string(msg)
    msg.send butted	
