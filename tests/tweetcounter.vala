
void simple () {
  var text = "abc";
  var length = Cb.TweetCounter.count_chars (text);

  assert (length == 3);
}

void simple_utf8 () {
  var text = "¥¥²³¤";
  var length = Cb.TweetCounter.count_chars (text);

  assert (length == 5);
}

void simple_http () {
  var text = "http://verylongdomainthisisneversoshort.com";
  var length = Cb.TweetCounter.count_chars (text);

  assert (length == Twitter.short_url_length);
}

void simple_https () {
  var text = "https://verylongdomainthisisneversoshort.com";
  var length = Cb.TweetCounter.count_chars (text);

  assert (length == Twitter.short_url_length);
}

void link_punctuation () {
  var text = "foobar(http://abc.com)";

  var length = TweetUtils.calc_tweet_length (text);
  message ("Length: %d", length);
  assert (length == 6 + 1 + Twitter.short_url_length + 1);

}


int main (string[] args) {
  GLib.Test.init (ref args);

  GLib.Test.add_func ("/tweetcounter/simple", simple);
  GLib.Test.add_func ("/tweetcounter/simple-utf8", simple_utf8);
  GLib.Test.add_func ("/tweetcounter/simple-http", simple_http);
  GLib.Test.add_func ("/tweetcounter/simple-https", simple_https);
  GLib.Test.add_func ("/tweetcounter/link-punctuation", link_punctuation);

  return GLib.Test.run ();
}