# Furirubi
Translate kanji to furigana and with the ruby HTML format. Based on https://jisho.org/.

e.g.
> 世界 経済 フォーラム は => <ruby>世界<rt>せかい</rt></ruby><ruby>経済<rt>けいざい</rt></ruby>フォーラムは
>
> Notice: Translation result is inaccurate. It needs to be confirmed again if it's going to be used on business

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'furirubi'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install furirubi

## Usage
```ruby
Furirubi.parse('世界 経済 フォーラム は')

=> "<ruby>世界<rt>せかい</rt></ruby><ruby>経済<rt>けいざい</rt></ruby>フォーラムは"
```

# Roadmap
 - [ ] Testing
 - [ ] Support other dictionaries

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

