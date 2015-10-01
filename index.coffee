# Dependencies
bin= require.resolve 'openjtalk/bin/open_jtalk'
express= require 'express'

path= require 'path'
execSync= require('child_process').execSync

# Environment
process.env.PORT?= 59798
DICTIONARY= path.dirname require.resolve 'openjtalk/dic/open_jtalk_dic_utf_8-1.08/char.bin'

speakers=
  CUBE370_A:
    require.resolve './CUBE370_A.htsvoice'

  CUBE370_B:
    require.resolve './CUBE370_B.htsvoice'

  CUBE370_C:
    require.resolve './CUBE370_C.htsvoice'

  CUBE370_D:
    require.resolve './CUBE370_D.htsvoice'

  mei_normal:
    require.resolve 'openjtalk/voice/mei/mei_normal.htsvoice'

  mei_happy:
    require.resolve 'openjtalk/voice/mei/mei_happy.htsvoice'

  mei_bashful:
    require.resolve 'openjtalk/voice/mei/mei_bashful.htsvoice'

  mei_angry:
    require.resolve 'openjtalk/voice/mei/mei_angry.htsvoice'

  mei_sad:
    require.resolve 'openjtalk/voice/mei/mei_sad.htsvoice'

# Routes
app= express()

# Enable CORS
app.use (req,res,next) ->
  res.set 'Access-Control-Allow-Origin','*'
  res.set 'Access-Control-Allow-Headers','X-Requested-With'
  res.set 'Access-Control-Allow-Headers','Content-Type'
  res.set 'Access-Control-Allow-Methods','GET'
  next()

app.get '/',(req,res) ->
  res.end 'powerd by http://cube370.wiki.fc2.com/'

# http://localhost:59798/はろわ -> <Buffer 52 49 46 ...>
app.get '/:words',(req,res) ->
  speaker= speakers[req.query.speaker] or speakers.CUBE370_A
  pitch= 320 - ~~req.query.pitch if req.query.pitch < 320
  pitch?= 220

  escapedWords= req.params.words.slice(0,200).replace(/(["\s'$`\\])/g,'\\$1')
  script= 'echo "'+escapedWords+'" | '+bin+' -m '+speaker+' -x '+DICTIONARY+' -p '+pitch+' -ow /dev/stdout'

  stdout= execSync script
  res.set 'Content-type','audio/wav'
  res.set 'Content-length',Buffer.byteLength stdout
  res.send stdout

# Boot
app.listen process.env.PORT,->
  console.log 'Server runnning at %s',process.env.PORT
