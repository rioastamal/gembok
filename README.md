## Gembok Authenticator

Gembok Authenticator is software based (virtual) authenticator to generate 2-Steps authentication token using browser. It is written in HTML and Javascript so it should works on Google Chrome, Firefox, Safari and other browsers. It uses simple JSON file to store all data which needed to generate the token.

![Gembok Authenticator](https://s3.amazonaws.com/rioastamal-assets/gembok/01-gembok-authenticator.png)

## How to Run

Clone this repository or download archived version from GitHub and then save it to your local machine. To run Gembok Authenticator simply open file `src/index.html` using your browser and you're ready to go.

As an alternative you can download directly `index.html` from release page using following URL.

[https://github.com/rioastamal/gembok/releases/download/v1.2/index.html](https://github.com/rioastamal/gembok/releases/download/v1.1/index.html)

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

You can also encrypt your JSON file using AES-256-CBC and Gembok Authenticator automatically try to decrypt the file and ask you the passphrase. Here is an example of above JSON encrypted with AES-256-CBC with passphrase `gembok-authenticator`.

```
U2FsdGVkX1/QSAvwH5h14leaLOcB0On3cALWPUHN4tuuvdyN4/rzh97awj0bBxXO72JneBjUIOxvHC2u+srnbW6vyykcnSsXPFidXrajeExIiYBD8SWG/AphYqnJYJGdRDb+DDnWEP/ST9ZkWCjOrQZcBTtsuBJFAMjSC2pOeA5GHZve2FFoNWQZsL1AeTJYBl7GzCenqC/Qxs9mFOuEyMs4bWakji/puY4pXpf/b4dWx7i5tktOX06LFzwnclWuqoCHzwtvnHwWDAKONZ39OD2hfY+iO/AilfnJQNhdfKVs5CyJlfwG9/NP6lYpjGpcaxm5bM6QRoEvqlKSP1KaGRQwaUcftBD+p+hdYwLq1YFjDQIXgoM680XU1mS3o0U6+4lsBzkqYrYP8HUBQEYdg5gnrCD9/3wI5TbzgnUqHAUgwI7JP6Rh/7FAwj3jkNRYOhjk58NGwORu0InzOKwIrCv8fCx/WfEMPJgczE3kL5kytMIwKX3IiedUfKNSQRGYVAU4Vo9cnLqCeWmN/V+UyFMmPiuUHa+PwtARS919nLj00MMAQfCNGv3OxPNE/6qdXAzbB3tHzuUQdcg+kEjBBErlGceaXx1CAzPgdzcnEPkJk1kERo1L4TRmGn5QmDr3Tdn82Aua0MrXEAzVxHmX7EFaEZ9mtJG9E+/MupDw5kzJqPvPEHYxSP6/fsNzvLVJ5O4euSPahvPsNCh4itTlQ9NkfIdCs/cwPaZ8Pb0e32wo46ilt03+2FVZTIzfNvZY2W+lZmUforNrZsmxnkFxQRJfWwCfFA1vBPo/1n06Lk94+mLiDS6Ag8Q/Cwfhm4aKef4fZVRePmCzeyKXNQS7M6BW07zWjDkJDX8dwup2R80=
```

## Build

The build process will generate single HTML file of the editor. It may useful if you want use it on another machine because it will be more portable.

```
$ bash build.sh
Build file build/index.html complete.
```

You can try to open file `build/index.html` using web browser.

## Extra Security

#### Option 1

You can encrypt JSON file with AES-256-CBC and Gembok Authenticathor automatically try to decrypt them. As an example you can use following OpenSSL command to encrypt.

```
$ openssl enc -aes-256-cbc -in sample.json -out encrypted.sample.json -pass pass:"gembok-authenticator" -e -base64 -A
```

#### Option 2

If you're planning to encrypt your JSON using other than AES-256-CBC, you can using other encryption tools such as OpenSSL or PGP. Keep it mind, just before you want to load it on Gembok Authenticator you need to decrypt the file first.

## Compatibility

Gembok Authenticator uses the same algorithm as most software based authenticator such as Google Authenticator. Based on my personal limited test using various services such as Twitter and AWS I found no issue.

## Credits

Gembok Authenticator uses following library.

- https://github.com/hectorm/otpauth by [Héctor Molinero Fernández](https://github.com/hectorm/)
- https://github.com/brix/crypto-js by [Evan Vosberg](https://github.com/brix/)

## ChangeLog

### v1.2 (2022/01/02)

* New feature: Ability to read JSON file which has been encrypted with AES-256-CBC.

### v1.1 (2021/09/19)

* New feature: Copy token to clipboard

### v1.0 (2021/08/03)

* Initial release of Gembok Authenticator

## Author

This application is written by Rio Astamal &lt;rio@rioastamal.net&gt;

## License

This application is open source licensed under [MIT license](http://opensource.org/licenses/MIT).
