## Gembok Authenticator

Gembok Authenticator is software based (virtual) authenticator to generate 2-Steps authentication token using browser. It is written in HTML and Javascript so it should works on Google Chrome, Firefox, Safari and other browsers. It uses simple JSON file to store all data which needed to generate the token.

![Gembok Authenticator](https://s3.amazonaws.com/rioastamal-assets/gembok/01-gembok-authenticator.png)

## How to Run

Clonse this repository or download archived version from GitHub and then save it to your local machine. To run Gembok Authenticator simply open file `src/index.html` using your browser and you're ready to go.

## Create JSON File

Gembok Authenticator uses JSON file to display providers and its token. Take a look at sample below to get started.

```
[
  {
    "provider": "Google",
    "description": "Main account",
    "secret": "I5XW6Z3MMUQG2YLJNYQGCY3D",
    "period": 30,
    "digits": 6,
    "algorithm": "SHA1",
    "indicatorColor": "red"
  },
  {
    "provider": "AWS",
    "description": "Root account (john@example.com)",
    "secret": "IFLVG4TPN52GCY3D",
    "indicatorColor": "orange"
  },
  {
    "provider": "Twitter",
    "description": "john@example.com",
    "secret": "KR3WS5DUMVZC4Y3PNVVG62DO",
    "indicatorColor": "#1DA1F2"
  },
  {
    "provider": "Facebook",
    "description": "Foo account",
    "secret": "IZQWGZLCN5XWWLTD",
    "indicatorColor": "#4267B2"
  }
]
```

The only required attributes are `provider` and `secret` the rest are optional.

Save the JSON file and then use `Open File...` menu to load the file. You should now see 4 items being displayed.

## Build

The build process will generate single HTML file of the editor. It may useful if you want use it on another machine because it will be more portable.

```
$ bash build.sh
Build file build/index.html complete.
```

You can try to open file `build/index.html` using web browser.

## Extra Security

If you're paranoid then you may want to encrypt your JSON file using other encryption tools such as OpenSSL or PGP. Just before you want to load it on Gembok Authenticator you need to decrypt the file first.

## Compatibility

Gembok Authenticator uses the same algorithm as most software based authenticator such as Google Authenticator. Based on my personal limited test using various services such as Twitter and AWS I found no issue.

## Credits

Gembok Authenticator uses following library.

- https://github.com/hectorm/otpauth by [Héctor Molinero Fernández](https://github.com/hectorm/)

## ChangeLog

### v1.0

* Initial release of Gembok Authenticator (2021/08/03)

## Author

This application is written by Rio Astamal &lt;rio@rioastamal.net&gt;

## License

This application is open source licensed under [MIT license](http://opensource.org/licenses/MIT).
