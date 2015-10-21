[openjtalk.berabou.me](http://openjtalk.berabou.me/)
---

[ハローワールド](http://openjtalk.berabou.me/%E3%83%8F%E3%83%AD%E3%83%BC%E3%83%AF%E3%83%BC%E3%83%AB%E3%83%89)

# API
* `http://openjtalk.berabou.me/:voicetext`
* `http://openjtalk.berabou.me/:voicetext?pitch=1-320`
* `http://openjtalk.berabou.me/:voicetext?pitch=1-320&speaker=speakerName`

## SpeakerName
* `CUBE370_A`
* `CUBE370_B`
* `CUBE370_C`
* `CUBE370_D`
* `mei_normal`
* `mei_happy`
* `mei_bashful`
* `mei_angry`
* `mei_sad`

## 参考
* [Open JTalkでメイちゃんにしゃべってもらう - 人工知能に関する断創録](http://aidiary.hatenablog.com/entry/20131006/1381061297)
* [自作音響モデル - CUBE370 MMDAgent & Project-NAIP wiki](http://cube370.wiki.fc2.com/wiki/%E8%87%AA%E4%BD%9C%E9%9F%B3%E9%9F%BF%E3%83%A2%E3%83%87%E3%83%AB)
* [OpenJTalk を使って Node.js で音声合成するモジュール作った - 凹みTips](http://tips.hecomi.com/entry/20121203/1354546047)

# Setup & Boot

gitおよびNodeJSとbowerのインストールが終了していることが前提です。ターミナル／cmder環境下で

```bash
git clone https://github.com/59naga/openjtalk.berabou.me.git
cd openjtalk.berabou.me

npm install coffee-script --global # optional
npm install
npm start
# Server running at http://localhost:59798
```

とすることで、`http://localhost:59798`上に、開発環境を起動できます。

License
---
[MIT][License]

[License]: http://59naga.mit-license.org/
