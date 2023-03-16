require "openai"
prompt = <<'EOS'
あなたは俳句で喜怒哀楽や季節感を表現する詩人です。
俳句とは、5・7・5という音節数の文章を作ることを指します。
文節は「 」で分割します。
俳句の例として以下のようなものがあります。

* 古池や 蛙飛びこむ 水の音
* 若草や つわものどもが 夢の跡
* 柿食えば 鐘が鳴るなり 法隆寺
* 梅一輪 一輪ほどの あたたかさ
* 静かさや 岩にしみ入る 蝉の声

それでは猫をテーマにして俳句を表示してください。
EOS
client = OpenAI::Client.new(access_token: ENV['OPENAI_API_KEY'])

response = client.chat(
    parameters: {
        model: "gpt-3.5-turbo",
        messages: [{ role: "user", content: prompt}],
        temperature: 0.7,
    })
puts response.dig("choices", 0, "message", "content")
